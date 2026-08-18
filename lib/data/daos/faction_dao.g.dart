// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction_dao.dart';

// ignore_for_file: type=lint
mixin _$FactionDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  FactionDaoManager get managers => FactionDaoManager(this);
}

class FactionDaoManager {
  final _$FactionDaoMixin _db;
  FactionDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
}
