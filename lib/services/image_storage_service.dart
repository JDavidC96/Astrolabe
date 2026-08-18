import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Stores uploaded/drawn images as PNG files under the app's documents
/// directory, keyed by project. Only paths *relative* to the documents
/// directory are persisted in the database, so the store stays portable.
class ImageStorageService {
  static const _uuid = Uuid();
  static const _rootFolder = 'worldbuilder_images';

  Future<Directory> _projectDir(String projectId) async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, _rootFolder, projectId));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// Copies an existing image file (e.g. from image_picker) into local
  /// storage and returns the relative path to store in the database.
  Future<String> saveImageFile(String projectId, File sourceFile) async {
    final dir = await _projectDir(projectId);
    final fileName = '${_uuid.v4()}.png';
    final destination = File(p.join(dir.path, fileName));
    await sourceFile.copy(destination.path);
    return p.join(_rootFolder, projectId, fileName);
  }

  /// Writes raw PNG bytes (e.g. exported from the drawing canvas) into
  /// local storage and returns the relative path to store in the database.
  Future<String> saveImageBytes(String projectId, Uint8List bytes) async {
    final dir = await _projectDir(projectId);
    final fileName = '${_uuid.v4()}.png';
    final destination = File(p.join(dir.path, fileName));
    await destination.writeAsBytes(bytes, flush: true);
    return p.join(_rootFolder, projectId, fileName);
  }

  /// Resolves a relative path (as stored in the database) to an absolute
  /// [File] that can be handed to `Image.file`.
  Future<File> resolveFile(String relativePath) async {
    final docs = await getApplicationDocumentsDirectory();
    return File(p.join(docs.path, relativePath));
  }

  Future<void> deleteImage(String? relativePath) async {
    if (relativePath == null || relativePath.isEmpty) return;
    final file = await resolveFile(relativePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// Deletes every image belonging to a project (called when a project is
  /// removed, since the DB cascade won't touch the filesystem).
  Future<void> deleteProjectImages(String projectId) async {
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, _rootFolder, projectId));
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }
}
