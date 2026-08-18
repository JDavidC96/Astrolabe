// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet_dao.dart';

// ignore_for_file: type=lint
mixin _$SheetDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $CharacterSheetsTable get characterSheets => attachedDatabase.characterSheets;
  SheetDaoManager get managers => SheetDaoManager(this);
}

class SheetDaoManager {
  final _$SheetDaoMixin _db;
  SheetDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$CharacterSheetsTableTableManager get characterSheets =>
      $$CharacterSheetsTableTableManager(
        _db.attachedDatabase,
        _db.characterSheets,
      );
}
