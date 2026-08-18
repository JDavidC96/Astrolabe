// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_dao.dart';

// ignore_for_file: type=lint
mixin _$SecretDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $SecretsTable get secrets => attachedDatabase.secrets;
  $SecretKnowersTable get secretKnowers => attachedDatabase.secretKnowers;
  SecretDaoManager get managers => SecretDaoManager(this);
}

class SecretDaoManager {
  final _$SecretDaoMixin _db;
  SecretDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$SecretsTableTableManager get secrets =>
      $$SecretsTableTableManager(_db.attachedDatabase, _db.secrets);
  $$SecretKnowersTableTableManager get secretKnowers =>
      $$SecretKnowersTableTableManager(_db.attachedDatabase, _db.secretKnowers);
}
