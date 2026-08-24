import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../data/database.dart';

/// Exports and restores a whole universe as a single `.wbz` file — a zip
/// holding `universe.json` plus every image the project references.
///
/// This matters more than usual here: the app stores everything on-device
/// with no cloud copy, so without a backup a lost or wiped phone means a
/// lost book.
/// Why an archive could not be restored. Kept as a code so the message
/// can be shown in the reader's language.
enum BackupError { notABackup, newerFormat }

/// Still a [FormatException] so existing `catch` sites keep working.
class BackupFormatException implements FormatException {
  const BackupFormatException(this.error);

  final BackupError error;

  @override
  String get message => 'BackupError.$error';

  @override
  int? get offset => null;

  @override
  dynamic get source => null;

  @override
  String toString() => message;
}

class BackupService {
  BackupService(this._db);

  final AppDatabase _db;
  static const _uuid = Uuid();

  /// Bump when the JSON shape changes so old files can be detected.
  static const formatVersion = 1;
  static const imagesFolder = 'worldbuilder_images';

  /// Builds the archive and returns the file it was written to.
  Future<File> exportProject(String projectId) async {
    final project = await _db.projectDao.getProject(projectId);
    final data = await _collect(projectId);

    final archive = Archive();
    final json = const JsonEncoder.withIndent('  ').convert(data);
    final jsonBytes = utf8.encode(json);
    archive.addFile(ArchiveFile('universe.json', jsonBytes.length, jsonBytes));

    // Bundle every image the project references, keyed by its relative path
    // so import can restore it verbatim.
    final docs = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(docs.path, imagesFolder, projectId));
    if (await imagesDir.exists()) {
      await for (final entity in imagesDir.list()) {
        if (entity is! File) continue;
        final bytes = await entity.readAsBytes();
        final name = 'images/${p.basename(entity.path)}';
        archive.addFile(ArchiveFile(name, bytes.length, bytes));
      }
    }

