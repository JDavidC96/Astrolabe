import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/database.dart';
import '../../providers/data_providers.dart';
import '../../services/family_layout.dart';
import '../../widgets/stored_image.dart';

/// Card geometry. The painter needs the same numbers as the layout, so they
/// live here rather than being scattered through the widgets.
const _cardWidth = 132.0;
const _cardHeight = 128.0;
const _hGap = 24.0;
const _vGap = 72.0;

class FamilyTreeScreen extends ConsumerStatefulWidget {
  const FamilyTreeScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends ConsumerState<FamilyTreeScreen> {
  final _captureKey = GlobalKey();
  bool _exporting = false;

  Future<void> _export({required bool share}) async {
    setState(() => _exporting = true);
    try {
      final boundary = _captureKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) throw StateError('El árbol no está listo.');

      final image = await boundary.toImage(pixelRatio: 3);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      if (data == null) throw StateError('No se pudo generar la imagen.');

      // Flatten onto white so the PNG is readable outside the app's theme.
      final flattened = await _onWhite(data.buffer.asUint8List());

      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'arbol_genealogico.png'));
      await file.writeAsBytes(flattened, flush: true);

      if (share) {
        await SharePlus.instance.share(
          ShareParams(files: [XFile(file.path)], text: 'Árbol genealógico'),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Guardado en:\n${file.path}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No se pudo exportar: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  Future<Uint8List> _onWhite(Uint8List png) async {
    final codec = await ui.instantiateImageCodec(png);
    final frame = await codec.getNextFrame();
    final source = frame.image;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size =
        Size(source.width.toDouble(), source.height.toDouble());
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.white);
    canvas.drawImage(source, Offset.zero, Paint());
    final result = await recorder
        .endRecording()
        .toImage(source.width, source.height);
    final bytes = await result.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final charactersAsync =
        ref.watch(charactersStreamProvider(widget.projectId));
    final kinshipAsync = ref.watch(kinshipProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Árbol genealógico'),
        actions: [
          if (_exporting)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(Icons.ios_share),
              tooltip: 'Exportar',
              onSelected: (value) => _export(share: value == 'share'),
              itemBuilder: (context) => const [
                PopupMenuItem(value: 'share', child: Text('Compartir imagen')),
                PopupMenuItem(value: 'save', child: Text('Guardar imagen')),
              ],
            ),
        ],
      ),
      body: charactersAsync.when(
        data: (characters) => kinshipAsync.when(
          data: (kinship) {
            final layout = FamilyLayout.build(
              everyone: characters.map((c) => c.id).toList(),
              kinship: kinship,
            );

            if (layout.rows.isEmpty) {
              return _EmptyState(unlinked: layout.unlinked.length);
            }

            final byId = {for (final c in characters) c.id: c};

            return Column(
              children: [
                Expanded(
                  child: InteractiveViewer(
                    constrained: false,
                    minScale: 0.2,
                    maxScale: 3,
                    boundaryMargin: const EdgeInsets.all(200),
                    child: RepaintBoundary(
                      key: _captureKey,
                      child: _TreeCanvas(
                        layout: layout,
                        byId: byId,
                        projectId: widget.projectId,
                      ),
                    ),
                  ),
                ),
                if (layout.unlinked.isNotEmpty)
                  _UnlinkedStrip(
                    ids: layout.unlinked,
                    byId: byId,
                    projectId: widget.projectId,
                  ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error: $e')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.unlinked});
  final int unlinked;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.account_tree_outlined, size: 48),
            const SizedBox(height: 12),
            Text(
              unlinked == 0
                  ? 'Todavía no hay personajes.'
                  : 'Todavía no hay vínculos familiares.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            const Text(
              'Abre un personaje y agrega padres, hijos o pareja en la '
              'sección "Familia".',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// The tree itself: a painted layer of connectors with the cards on top.
class _TreeCanvas extends StatelessWidget {
  const _TreeCanvas({
    required this.layout,
    required this.byId,
    required this.projectId,
  });

  final FamilyLayout layout;
  final Map<String, Character> byId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    final widestRow =
        layout.rows.fold(0, (m, r) => r.length > m ? r.length : m);
    final width = widestRow * (_cardWidth + _hGap) + _hGap;
    final height = layout.rows.length * (_cardHeight + _vGap) + _vGap;
    final scheme = Theme.of(context).colorScheme;

    // Rows are centred, so each row needs its own horizontal offset.
    double rowOffset(int generation) {
      final count = layout.rows[generation].length;
      final rowWidth = count * (_cardWidth + _hGap) - _hGap;
      return (width - rowWidth) / 2;
    }

    Offset centreOf(String id) {
      final slot = layout.slots[id]!;
      return Offset(
        rowOffset(slot.generation) +
            slot.column * (_cardWidth + _hGap) +
            _cardWidth / 2,
        _vGap / 2 + slot.generation * (_cardHeight + _vGap),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _ConnectorPainter(
                layout: layout,
                centreOf: centreOf,
                lineColor: scheme.outline,
                partnerColor: scheme.primary,
              ),
            ),
          ),
          for (final entry in layout.slots.entries)
            if (byId.containsKey(entry.key))
              Positioned(
                left: centreOf(entry.key).dx - _cardWidth / 2,
                top: centreOf(entry.key).dy,
                child: _PersonCard(
                  character: byId[entry.key]!,
                  projectId: projectId,
                ),
              ),
        ],
      ),
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  _ConnectorPainter({
    required this.layout,
    required this.centreOf,
    required this.lineColor,
    required this.partnerColor,
  });

  final FamilyLayout layout;
  final Offset Function(String id) centreOf;
  final Color lineColor;
  final Color partnerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final parentPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;
    final partnerPaint = Paint()
      ..color = partnerColor
      ..strokeWidth = 2.4
      ..style = PaintingStyle.stroke;

    // Partner connectors: a straight line between the two cards.
    for (final (a, b) in layout.partnerEdges) {
      final from = centreOf(a);
      final to = centreOf(b);
      canvas.drawLine(
        Offset(from.dx + _cardWidth / 2, from.dy + _cardHeight / 2),
        Offset(to.dx - _cardWidth / 2, to.dy + _cardHeight / 2),
        partnerPaint,
      );
    }

    // Parent edges: down out of the parent, across, then down into the
    // child — orthogonal routing stays readable when lines overlap.
    for (final (parent, child) in layout.parentEdges) {
      final from = centreOf(parent);
      final to = centreOf(child);
      final start = Offset(from.dx, from.dy + _cardHeight);
      final end = Offset(to.dx, to.dy);
      final midY = start.dy + (end.dy - start.dy) / 2;

      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..lineTo(start.dx, midY)
        ..lineTo(end.dx, midY)
        ..lineTo(end.dx, end.dy);
      canvas.drawPath(path, parentPaint);

      // A small arrowhead marks direction of descent.
      canvas.drawCircle(end, 2.5, Paint()..color = lineColor);
    }
  }

  @override
  bool shouldRepaint(_ConnectorPainter old) =>
      old.layout != layout ||
      old.lineColor != lineColor ||
      old.partnerColor != partnerColor;
}

class _PersonCard extends StatelessWidget {
  const _PersonCard({required this.character, required this.projectId});

  final Character character;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    final name =
        '${character.firstName} ${character.lastName ?? ''}'.trim();

    return SizedBox(
      width: _cardWidth,
      height: _cardHeight,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () =>
              context.push('/project/$projectId/characters/${character.id}'),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: StoredImage(
                    relativePath: character.portraitImagePath,
                    width: 56,
                    height: 56,
                    placeholderIcon: Icons.person_outline,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UnlinkedStrip extends StatelessWidget {
  const _UnlinkedStrip({
    required this.ids,
    required this.byId,
    required this.projectId,
  });

  final List<String> ids;
  final Map<String, Character> byId;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sin familia registrada',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final id in ids)
                  if (byId.containsKey(id))
                    ActionChip(
                      label: Text(
                        '${byId[id]!.firstName} ${byId[id]!.lastName ?? ''}'
                            .trim(),
                      ),
                      onPressed: () =>
                          context.push('/project/$projectId/characters/$id'),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
