// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_dao.dart';

// ignore_for_file: type=lint
mixin _$RelationshipDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $CharacterRelationshipsTable get characterRelationships =>
      attachedDatabase.characterRelationships;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $RelationshipMembersTable get relationshipMembers =>
      attachedDatabase.relationshipMembers;
  RelationshipDaoManager get managers => RelationshipDaoManager(this);
}

class RelationshipDaoManager {
  final _$RelationshipDaoMixin _db;
  RelationshipDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$CharacterRelationshipsTableTableManager get characterRelationships =>
      $$CharacterRelationshipsTableTableManager(
        _db.attachedDatabase,
        _db.characterRelationships,
      );
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$RelationshipMembersTableTableManager get relationshipMembers =>
      $$RelationshipMembersTableTableManager(
        _db.attachedDatabase,
        _db.relationshipMembers,
      );
}
