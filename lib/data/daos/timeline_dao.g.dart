// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_dao.dart';

// ignore_for_file: type=lint
mixin _$TimelineDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $LocationsTable get locations => attachedDatabase.locations;
  $TimelineEventsTable get timelineEvents => attachedDatabase.timelineEvents;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $EventCharactersTable get eventCharacters => attachedDatabase.eventCharacters;
  TimelineDaoManager get managers => TimelineDaoManager(this);
}

class TimelineDaoManager {
  final _$TimelineDaoMixin _db;
  TimelineDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$TimelineEventsTableTableManager get timelineEvents =>
      $$TimelineEventsTableTableManager(
        _db.attachedDatabase,
        _db.timelineEvents,
      );
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$EventCharactersTableTableManager get eventCharacters =>
      $$EventCharactersTableTableManager(
        _db.attachedDatabase,
        _db.eventCharacters,
      );
}
