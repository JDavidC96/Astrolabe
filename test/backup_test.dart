import 'dart:io';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/services/backup_service.dart';

/// Redirects path_provider at a temp folder so the backup service can read
/// and write image files in tests.
class _FakePathProvider extends PathProviderPlatform
    with MockPlatformInterfaceMixin {
  _FakePathProvider(this.root);
  final String root;

  @override
  Future<String?> getApplicationDocumentsPath() async => root;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;
  late Directory tempDir;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    tempDir = await Directory.systemTemp.createTemp('wb_backup_test');
    PathProviderPlatform.instance = _FakePathProvider(tempDir.path);
  });

  tearDown(() async {
    await db.close();
    if (await tempDir.exists()) await tempDir.delete(recursive: true);
  });

  /// Builds a project exercising every relationship the export has to
  /// preserve: nesting, foreign keys, join tables and an image file.
  Future<String> seedProject() async {
    final projectId = await db.projectDao.createProject(
      name: 'Eldoria',
      description: 'Reinos en guerra',
    );

    final factionId = await db.factionDao.createFaction(
      projectId: projectId,
      name: 'Guardia del Norte',
    );

    final continentId = await db.locationDao.createLocation(
      projectId: projectId,
      name: 'Continente Norte',
    );
    final cityId = await db.locationDao.createLocation(
      projectId: projectId,
      parentLocationId: continentId,
      name: 'Puerto Gris',
    );

    final ariaId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Aria');
    final kaelId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Kael');
    final lyraId =
        await db.characterDao.createCharacter(projectId: projectId, firstName: 'Lyra');

    // Give Aria a portrait on disk so the archive has an image to carry.
    final imagesDir =
        Directory('${tempDir.path}/${BackupService.imagesFolder}/$projectId');
    await imagesDir.create(recursive: true);
    final portrait = File('${imagesDir.path}/aria.png');
    await portrait.writeAsBytes(List<int>.filled(64, 7));
    await db.characterDao.updateCharacter(CharactersCompanion(
      id: Value(ariaId),
      factionId: Value(factionId),
      portraitImagePath:
          Value('${BackupService.imagesFolder}/$projectId/aria.png'),
    ));

    await db.relationshipDao.createRelationship(
      projectId: projectId,
      relationshipType: 'Hermanos',
      characterIds: [ariaId, kaelId, lyraId],
    );

    final eventId =
        await db.timelineDao.createEvent(projectId: projectId, title: 'La caída');
    await db.timelineDao.setEventCharacters(eventId, [ariaId, kaelId]);

    final chapterId =
        await db.chapterDao.createChapter(projectId: projectId, title: 'Capítulo 1');
    await db.chapterDao.setChapterCharacters(chapterId, [ariaId]);
    await db.chapterDao.setChapterLocations(chapterId, [cityId]);

    await db.noteDao.createNote(projectId: projectId, title: 'Idea suelta');
    await db.itemDao.createItem(projectId: projectId, name: 'Espada rota');
    await db.magicDao.createMagicSystem(projectId: projectId, name: 'Runas');

    final tag = await db.tagDao.ensureTag(projectId: projectId, name: 'protagonista');
    await db.tagDao
        .attachTag(tagId: tag.id, entityType: 'character', entityId: ariaId);

    return projectId;
  }

  test('exported archive restores every section into a new universe', () async {
    final service = BackupService(db);
    final originalId = await seedProject();

    final archive = await service.exportProject(originalId);
    expect(await archive.exists(), isTrue);

    final importedId = await service.importProject(archive);
    expect(importedId, isNot(originalId));

    // The original is untouched — import never overwrites existing work.
    final projects = await db.projectDao.watchAllProjects().first;
    expect(projects, hasLength(2));

    final characters = await db.characterDao.watchCharacters(importedId).first;
    expect(characters.map((c) => c.firstName).toSet(),
        {'Aria', 'Kael', 'Lyra'});

    // Nested locations keep their hierarchy through the id remapping.
    final locations = await db.locationDao.watchLocations(importedId).first;
    expect(locations, hasLength(2));
    final city = locations.firstWhere((l) => l.name == 'Puerto Gris');
    final continent = locations.firstWhere((l) => l.name == 'Continente Norte');
    expect(city.parentLocationId, continent.id);

    // Aria keeps her faction link and her portrait, repointed at the copy.
    final aria = characters.firstWhere((c) => c.firstName == 'Aria');
    final importedFactions = await db.factionDao.watchFactions(importedId).first;
    expect(aria.factionId, importedFactions.single.id);
    expect(aria.portraitImagePath, isNotNull);
    expect(aria.portraitImagePath, contains(importedId));
    final restoredPortrait =
        File('${tempDir.path}/${aria.portraitImagePath}');
    expect(await restoredPortrait.exists(), isTrue,
        reason: 'the image file itself must be restored, not just its path');

    // The three-way relationship survives with all members.
    final relationships =
        await db.relationshipDao.watchRelationshipsForCharacter(aria.id).first;
    expect(relationships, hasLength(1));
    expect(relationships.single.members, hasLength(3));

    final chapters = await db.chapterDao.watchChapters(importedId).first;
    expect(chapters, hasLength(1));
    final chapterCharacters =
        await db.chapterDao.watchChapterCharacters(chapters.single.id).first;
    expect(chapterCharacters.single.id, aria.id);

    final notes = await db.noteDao.watchNotes(importedId).first;
    expect(notes, hasLength(1));
    final items = await db.itemDao.watchItems(importedId).first;
    expect(items, hasLength(1));
    final magic = await db.magicDao.watchMagicSystems(importedId).first;
    expect(magic, hasLength(1));

    final tags = await db.tagDao.watchTagsFor('character', aria.id).first;
    expect(tags.single.name, 'protagonista');
  });

  test('rejects a file that is not an Astrolabe backup', () async {
    final bogus = File('${tempDir.path}/nope.wbz');
    // A valid (empty) zip, so it decodes but has no universe.json.
    await bogus.writeAsBytes([0x50, 0x4B, 0x05, 0x06, ...List.filled(18, 0)]);

    expect(
      () => BackupService(db).importProject(bogus),
      throwsA(isA<FormatException>()),
    );
  });
}
