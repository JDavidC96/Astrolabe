// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'magic_dao.dart';

// ignore_for_file: type=lint
mixin _$MagicDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $MagicSystemsTable get magicSystems => attachedDatabase.magicSystems;
  MagicDaoManager get managers => MagicDaoManager(this);
}

class MagicDaoManager {
  final _$MagicDaoMixin _db;
  MagicDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$MagicSystemsTableTableManager get magicSystems =>
      $$MagicSystemsTableTableManager(_db.attachedDatabase, _db.magicSystems);
}
