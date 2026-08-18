import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/data/tables.dart' show ProjectKind;

/// The v1 schema, as shipped before campaigns, chapters and secrets existed.
/// Written out by hand so we can build a real "old" database file and run the
/// production migration against it — the situation of anyone who already had
/// the app installed.
const _v1Schema = <String>[
  '''CREATE TABLE projects (
    id TEXT NOT NULL,
    name TEXT NOT NULL,
    description TEXT NULL,
    cover_image_path TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE factions (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    type TEXT NULL,
    description TEXT NULL,
    symbol_image_path TEXT NULL,
    symbol_is_drawing INTEGER NOT NULL DEFAULT 0 CHECK (symbol_is_drawing IN (0, 1)),
    status TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE locations (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    parent_location_id TEXT NULL REFERENCES locations (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    type TEXT NULL,
    description TEXT NULL,
    climate TEXT NULL,
    population TEXT NULL,
    government TEXT NULL,
    status TEXT NULL,
    map_image_path TEXT NULL,
    map_is_drawing INTEGER NOT NULL DEFAULT 0 CHECK (map_is_drawing IN (0, 1)),
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE characters (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    first_name TEXT NOT NULL,
    last_name TEXT NULL,
    alias_nickname TEXT NULL,
    race TEXT NULL,
    gender TEXT NULL,
    age TEXT NULL,
    occupation TEXT NULL,
    faction_id TEXT NULL REFERENCES factions (id) ON DELETE SET NULL,
    status TEXT NULL,
    physical_description TEXT NULL,
    personality TEXT NULL,
    backstory TEXT NULL,
    abilities TEXT NULL,
    notes TEXT NULL,
    portrait_image_path TEXT NULL,
    portrait_is_drawing INTEGER NOT NULL DEFAULT 0 CHECK (portrait_is_drawing IN (0, 1)),
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE timeline_events (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    fictional_date TEXT NULL,
    description TEXT NULL,
    location_id TEXT NULL REFERENCES locations (id) ON DELETE SET NULL,
    sort_index INTEGER NOT NULL DEFAULT 0,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  // The old pair-shaped relationship table, replaced in v2.
  '''CREATE TABLE character_relationships (
    id TEXT NOT NULL,
    character_a_id TEXT NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
    character_b_id TEXT NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
    relationship_type TEXT NOT NULL,
    description TEXT NULL,
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE event_characters (
    event_id TEXT NOT NULL REFERENCES timeline_events (id) ON DELETE CASCADE,
    character_id TEXT NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
    PRIMARY KEY (event_id, character_id)
  )''',
];

/// What v2 added on top of v1: group relationships, plus the chapters,
/// notes, items, magic and tagging sections. Crucially `chapters` here has
/// no `session_date` — that column only arrives in v3.
const _v2Additions = <String>[
  'DROP TABLE character_relationships',
  '''CREATE TABLE character_relationships (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    relationship_type TEXT NOT NULL,
    description TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE relationship_members (
    relationship_id TEXT NOT NULL REFERENCES character_relationships (id) ON DELETE CASCADE,
    character_id TEXT NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
    role TEXT NULL,
    PRIMARY KEY (relationship_id, character_id)
  )''',
  '''CREATE TABLE chapters (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    summary TEXT NULL,
    content TEXT NULL,
    status TEXT NULL,
    sort_index INTEGER NOT NULL DEFAULT 0,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE chapter_characters (
    chapter_id TEXT NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    character_id TEXT NOT NULL REFERENCES characters (id) ON DELETE CASCADE,
    PRIMARY KEY (chapter_id, character_id)
  )''',
  '''CREATE TABLE chapter_locations (
    chapter_id TEXT NOT NULL REFERENCES chapters (id) ON DELETE CASCADE,
    location_id TEXT NOT NULL REFERENCES locations (id) ON DELETE CASCADE,
    PRIMARY KEY (chapter_id, location_id)
  )''',
  '''CREATE TABLE notes (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    content TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE items (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    type TEXT NULL,
    description TEXT NULL,
    powers TEXT NULL,
    origin TEXT NULL,
    owner_character_id TEXT NULL REFERENCES characters (id) ON DELETE SET NULL,
    location_id TEXT NULL REFERENCES locations (id) ON DELETE SET NULL,
    image_path TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE magic_systems (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT NULL,
    source TEXT NULL,
    rules TEXT NULL,
    limitations TEXT NULL,
    cost TEXT NULL,
    image_path TEXT NULL,
    created_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    updated_at INTEGER NOT NULL DEFAULT (strftime('%s', CURRENT_TIMESTAMP)),
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE tags (
    id TEXT NOT NULL,
    project_id TEXT NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    color INTEGER NULL,
    PRIMARY KEY (id)
  )''',
  '''CREATE TABLE tag_links (
    tag_id TEXT NOT NULL REFERENCES tags (id) ON DELETE CASCADE,
    entity_type TEXT NOT NULL,
    entity_id TEXT NOT NULL,
    PRIMARY KEY (tag_id, entity_type, entity_id)
  )''',
];

void main() {
  late File dbFile;

  setUp(() async {
    final dir = await Directory.systemTemp.createTemp('wb_migration');
    dbFile = File('${dir.path}/app.sqlite');
  });

  tearDown(() async {
    final dir = dbFile.parent;
    if (await dir.exists()) await dir.delete(recursive: true);
  });

  /// Builds a v1 database holding one project with real content in it.
  Future<void> seedV1() async {
    final raw = NativeDatabase(dbFile);
    final db = _RawDb(raw);
    for (final statement in _v1Schema) {
      await db.customStatement(statement);
    }
    await db.customStatement(
      "INSERT INTO projects (id, name, description) "
      "VALUES ('p1', 'Eldoria', 'Mi primer libro')",
    );
    await db.customStatement(
      "INSERT INTO factions (id, project_id, name) "
      "VALUES ('f1', 'p1', 'Guardia del Norte')",
    );
    await db.customStatement(
      "INSERT INTO locations (id, project_id, name) "
      "VALUES ('l1', 'p1', 'Puerto Gris')",
    );
    await db.customStatement(
      "INSERT INTO characters (id, project_id, first_name, last_name, faction_id, "
      "portrait_image_path) "
      "VALUES ('c1', 'p1', 'Aria', 'Valdris', 'f1', 'worldbuilder_images/p1/a.png')",
    );
    await db.customStatement(
      "INSERT INTO characters (id, project_id, first_name) "
      "VALUES ('c2', 'p1', 'Kael')",
    );
    await db.customStatement(
      "INSERT INTO timeline_events (id, project_id, title) "
      "VALUES ('e1', 'p1', 'La caida')",
    );
    await db.customStatement(
      "INSERT INTO character_relationships (id, character_a_id, character_b_id, "
      "relationship_type) VALUES ('r1', 'c1', 'c2', 'Hermanos')",
    );
    // Mark the file as schema version 1, the way the old app left it.
    await db.customStatement('PRAGMA user_version = 1');
    await db.close();
  }

  /// Upgrades the seeded file to the *v2* shape with raw SQL, so the test
  /// exercises the real v2 -> v3 path instead of re-running v1 -> v3.
  Future<void> seedV2() async {
    await seedV1();
    final db = _RawDb(NativeDatabase(dbFile));
    for (final statement in _v2Additions) {
      await db.customStatement(statement);
    }
    await db.customStatement(
      "INSERT INTO chapters (id, project_id, title) "
      "VALUES ('ch1', 'p1', 'Capitulo uno')",
    );
    await db.customStatement('PRAGMA user_version = 2');
    await db.close();
  }

  test('a v1 database upgrades to v3 without losing the user\'s work',
      () async {
    await seedV1();

    // Opening with the production database runs the real migration.
    final db = AppDatabase.forTesting(NativeDatabase(dbFile));
    addTearDown(db.close);

    final projects = await db.projectDao.watchAllProjects().first;
    expect(projects, hasLength(1));
    expect(projects.single.name, 'Eldoria');
    // Columns added in v3 must take their default rather than breaking rows.
    expect(projects.single.kind, ProjectKind.novel);

    final characters = await db.characterDao.watchCharacters('p1').first;
    expect(characters.map((c) => c.firstName).toSet(), {'Aria', 'Kael'});

    final aria = characters.firstWhere((c) => c.firstName == 'Aria');
    expect(aria.lastName, 'Valdris');
    expect(aria.factionId, 'f1');
    // The drawing the user made must still be pointed at.
    expect(aria.portraitImagePath, 'worldbuilder_images/p1/a.png');
    expect(aria.role, null);

    final locations = await db.locationDao.watchLocations('p1').first;
    expect(locations.single.name, 'Puerto Gris');

    final events = await db.timelineDao.watchEvents('p1').first;
    expect(events.single.title, 'La caida');

    // Sections introduced later start empty but must be queryable.
    expect(await db.chapterDao.watchChapters('p1').first, isEmpty);
    expect(await db.noteDao.watchNotes('p1').first, isEmpty);
    expect(await db.itemDao.watchItems('p1').first, isEmpty);
    expect(await db.magicDao.watchMagicSystems('p1').first, isEmpty);
    expect(await db.secretDao.watchSecrets('p1').first, isEmpty);
    expect(await db.tagDao.watchTags('p1').first, isEmpty);
    expect(await db.diceDao.watchRolls('p1').first, isEmpty);

    // Relationships were reshaped in v2; the new table must work, even though
    // the old pair rows could not be carried across.
    final relationshipId = await db.relationshipDao.createRelationship(
      projectId: 'p1',
      relationshipType: 'Hermanos',
      characterIds: ['c1', 'c2'],
    );
    expect(relationshipId, isNotEmpty);
    final seen =
        await db.relationshipDao.watchRelationshipsForCharacter('c1').first;
    expect(seen.single.members, hasLength(2));
  });

  test('a v2 database also upgrades cleanly', () async {
    // v2 is the other real starting point: it already had chapters, but
    // without the session_date column that v3 adds.
    await seedV2();

    final db = AppDatabase.forTesting(NativeDatabase(dbFile));
    addTearDown(db.close);

    final chapters = await db.chapterDao.watchChapters('p1').first;
    expect(chapters.single.title, 'Capitulo uno');
    // The column added in v3 exists and defaults to null on old rows.
    expect(chapters.single.sessionDate, null);

    // v1 content is still intact after the second hop.
    final characters = await db.characterDao.watchCharacters('p1').first;
    expect(characters, hasLength(2));
    // And the v3-only tables are in place.
    expect(await db.diceDao.watchRolls('p1').first, isEmpty);
  });

  test('the upgraded database is usable for the new features', () async {
    await seedV1();
    final db = AppDatabase.forTesting(NativeDatabase(dbFile));
    addTearDown(db.close);

    // Family links, secrets and sheets all target pre-existing characters.
    await db.familyDao.addLink(parentId: 'c1', childId: 'c2');
    expect((await db.familyDao.watchChildren('c1').first).single.id, 'c2');

    final secretId =
        await db.secretDao.createSecret(projectId: 'p1', title: 'Un secreto');
    await db.secretDao.setKnower(secretId: secretId, characterId: 'c1');
    final secrets = await db.secretDao.watchSecrets('p1').first;
    expect(secrets.single.knowers.single.id, 'c1');

    await db.sheetDao.saveSheet(
      CharacterSheetsCompanion(
        characterId: const Value('c1'),
        level: const Value(3),
        strength: const Value(16),
      ),
    );
    final sheet = await db.sheetDao.getSheet('c1');
    expect(sheet?.strength, 16);
  });
}

/// Minimal DatabaseConnectionUser so raw SQL can be issued against a file
/// before the real schema exists.
class _RawDb extends GeneratedDatabase {
  _RawDb(super.executor);

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables => const [];

  @override
  int get schemaVersion => 1;
}
