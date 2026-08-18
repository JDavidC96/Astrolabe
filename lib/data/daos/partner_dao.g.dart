// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_dao.dart';

// ignore_for_file: type=lint
mixin _$PartnerDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $FactionsTable get factions => attachedDatabase.factions;
  $CharactersTable get characters => attachedDatabase.characters;
  $PartnerLinksTable get partnerLinks => attachedDatabase.partnerLinks;
  PartnerDaoManager get managers => PartnerDaoManager(this);
}

class PartnerDaoManager {
  final _$PartnerDaoMixin _db;
  PartnerDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db.attachedDatabase, _db.factions);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db.attachedDatabase, _db.characters);
  $$PartnerLinksTableTableManager get partnerLinks =>
      $$PartnerLinksTableTableManager(_db.attachedDatabase, _db.partnerLinks);
}
