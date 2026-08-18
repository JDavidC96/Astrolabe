// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dao.dart';

// ignore_for_file: type=lint
mixin _$LocationDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $LocationsTable get locations => attachedDatabase.locations;
  LocationDaoManager get managers => LocationDaoManager(this);
}

class LocationDaoManager {
  final _$LocationDaoMixin _db;
  LocationDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
}
