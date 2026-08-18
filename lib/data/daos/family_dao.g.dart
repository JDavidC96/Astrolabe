// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_dao.dart';

// ignore_for_file: type=lint
mixin _$FamilyDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $FamilyLinksTable get familyLinks => attachedDatabase.familyLinks;
  FamilyDaoManager get managers => FamilyDaoManager(this);
}

class FamilyDaoManager {
  final _$FamilyDaoMixin _db;
  FamilyDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$FamilyLinksTableTableManager get familyLinks =>
      $$FamilyLinksTableTableManager(_db.attachedDatabase, _db.familyLinks);
}
