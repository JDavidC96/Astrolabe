import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../providers/core_providers.dart';
import 'stored_image.dart';

/// Reusable image section for entity forms: shows the current
/// image/drawing (if any) and lets the user replace it either by picking
/// a photo from the gallery or by drawing one on the built-in canvas.
///
/// The widget only manages local form state via [onChanged] — persistence
/// to disk happens immediately (so the file exists), but the caller decides
/// whether/when to save the resulting path into the database.
class ImageOrDrawingPicker extends ConsumerWidget {
  const ImageOrDrawingPicker({
    super.key,
    required this.projectId,
    required this.imagePath,
    required this.onChanged,
    this.size = 160,
    this.label,
  });

  final String projectId;
  final String? imagePath;
  final void Function(String? path) onChanged;
  final double size;
  final String? label;

  Future<void> _pickFromGallery(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final xfile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 90);
    if (xfile == null) return;
    final storage = ref.read(imageStorageServiceProvider);
    await storage.deleteImage(imagePath);
    final newPath = await storage.saveImageFile(projectId, File(xfile.path));
    onChanged(newPath);
  }

  Future<void> _handleDrawn(WidgetRef ref, Uint8List bytes) async {
    final storage = ref.read(imageStorageServiceProvider);
    await storage.deleteImage(imagePath);
    final newPath = await storage.saveImageBytes(projectId, bytes);
    onChanged(newPath);
  }

  Future<void> _draw(BuildContext context, WidgetRef ref) async {
    await context.push<void>(
      '/drawing',
      extra: (Uint8List bytes) {
        _handleDrawn(ref, bytes);
      },
    );
  }

  Future<void> _remove(WidgetRef ref) async {
    final storage = ref.read(imageStorageServiceProvider);
    await storage.deleteImage(imagePath);
    onChanged(null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: StoredImage(relativePath: imagePath, width: size, height: size),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            OutlinedButton.icon(
              onPressed: () => _pickFromGallery(context, ref),
              icon: const Icon(Icons.photo_library_outlined),
              label: Text(L.of(context).imageUpload),
            ),
            OutlinedButton.icon(
              onPressed: () => _draw(context, ref),
              icon: const Icon(Icons.brush_outlined),
              label: Text(L.of(context).imageDraw),
            ),
            if (imagePath != null)
              TextButton.icon(
                onPressed: () => _remove(ref),
                icon: const Icon(Icons.delete_outline),
                label: Text(L.of(context).commonRemove),
              ),
          ],
        ),
      ],
    );
  }
}
