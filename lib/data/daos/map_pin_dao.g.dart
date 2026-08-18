// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_pin_dao.dart';

// ignore_for_file: type=lint
mixin _$MapPinDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $LocationsTable get locations => attachedDatabase.locations;
  $MapPinsTable get mapPins => attachedDatabase.mapPins;
  MapPinDaoManager get managers => MapPinDaoManager(this);
}

class MapPinDaoManager {
  final _$MapPinDaoMixin _db;
  MapPinDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db.attachedDatabase, _db.locations);
  $$MapPinsTableTableManager get mapPins =>
      $$MapPinsTableTableManager(_db.attachedDatabase, _db.mapPins);
}
