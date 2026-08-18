import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../services/backup_service.dart';
import '../services/dice_roller.dart';
import '../services/image_storage_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final imageStorageServiceProvider = Provider<ImageStorageService>((ref) {
  return ImageStorageService();
});

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(ref.watch(databaseProvider));
});

final projectDaoProvider = Provider((ref) => ref.watch(databaseProvider).projectDao);
final characterDaoProvider = Provider((ref) => ref.watch(databaseProvider).characterDao);
final factionDaoProvider = Provider((ref) => ref.watch(databaseProvider).factionDao);
final locationDaoProvider = Provider((ref) => ref.watch(databaseProvider).locationDao);
final timelineDaoProvider = Provider((ref) => ref.watch(databaseProvider).timelineDao);
final relationshipDaoProvider =
    Provider((ref) => ref.watch(databaseProvider).relationshipDao);
final chapterDaoProvider = Provider((ref) => ref.watch(databaseProvider).chapterDao);
final noteDaoProvider = Provider((ref) => ref.watch(databaseProvider).noteDao);
final itemDaoProvider = Provider((ref) => ref.watch(databaseProvider).itemDao);
final magicDaoProvider = Provider((ref) => ref.watch(databaseProvider).magicDao);
final tagDaoProvider = Provider((ref) => ref.watch(databaseProvider).tagDao);
final searchDaoProvider = Provider((ref) => ref.watch(databaseProvider).searchDao);
final sheetDaoProvider = Provider((ref) => ref.watch(databaseProvider).sheetDao);
final familyDaoProvider = Provider((ref) => ref.watch(databaseProvider).familyDao);
final secretDaoProvider = Provider((ref) => ref.watch(databaseProvider).secretDao);
final customFieldDaoProvider =
    Provider((ref) => ref.watch(databaseProvider).customFieldDao);
final diceDaoProvider = Provider((ref) => ref.watch(databaseProvider).diceDao);
final mapPinDaoProvider = Provider((ref) => ref.watch(databaseProvider).mapPinDao);
final partnerDaoProvider = Provider((ref) => ref.watch(databaseProvider).partnerDao);

final diceRollerProvider = Provider<DiceRoller>((ref) => DiceRoller());
