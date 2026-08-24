// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_dao.dart';

// ignore_for_file: type=lint
mixin _$SearchDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $LocationsTable get locations => attachedDatabase.locations;
  $ChaptersTable get chapters => attachedDatabase.chapters;
  $TimelineEventsTable get timelineEvents => attachedDatabase.timelineEvents;
  $ItemsTable get items => attachedDatabase.items;
  $MagicSystemsTable get magicSystems => attachedDatabase.magicSystems;
  $NotesTable get notes => attachedDatabase.notes;
  SearchDaoManager get managers => SearchDaoManager(this);
}

class SearchDaoManager {
  final _$SearchDaoMixin _db;
  SearchDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db.attachedDatabase, _db.chapters);
  $$TimelineEventsTableTableManager get timelineEvents =>
      $$TimelineEventsTableTableManager(
        _db.attachedDatabase,
        _db.timelineEvents,
      );
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db.attachedDatabase, _db.items);
  $$MagicSystemsTableTableManager get magicSystems =>
      $$MagicSystemsTableTableManager(_db.attachedDatabase, _db.magicSystems);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db.attachedDatabase, _db.notes);
}
