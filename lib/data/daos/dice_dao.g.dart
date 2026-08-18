// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_dao.dart';

// ignore_for_file: type=lint
mixin _$DiceDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProjectsTable get projects => attachedDatabase.projects;
  $DiceRollsTable get diceRolls => attachedDatabase.diceRolls;
  DiceDaoManager get managers => DiceDaoManager(this);
}

class DiceDaoManager {
  final _$DiceDaoMixin _db;
  DiceDaoManager(this._db);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db.attachedDatabase, _db.projects);
  $$DiceRollsTableTableManager get diceRolls =>
      $$DiceRollsTableTableManager(_db.attachedDatabase, _db.diceRolls);
}
