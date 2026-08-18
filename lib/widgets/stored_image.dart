import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';

/// Renders an image previously saved through [ImageStorageService], given
/// its path relative to the app documents directory. Falls back to a
/// placeholder icon when there is no image yet.
class StoredImage extends ConsumerWidget {
  const StoredImage({
    super.key,
    required this.relativePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderIcon = Icons.image_outlined,
  });

  final String? relativePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData placeholderIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = relativePath;
    if (path == null || path.isEmpty) {
      return _placeholder(context);
    }

    final storage = ref.watch(imageStorageServiceProvider);
    return FutureBuilder<File>(
      future: storage.resolveFile(path),
      builder: (context, snapshot) {
        final file = snapshot.data;
        if (file == null || !file.existsSync()) {
          return _placeholder(context);
        }
        return Image.file(
          file,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stack) => _placeholder(context),
        );
      },
    );
  }

  Widget _placeholder(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: Icon(
        placeholderIcon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        size: (width ?? height ?? 48) / 2,
      ),
    );
  }
}