    final encoded = ZipEncoder().encode(archive);
    final safeName = project.name
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
    final outDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(
      outDir.path,
      '${safeName.isEmpty ? 'universo' : safeName}_respaldo.wbz',
    ));
    await file.writeAsBytes(encoded, flush: true);
    return file;
  }

  /// Restores an archive as a *new* project, remapping every id so importing
  /// a backup never overwrites or collides with what is already there.
  Future<String> importProject(File archiveFile) async {
    final bytes = await archiveFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final jsonEntry = archive.files.firstWhere(
      (f) => f.name == 'universe.json',
      orElse: () => throw const BackupFormatException(
        BackupError.notABackup,
      ),
    );
    final data = jsonDecode(utf8.decode(jsonEntry.content as List<int>))
        as Map<String, dynamic>;

    final version = data['formatVersion'] as int? ?? 0;
    if (version > formatVersion) {
      throw const BackupFormatException(BackupError.newerFormat);
    }

    final newProjectId = _uuid.v4();
    // Old id -> new id, filled in as each table is restored so foreign keys
    // can be rewritten as we go.
    final idMap = <String, String>{};

    String remap(String? oldId) {
      if (oldId == null) return '';
      return idMap.putIfAbsent(oldId, () => _uuid.v4());
    }

    String? remapOrNull(String? oldId) =>
        oldId == null ? null : remap(oldId);

    // Restore images first so rows can point at the new relative paths.
    final docs = await getApplicationDocumentsDirectory();
    final targetDir = Directory(p.join(docs.path, imagesFolder, newProjectId));
    await targetDir.create(recursive: true);
    final imagePathMap = <String, String>{};
    for (final entry in archive.files) {
      if (!entry.name.startsWith('images/') || !entry.isFile) continue;
      final fileName = p.basename(entry.name);
      final dest = File(p.join(targetDir.path, fileName));
      await dest.writeAsBytes(entry.content as List<int>, flush: true);
      imagePathMap[fileName] = p.join(imagesFolder, newProjectId, fileName);
    }

    /// Rewrites a stored image path onto the newly imported copy.
    String? remapImage(String? oldPath) {
      if (oldPath == null || oldPath.isEmpty) return null;
      return imagePathMap[p.basename(oldPath)];
    }

    List<Map<String, dynamic>> rows(String key) =>
        ((data[key] as List?) ?? const []).cast<Map<String, dynamic>>();

    await _db.transaction(() async {
      final projectRow = data['project'] as Map<String, dynamic>;
      await _db.into(_db.projects).insert(ProjectsCompanion.insert(
            id: newProjectId,
            name: '${projectRow['name']} (importado)',
            description: Value(projectRow['description'] as String?),
            coverImagePath:
                Value(remapImage(projectRow['coverImagePath'] as String?)),
          ));

      for (final row in rows('factions')) {
        await _db.into(_db.factions).insert(FactionsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              name: row['name'] as String,
              type: Value(row['type'] as String?),
              description: Value(row['description'] as String?),
              status: Value(row['status'] as String?),
              symbolImagePath:
                  Value(remapImage(row['symbolImagePath'] as String?)),
            ));
      }

      // Parents are remapped through the same map, so nesting survives
      // regardless of the order rows appear in.
      for (final row in rows('locations')) {
        await _db.into(_db.locations).insert(LocationsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              parentLocationId:
                  Value(remapOrNull(row['parentLocationId'] as String?)),
              name: row['name'] as String,
              type: Value(row['type'] as String?),
              description: Value(row['description'] as String?),
              climate: Value(row['climate'] as String?),
              population: Value(row['population'] as String?),
              government: Value(row['government'] as String?),
              status: Value(row['status'] as String?),
              mapImagePath: Value(remapImage(row['mapImagePath'] as String?)),
            ));
      }

      for (final row in rows('characters')) {
        await _db.into(_db.characters).insert(CharactersCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              firstName: row['firstName'] as String,
              lastName: Value(row['lastName'] as String?),
              aliasNickname: Value(row['aliasNickname'] as String?),
              race: Value(row['race'] as String?),
              gender: Value(row['gender'] as String?),
              age: Value(row['age'] as String?),
              occupation: Value(row['occupation'] as String?),
              factionId: Value(remapOrNull(row['factionId'] as String?)),
              status: Value(row['status'] as String?),
              physicalDescription: Value(row['physicalDescription'] as String?),
              personality: Value(row['personality'] as String?),
              backstory: Value(row['backstory'] as String?),
              abilities: Value(row['abilities'] as String?),
              notes: Value(row['notes'] as String?),
              portraitImagePath:
                  Value(remapImage(row['portraitImagePath'] as String?)),
            ));
      }

      for (final row in rows('timelineEvents')) {
        await _db.into(_db.timelineEvents).insert(TimelineEventsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              title: row['title'] as String,
              fictionalDate: Value(row['fictionalDate'] as String?),
              description: Value(row['description'] as String?),
              locationId: Value(remapOrNull(row['locationId'] as String?)),
              sortIndex: Value(row['sortIndex'] as int? ?? 0),
            ));
      }

      for (final row in rows('eventCharacters')) {
        await _db.into(_db.eventCharacters).insert(
              EventCharactersCompanion.insert(
                eventId: remap(row['eventId'] as String),
                characterId: remap(row['characterId'] as String),
              ),
            );
      }

      for (final row in rows('relationships')) {
        await _db.into(_db.characterRelationships).insert(
              CharacterRelationshipsCompanion.insert(
                id: remap(row['id'] as String),
                projectId: newProjectId,
                relationshipType: row['relationshipType'] as String,
                description: Value(row['description'] as String?),
              ),
            );
      }

      for (final row in rows('relationshipMembers')) {
        await _db.into(_db.relationshipMembers).insert(
              RelationshipMembersCompanion.insert(
                relationshipId: remap(row['relationshipId'] as String),
                characterId: remap(row['characterId'] as String),
                role: Value(row['role'] as String?),
              ),
            );
      }

      for (final row in rows('chapters')) {
        await _db.into(_db.chapters).insert(ChaptersCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              title: row['title'] as String,
              summary: Value(row['summary'] as String?),
              content: Value(row['content'] as String?),
              status: Value(row['status'] as String?),
              sortIndex: Value(row['sortIndex'] as int? ?? 0),
            ));
      }

      for (final row in rows('chapterCharacters')) {
        await _db.into(_db.chapterCharacters).insert(
              ChapterCharactersCompanion.insert(
                chapterId: remap(row['chapterId'] as String),
                characterId: remap(row['characterId'] as String),
              ),
            );
      }

      for (final row in rows('chapterLocations')) {
        await _db.into(_db.chapterLocations).insert(
              ChapterLocationsCompanion.insert(
                chapterId: remap(row['chapterId'] as String),
                locationId: remap(row['locationId'] as String),
              ),
            );
      }

      for (final row in rows('notes')) {
        await _db.into(_db.notes).insert(NotesCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              title: row['title'] as String,
              content: Value(row['content'] as String?),
            ));
      }

      for (final row in rows('items')) {
        await _db.into(_db.items).insert(ItemsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              name: row['name'] as String,
              type: Value(row['type'] as String?),
              description: Value(row['description'] as String?),
              powers: Value(row['powers'] as String?),
              origin: Value(row['origin'] as String?),
              ownerCharacterId:
                  Value(remapOrNull(row['ownerCharacterId'] as String?)),
              locationId: Value(remapOrNull(row['locationId'] as String?)),
              imagePath: Value(remapImage(row['imagePath'] as String?)),
            ));
      }

      for (final row in rows('magicSystems')) {
        await _db.into(_db.magicSystems).insert(MagicSystemsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              name: row['name'] as String,
              description: Value(row['description'] as String?),
              source: Value(row['source'] as String?),
              rules: Value(row['rules'] as String?),
              limitations: Value(row['limitations'] as String?),
              cost: Value(row['cost'] as String?),
              imagePath: Value(remapImage(row['imagePath'] as String?)),
            ));
      }

      for (final row in rows('tags')) {
        await _db.into(_db.tags).insert(TagsCompanion.insert(
              id: remap(row['id'] as String),
              projectId: newProjectId,
              name: row['name'] as String,
              color: Value(row['color'] as int?),
            ));
      }

      for (final row in rows('tagLinks')) {
        await _db.into(_db.tagLinks).insert(TagLinksCompanion.insert(
              tagId: remap(row['tagId'] as String),
              entityType: row['entityType'] as String,
              entityId: remap(row['entityId'] as String),
            ));
      }
    });

    return newProjectId;
  }

  Future<Map<String, dynamic>> _collect(String projectId) async {
    final project = await _db.projectDao.getProject(projectId);

    Future<List<Map<String, dynamic>>> dump<T extends DataClass>(
      Future<List<T>> future,
    ) async {
      final rows = await future;
      return rows.map((r) => r.toJson()).toList();
    }

    final characterRows = await (_db.select(_db.characters)
          ..where((t) => t.projectId.equals(projectId)))
        .get();
    final characterIds = characterRows.map((c) => c.id).toList();

    final eventRows = await (_db.select(_db.timelineEvents)
          ..where((t) => t.projectId.equals(projectId)))
        .get();
    final eventIds = eventRows.map((e) => e.id).toList();

    final relationshipRows = await (_db.select(_db.characterRelationships)
          ..where((t) => t.projectId.equals(projectId)))
        .get();
    final relationshipIds = relationshipRows.map((r) => r.id).toList();

    final chapterRows = await (_db.select(_db.chapters)
          ..where((t) => t.projectId.equals(projectId)))
        .get();
    final chapterIds = chapterRows.map((c) => c.id).toList();

    final tagRows =
        await (_db.select(_db.tags)..where((t) => t.projectId.equals(projectId)))
            .get();
    final tagIds = tagRows.map((t) => t.id).toList();

    return {
      'formatVersion': formatVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'project': project.toJson(),
      'factions': await dump(
        (_db.select(_db.factions)..where((t) => t.projectId.equals(projectId)))
            .get(),
      ),
      'locations': await dump(
        (_db.select(_db.locations)..where((t) => t.projectId.equals(projectId)))
            .get(),
      ),
      'characters': characterRows.map((r) => r.toJson()).toList(),
      'timelineEvents': eventRows.map((r) => r.toJson()).toList(),
      'eventCharacters': await dump(
        (_db.select(_db.eventCharacters)..where((t) => t.eventId.isIn(eventIds)))
            .get(),
      ),
      'relationships': relationshipRows.map((r) => r.toJson()).toList(),
      'relationshipMembers': await dump(
        (_db.select(_db.relationshipMembers)
              ..where((t) => t.relationshipId.isIn(relationshipIds)))
            .get(),
      ),
      'chapters': chapterRows.map((r) => r.toJson()).toList(),
      'chapterCharacters': await dump(
        (_db.select(_db.chapterCharacters)
              ..where((t) => t.chapterId.isIn(chapterIds)))
            .get(),
      ),
      'chapterLocations': await dump(
        (_db.select(_db.chapterLocations)
              ..where((t) => t.chapterId.isIn(chapterIds)))
            .get(),
      ),
      'notes': await dump(
        (_db.select(_db.notes)..where((t) => t.projectId.equals(projectId)))
            .get(),
      ),
      'items': await dump(
        (_db.select(_db.items)..where((t) => t.projectId.equals(projectId)))
            .get(),
      ),
      'magicSystems': await dump(
        (_db.select(_db.magicSystems)
              ..where((t) => t.projectId.equals(projectId)))
            .get(),
      ),
      'tags': tagRows.map((r) => r.toJson()).toList(),
      'tagLinks': await dump(
        (_db.select(_db.tagLinks)..where((t) => t.tagId.isIn(tagIds))).get(),
      ),
      // Kept for completeness; characters carry the ids these refer to.
      'characterIds': characterIds,
    };
  }
}
