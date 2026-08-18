// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_dao.dart';

// ignore_for_file: type=lint
mixin _$ChapterDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $ChaptersTable get chapters => attachedDatabase.chapters;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $ChapterCharactersTable get chapterCharacters =>
      attachedDatabase.chapterCharacters;
  $LocationsTable get locations => attachedDatabase.locations;
  $ChapterLocationsTable get chapterLocations =>
      attachedDatabase.chapterLocations;
  ChapterDaoManager get managers => ChapterDaoManager(this);
}

class ChapterDaoManager {
  final _$ChapterDaoMixin _db;
  ChapterDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db.attachedDatabase, _db.chapters);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$ChapterCharactersTableTableManager get chapterCharacters =>
      $$ChapterCharactersTableTableManager(
        _db.attachedDatabase,
        _db.chapterCharacters,
      );
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$ChapterLocationsTableTableManager get chapterLocations =>
      $$ChapterLocationsTableTableManager(
        _db.attachedDatabase,
        _db.chapterLocations,
      );
}
