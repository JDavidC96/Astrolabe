// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_dao.dart';

// ignore_for_file: type=lint
mixin _$CustomFieldDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $CustomFieldsTable get customFields => attachedDatabase.customFields;
  CustomFieldDaoManager get managers => CustomFieldDaoManager(this);
}

class CustomFieldDaoManager {
  final _$CustomFieldDaoMixin _db;
  CustomFieldDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$CustomFieldsTableTableManager get customFields =>
      $$CustomFieldsTableTableManager(_db.attachedDatabase, _db.customFields);
}
