import 'dart:io';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/daos/tag_dao.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';

/// Pannable, zoomable map with pins that link to other entries.
///
/// Pin positions are stored as fractions of the image, so the maths here is
/// only ever converting between that and the laid-out image rectangle.
class MapViewScreen extends ConsumerStatefulWidget {
  const MapViewScreen({
    super.key,
    required this.projectId,
    required this.locationId,
  });

  final String projectId;
  final String locationId;

  @override
  ConsumerState<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends ConsumerState<MapViewScreen> {
  final _transformController = TransformationController();
  bool _editing = false;

  @override
  void dispose() {
    _transformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final locationAsync = ref.watch(locationStreamProvider(widget.locationId));
    final pinsAsync = ref.watch(mapPinsStreamProvider(widget.locationId));

    return Scaffold(
      appBar: AppBar(
        title: Text(locationAsync.valueOrNull?.name ?? l.mapTitle),
        actions: [
          IconButton(
            icon: Icon(_editing ? Icons.done : Icons.edit_location_alt_outlined),
            tooltip: _editing ? l.mapDone : l.mapPlaceMarkers,
            onPressed: () => setState(() => _editing = !_editing),
          ),
        ],
      ),
      body: locationAsync.when(
        data: (location) {
          final path = location.mapImagePath;
          if (path == null || path.isEmpty) {
            return _NoMapYet(projectId: widget.projectId, location: location);
          }

          return FutureBuilder<File>(
            future: ref.read(imageStorageServiceProvider).resolveFile(path),
            builder: (context, snapshot) {
              final file = snapshot.data;
              if (file == null) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!file.existsSync()) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(l.mapNoFile),
                  ),
                );
              }

              return Column(
                children: [
                  if (_editing)
                    Material(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(Icons.touch_app_outlined),
                            const SizedBox(width: 8),
                            Expanded(child: Text(l.mapEditHint)),
                          ],
                        ),
                      ),
                    ),
                  Expanded(
                    child: pinsAsync.when(
                      data: (pins) => _MapCanvas(
                        projectId: widget.projectId,
                        mapLocationId: widget.locationId,
                        file: file,
                        pins: pins,
                        editing: _editing,
                        controller: _transformController,
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, st) => Center(child: Text('Error: $e')),
                    ),
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _NoMapYet extends StatelessWidget {
  const _NoMapYet({required this.projectId, required this.location});

  final String projectId;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.map_outlined, size: 48),
            const SizedBox(height: 12),
            Text(
              L.of(context).mapNoMapYet(location.name),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              L.of(context).mapNoMapHint,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () =>
                  context.push('/project/$projectId/world/${location.id}'),
              icon: const Icon(Icons.edit_outlined),
              label: Text(L.of(context).mapOpenPlace),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapCanvas extends ConsumerWidget {
  const _MapCanvas({
    required this.projectId,
    required this.mapLocationId,
    required this.file,
    required this.pins,
    required this.editing,
    required this.controller,
  });

  final String projectId;
  final String mapLocationId;
  final File file;
  final List<MapPin> pins;
  final bool editing;
  final TransformationController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InteractiveViewer(
      transformationController: controller,
      minScale: 0.5,
      maxScale: 6,
      // Panning would fight the drag-a-pin gesture while placing markers.
      panEnabled: !editing,
      scaleEnabled: !editing,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return FittedBox(
            fit: BoxFit.contain,
            child: _PinnedImage(
              projectId: projectId,
              mapLocationId: mapLocationId,
              file: file,
              pins: pins,
              editing: editing,
            ),
          );
        },
      ),
    );
  }
}

/// The image at its natural size with pins positioned over it. Sizing to the
/// image's own pixels keeps fraction -> offset conversion exact regardless of
/// how FittedBox later scales the whole thing.
class _PinnedImage extends ConsumerStatefulWidget {
  const _PinnedImage({
    required this.projectId,
    required this.mapLocationId,
    required this.file,
    required this.pins,
    required this.editing,
  });

  final String projectId;
  final String mapLocationId;
  final File file;
  final List<MapPin> pins;
  final bool editing;

  @override
  ConsumerState<_PinnedImage> createState() => _PinnedImageState();
}

class _PinnedImageState extends ConsumerState<_PinnedImage> {
  Size? _imageSize;

  @override
  void initState() {
    super.initState();
    _resolveSize();
  }

  @override
  void didUpdateWidget(_PinnedImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.file.path != widget.file.path) _resolveSize();
  }

  /// Reads the intrinsic pixel size so the pin layer matches the image.
  void _resolveSize() {
    final stream =
        FileImage(widget.file).resolve(const ImageConfiguration());
    late final ImageStreamListener listener;
    listener = ImageStreamListener((info, _) {
      if (mounted) {
        setState(() => _imageSize = Size(
              info.image.width.toDouble(),
              info.image.height.toDouble(),
            ));
      }
      stream.removeListener(listener);
    });
    stream.addListener(listener);
  }

  Future<void> _addPinAt(Offset fraction) async {
    final target = await showDialog<(String, String, String)>(
      context: context,
      builder: (context) => _PickTargetDialog(projectId: widget.projectId),
    );
    if (target == null) return;
    final (type, id, label) = target;

    await ref.read(mapPinDaoProvider).addPin(
          projectId: widget.projectId,
          mapLocationId: widget.mapLocationId,
          targetType: type,
          targetId: id,
          x: fraction.dx,
          y: fraction.dy,
          label: label,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = _imageSize;
    if (size == null) {
      return const SizedBox(
        width: 240,
        height: 240,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: GestureDetector(
        // Only in editing mode, so a stray tap while exploring does nothing.
        onTapUp: widget.editing
            ? (details) => _addPinAt(Offset(
                  details.localPosition.dx / size.width,
                  details.localPosition.dy / size.height,
                ))
            : null,
        child: Stack(
          children: [
            Image.file(widget.file, fit: BoxFit.fill,
                width: size.width, height: size.height),
            for (final pin in widget.pins)
              Positioned(
                left: pin.x * size.width - _PinMarker.size / 2,
                top: pin.y * size.height - _PinMarker.size,
                child: _PinMarker(
                  pin: pin,
                  projectId: widget.projectId,
                  editing: widget.editing,
                  imageSize: size,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PinMarker extends ConsumerWidget {
  const _PinMarker({
    required this.pin,
    required this.projectId,
    required this.editing,
    required this.imageSize,
  });

  static const size = 44.0;

  final MapPin pin;
  final String projectId;
  final bool editing;
  final Size imageSize;

  static const _routes = <String, String>{
    TagEntity.location: 'world',
    TagEntity.character: 'characters',
    TagEntity.item: 'items',
    TagEntity.event: 'timeline',
  };

  static const _icons = <String, IconData>{
    TagEntity.location: Icons.place,
    TagEntity.character: Icons.person_pin_circle,
    TagEntity.item: Icons.auto_awesome,
    TagEntity.event: Icons.flag,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;

    final marker = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: scheme.primary,
            shape: BoxShape.circle,
            border: Border.all(color: scheme.onPrimary, width: 2),
          ),
          child: Icon(
            _icons[pin.targetType] ?? Icons.place,
            color: scheme.onPrimary,
            size: 20,
          ),
        ),
        if (pin.label != null && pin.label!.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            color: scheme.surface.withValues(alpha: 0.8),
            child: Text(
              pin.label!,
              style: TextStyle(fontSize: 11, color: scheme.onSurface),
            ),
          ),
      ],
    );

    if (!editing) {
      return SizedBox(
        width: size,
        child: GestureDetector(
          onTap: () {
            final section = _routes[pin.targetType];
            if (section != null) {
              context.push('/project/$projectId/$section/${pin.targetId}');
            }
          },
          child: marker,
        ),
      );
    }

    // While editing, dragging repositions and a long press removes.
    return SizedBox(
      width: size,
      child: GestureDetector(
        onLongPress: () => _confirmDelete(context, ref),
        onPanUpdate: (details) {
          ref.read(mapPinDaoProvider).movePin(
                id: pin.id,
                x: pin.x + details.delta.dx / imageSize.width,
                y: pin.y + details.delta.dy / imageSize.height,
              );
        },
        child: Opacity(opacity: 0.85, child: marker),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).mapRemoveMarker),
        content: Text(L.of(context)
            .mapRemoveMarkerBody(pin.label ?? L.of(context).mapThisMarker)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonRemove),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(mapPinDaoProvider).deletePin(pin.id);
    }
  }
}

/// Lets the user choose what a new pin points at, across entity kinds.
class _PickTargetDialog extends ConsumerWidget {
  const _PickTargetDialog({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(locationsStreamProvider(projectId));
    final characters = ref.watch(charactersStreamProvider(projectId));
    final items = ref.watch(itemsStreamProvider(projectId));

    return AlertDialog(
      title: Text(L.of(context).mapWhatIsHere),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _section(
                context,
                L.of(context).mapSectionPlaces,
                locations.valueOrNull
                        ?.map((l) => (TagEntity.location, l.id, l.name))
                        .toList() ??
                    const [],
              ),
              _section(
                context,
                L.of(context).mapSectionCharacters,
                characters.valueOrNull
                        ?.map((c) => (
                              TagEntity.character,
                              c.id,
                              '${c.firstName} ${c.lastName ?? ''}'.trim(),
                            ))
                        .toList() ??
                    const [],
              ),
              _section(
                context,
                L.of(context).mapSectionItems,
                items.valueOrNull
                        ?.map((i) => (TagEntity.item, i.id, i.name))
                        .toList() ??
                    const [],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(L.of(context).commonCancel),
        ),
      ],
    );
  }

  Widget _section(
    BuildContext context,
    String title,
    List<(String, String, String)> entries,
  ) {
    if (entries.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Text(title, style: Theme.of(context).textTheme.labelLarge),
        ),
        for (final entry in entries)
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(entry.$3),
            onTap: () => Navigator.of(context).pop(entry),
          ),
      ],
    );
  }
}
