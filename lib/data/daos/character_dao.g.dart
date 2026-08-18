// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_dao.dart';

// ignore_for_file: type=lint
mixin _$CharacterDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  CharacterDaoManager get managers => CharacterDaoManager(this);
}

class CharacterDaoManager {
  final _$CharacterDaoMixin _db;
  CharacterDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
}
