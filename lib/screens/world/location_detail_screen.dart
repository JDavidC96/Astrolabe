import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../data/daos/tag_dao.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/tags_field.dart';

class LocationDetailScreen extends ConsumerStatefulWidget {
  const LocationDetailScreen({
    super.key,
    required this.projectId,
    required this.locationId,
    required this.parentLocationId,
  });

  final String projectId;
  final String? locationId;
  /// Only used when creating a new location from the "add child" action.
  final String? parentLocationId;

  @override
  ConsumerState<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends ConsumerState<LocationDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _type = TextEditingController();
  final _description = TextEditingController();
  final _climate = TextEditingController();
  final _population = TextEditingController();
  final _government = TextEditingController();
  final _status = TextEditingController();

  String? _parentLocationId;
  String? _mapPath;
  String? _locationId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _locationId = widget.locationId;
    _parentLocationId = widget.parentLocationId;
    _load();
  }

  Future<void> _load() async {
    if (widget.locationId != null) {
      final location = await ref.read(locationDaoProvider).getLocation(widget.locationId!);
      _name.text = location.name;
      _type.text = location.type ?? '';
      _description.text = location.description ?? '';
      _climate.text = location.climate ?? '';
      _population.text = location.population ?? '';
      _government.text = location.government ?? '';
      _status.text = location.status ?? '';
      _parentLocationId = location.parentLocationId;
      _mapPath = location.mapImagePath;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    for (final c in [_name, _type, _description, _climate, _population, _government, _status]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  /// Locations that are `self` or a descendant of `self` — invalid parent
  /// choices, since picking one would create a cycle in the tree.
  Set<String> _invalidParentIds(List<Location> all) {
    if (_locationId == null) return {};
    final childrenByParent = <String?, List<Location>>{};
    for (final loc in all) {
      childrenByParent.putIfAbsent(loc.parentLocationId, () => []).add(loc);
    }
    final invalid = <String>{_locationId!};
    final queue = [_locationId!];
    while (queue.isNotEmpty) {
      final current = queue.removeLast();
      for (final child in childrenByParent[current] ?? const <Location>[]) {
        if (invalid.add(child.id)) queue.add(child.id);
      }
    }
    return invalid;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(locationDaoProvider);

    if (_locationId == null) {
      final id = await dao.createLocation(
        projectId: widget.projectId,
        parentLocationId: _parentLocationId,
        name: _name.text.trim(),
      );
      setState(() => _locationId = id);
    }

    await dao.updateLocation(
      LocationsCompanion(
        id: Value(_locationId!),
        parentLocationId: Value(_parentLocationId),
        name: Value(_name.text.trim()),
        type: Value(_nullIfEmpty(_type.text)),
        description: Value(_nullIfEmpty(_description.text)),
        climate: Value(_nullIfEmpty(_climate.text)),
        population: Value(_nullIfEmpty(_population.text)),
        government: Value(_nullIfEmpty(_government.text)),
        status: Value(_nullIfEmpty(_status.text)),
        mapImagePath: Value(_mapPath),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L.of(context).locSaved)),
      );
    }
  }

  Future<void> _delete() async {
    if (_locationId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).locDeleteTitle),
        content: Text(L.of(context).locDeleteBodyPlain),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(imageStorageServiceProvider).deleteImage(_mapPath);
    await ref.read(locationDaoProvider).deleteLocation(_locationId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l = L.of(context);
    final locationsAsync = ref.watch(locationsStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_locationId == null ? l.locNew : l.locEdit),
        actions: [
          if (_locationId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(icon: const Icon(Icons.check), tooltip: l.commonSave, onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_locationId != null) ...[
              Center(
                child: ImageOrDrawingPicker(
                  projectId: widget.projectId,
                  imagePath: _mapPath,
                  label: l.locMapLabel,
                  size: 200,
                  onChanged: (path) {
                    setState(() => _mapPath = path);
                    ref.read(locationDaoProvider).updateLocation(
                          LocationsCompanion(
                            id: Value(_locationId!),
                            mapImagePath: Value(path),
                          ),
                        );
                  },
                ),
              ),
              if (_mapPath != null && _mapPath!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Center(
                  child: FilledButton.tonalIcon(
                    onPressed: () => context.push(
                      '/project/${widget.projectId}/map/$_locationId',
                    ),
                    icon: const Icon(Icons.travel_explore_outlined),
                    label: Text(l.locOpenInteractiveMap),
                  ),
                ),
              ],
              const SizedBox(height: 16),
            ] else
              // Without this the map slot is simply invisible on a new
              // location, which reads as "there is no map feature".
              Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  leading: const Icon(Icons.map_outlined),
                  title: Text(l.locMapPending),
                  subtitle: Text(l.locMapPendingHint),
                ),
              ),
            TextFormField(
              controller: _name,
              decoration: InputDecoration(labelText: l.locName),
              validator: (v) => (v == null || v.trim().isEmpty) ? l.commonRequired : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _type,
              decoration: InputDecoration(
                labelText: l.locType,
                hintText: l.locTypeHint,
              ),
            ),
            const SizedBox(height: 12),
            locationsAsync.when(
              data: (all) {
                final invalid = _invalidParentIds(all);
                final options = all.where((l) => !invalid.contains(l.id)).toList();
                return DropdownButtonFormField<String?>(
                  initialValue: _parentLocationId,
                  decoration: InputDecoration(labelText: l.locParent),
                  items: [
                    DropdownMenuItem(value: null, child: Text(l.locParentRoot)),
                    for (final l in options) DropdownMenuItem(value: l.id, child: Text(l.name)),
                  ],
                  onChanged: (v) => setState(() => _parentLocationId = v),
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _climate,
              decoration: InputDecoration(labelText: l.locClimate),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _population,
              decoration: InputDecoration(labelText: l.locPopulation),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _government,
              decoration: InputDecoration(labelText: l.locGovernment),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _status,
              decoration: InputDecoration(labelText: l.locStatus),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(labelText: l.locDescription, border: const OutlineInputBorder()),
              maxLines: 6,
            ),
            if (_locationId != null) ...[
              const SizedBox(height: 16),
              TagsField(
                projectId: widget.projectId,
                entityType: TagEntity.location,
                entityId: _locationId!,
              ),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
