import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables.dart';
import 'daos/project_dao.dart';
import 'daos/character_dao.dart';
import 'daos/faction_dao.dart';
import 'daos/location_dao.dart';
import 'daos/timeline_dao.dart';
import 'daos/relationship_dao.dart';
import 'daos/chapter_dao.dart';
import 'daos/note_dao.dart';
import 'daos/item_dao.dart';
import 'daos/magic_dao.dart';
import 'daos/tag_dao.dart';
import 'daos/search_dao.dart';
import 'daos/sheet_dao.dart';
import 'daos/family_dao.dart';
import 'daos/secret_dao.dart';
import 'daos/custom_field_dao.dart';
import 'daos/dice_dao.dart';
import 'daos/map_pin_dao.dart';
import 'daos/partner_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Projects,
    Factions,
    Locations,
    Characters,
    TimelineEvents,
    CharacterRelationships,
    RelationshipMembers,
    EventCharacters,
    Chapters,
    ChapterCharacters,
    ChapterLocations,
    Notes,
    Items,
    MagicSystems,
    Tags,
    TagLinks,
    CharacterSheets,
    FamilyLinks,
    Secrets,
    SecretKnowers,
    CustomFields,
    DiceRolls,
    MapPins,
    PartnerLinks,
  ],
  daos: [
    ProjectDao,
    CharacterDao,
    FactionDao,
    LocationDao,
    TimelineDao,
    RelationshipDao,
    ChapterDao,
    NoteDao,
    ItemDao,
    MagicDao,
    TagDao,
    SearchDao,
    SheetDao,
    FamilyDao,
    SecretDao,
    CustomFieldDao,
    DiceDao,
    MapPinDao,
    PartnerDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(super.connection);

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            // v2 reshaped relationships from a fixed character pair into a
            // group with a membership table, and added the chapters, notes,
            // items, magic and tagging sections.
            await m.drop(characterRelationships);
            await m.createTable(characterRelationships);
            await m.createTable(relationshipMembers);
            await m.createTable(chapters);
            await m.createTable(chapterCharacters);
            await m.createTable(chapterLocations);
            await m.createTable(notes);
            await m.createTable(items);
            await m.createTable(magicSystems);
            await m.createTable(tags);
            await m.createTable(tagLinks);
          }
          if (from < 3) {
            // v3 added campaign support (project kind, D&D sheets, dice),
            // plus genealogy, secrets and user-defined fields.
            await m.addColumn(projects, projects.kind);
            await m.addColumn(characters, characters.role);
            // `createTable` always builds the *current* schema, so a v1
            // database just got `chapters` complete with `session_date` in
            // the step above; only a database that already had the v2 table
            // is missing the column.
            if (from >= 2) {
              await m.addColumn(chapters, chapters.sessionDate);
            }
            await m.createTable(characterSheets);
            await m.createTable(familyLinks);
            await m.createTable(secrets);
            await m.createTable(secretKnowers);
            await m.createTable(customFields);
            await m.createTable(diceRolls);
          }
          if (from < 4) {
            // v4 gave each universe its own visual theme.
            await m.addColumn(projects, projects.themeId);
          }
          if (from < 5) {
            // v5 added map pins and per-chapter word goals.
            await m.createTable(mapPins);
            // Same trap as sessionDate: a pre-v2 database had `chapters`
            // created above from the current schema, so it already carries
            // this column.
            if (from >= 2) {
              await m.addColumn(chapters, chapters.wordGoal);
            }
          }
          if (from < 6) {
            // v6 added partnerships alongside the parent-child links.
            await m.createTable(partnerLinks);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'worldbuilder');
  }
}
