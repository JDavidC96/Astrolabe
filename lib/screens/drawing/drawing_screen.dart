import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scribble/scribble.dart';

/// Full-screen freehand drawing canvas.
///
/// The user can optionally load a *background image* (a photo, or an
/// existing map) and draw on top of it — the background is composited into
/// the exported PNG, so tracing over a sketch produces a single flat image.
class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key, required this.onSave});

  final void Function(Uint8List pngBytes) onSave;

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  late final ScribbleNotifier _notifier = ScribbleNotifier();
  bool _saving = false;

  /// Decoded background image, kept so it can be painted behind the canvas
  /// and composited into the export at full resolution.
  ui.Image? _background;
  double _backgroundOpacity = 1.0;

  /// Recently used colours, so a custom colour picked via the wheel/hex
  /// field stays one tap away instead of having to be re-entered.
  final List<Color> _recentColors = [];

  static const _palette = <Color>[
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.brown,
  ];

  @override
  void dispose() {
    _background?.dispose();
    _notifier.dispose();
    super.dispose();
  }

  Color get _currentColor {
    final state = _notifier.value;
    return state is Drawing ? Color(state.selectedColor) : Colors.black;
  }

  void _selectColor(Color color) {
    _notifier.setColor(color);
    setState(() {
      _recentColors.removeWhere((c) => c.toARGB32() == color.toARGB32());
      _recentColors.insert(0, color);
      if (_recentColors.length > 8) _recentColors.removeLast();
    });
  }

  Future<void> _pickCustomColor() async {
    var picked = _currentColor;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).drawingCustomColor),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: picked,
            onColorChanged: (c) => picked = c,
            enableAlpha: false,
            // Shows the hex field so advanced users can type e.g. #3A6EA5.
            labelTypes: const [ColorLabelType.hex, ColorLabelType.rgb],
            pickerAreaHeightPercent: 0.7,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).drawingUseColor),
          ),
        ],
      ),
    );
    if (confirmed == true) _selectColor(picked);
  }

  Future<void> _pickBackground() async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile == null) return;
    final bytes = await File(xfile.path).readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    if (!mounted) return;
    setState(() {
      _background?.dispose();
      _background = frame.image;
    });
  }

  void _removeBackground() {
    setState(() {
      _background?.dispose();
      _background = null;
    });
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final raw = await _notifier.renderImage(pixelRatio: 3.0);
      final flattened = await _composite(raw);
      widget.onSave(flattened);
      if (mounted) context.pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  /// Flattens the sketch onto an opaque white sheet, with the background
  /// image (if any) painted underneath using the same BoxFit.contain
  /// geometry as the on-screen preview.
  Future<Uint8List> _composite(ByteData data) async {
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    final sketch = frame.image;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(sketch.width.toDouble(), sketch.height.toDouble());
    canvas.drawRect(Offset.zero & size, Paint()..color = Colors.white);

    final background = _background;
    if (background != null) {
      paintImage(
        canvas: canvas,
        rect: Offset.zero & size,
        image: background,
        fit: BoxFit.contain,
        opacity: _backgroundOpacity,
      );
    }

    canvas.drawImage(sketch, Offset.zero, Paint());
    final picture = recorder.endRecording();
    final flattened = await picture.toImage(sketch.width, sketch.height);
    final bytes = await flattened.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.drawingTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.image_outlined),
            tooltip: l.drawingBackground,
            onPressed: _pickBackground,
          ),
          if (_background != null)
            IconButton(
              icon: const Icon(Icons.hide_image_outlined),
              tooltip: l.drawingRemoveBackground,
              onPressed: _removeBackground,
            ),
          ValueListenableBuilder<ScribbleState>(
            valueListenable: _notifier,
            builder: (context, state, _) => IconButton(
              icon: const Icon(Icons.undo),
              onPressed: _notifier.canUndo ? _notifier.undo : null,
            ),
          ),
          ValueListenableBuilder<ScribbleState>(
            valueListenable: _notifier,
            builder: (context, state, _) => IconButton(
              icon: const Icon(Icons.redo),
              onPressed: _notifier.canRedo ? _notifier.redo : null,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: l.drawingClear,
            onPressed: _notifier.clear,
          ),
          IconButton(
            icon: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.check),
            tooltip: l.commonSave,
            onPressed: _saving ? null : _save,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (_background != null)
                    Opacity(
                      opacity: _backgroundOpacity,
                      child: RawImage(image: _background, fit: BoxFit.contain),
                    ),
                  Scribble(notifier: _notifier),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_background != null)
                    Row(
                      children: [
                        const Icon(Icons.opacity, size: 20),
                        const SizedBox(width: 4),
                        Text(l.drawingBackgroundLabel),
                        Expanded(
                          child: Slider(
                            min: 0.1,
                            max: 1.0,
                            value: _backgroundOpacity,
                            onChanged: (v) =>
                                setState(() => _backgroundOpacity = v),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 44,
                    child: ValueListenableBuilder<ScribbleState>(
                      valueListenable: _notifier,
                      builder: (context, state, _) {
                        final selected =
                            state is Drawing ? state.selectedColor : null;
                        final swatches = <Color>[
                          ..._recentColors,
                          ..._palette.where((p) => !_recentColors
                              .any((r) => r.toARGB32() == p.toARGB32())),
                        ];
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: swatches.length + 1,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return _CustomColorButton(
                                color: _currentColor,
                                onTap: _pickCustomColor,
                              );
                            }
                            final color = swatches[index - 1];
                            final isSelected = selected == color.toARGB32();
                            return GestureDetector(
                              onTap: () => _selectColor(color),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey,
                                    width: isSelected ? 3 : 1,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.line_weight, size: 20),
                      Expanded(
                        child: ValueListenableBuilder<ScribbleState>(
                          valueListenable: _notifier,
                          builder: (context, state, _) => Slider(
                            min: 1,
                            max: 30,
                            value: state.selectedWidth,
                            onChanged: _notifier.setStrokeWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Swatch that opens the full picker; shows the active colour and a
/// rainbow ring so it reads as "more colours" rather than another preset.
class _CustomColorButton extends StatelessWidget {
  const _CustomColorButton({required this.color, required this.onTap});

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: SweepGradient(
            colors: [
              Colors.red,
              Colors.yellow,
              Colors.green,
              Colors.cyan,
              Colors.blue,
              Colors.purple,
              Colors.red,
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
