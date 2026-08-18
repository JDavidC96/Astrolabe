import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'dice_dao.g.dart';

@DriftAccessor(tables: [DiceRolls])
class DiceDao extends DatabaseAccessor<AppDatabase> with _$DiceDaoMixin {
  DiceDao(super.db);

  static const _uuid = Uuid();

  Stream<List<DiceRoll>> watchRolls(String projectId, {int limit = 50}) {
    return (select(diceRolls)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ])
          ..limit(limit))
        .watch();
  }

  Future<void> recordRoll({
    required String projectId,
    required String expression,
    required int total,
    required String detail,
    String? label,
  }) {
    return into(diceRolls).insert(
      DiceRollsCompanion.insert(
        id: _uuid.v4(),
        projectId: projectId,
        expression: expression,
        total: total,
        detail: detail,
        label: Value(label),
      ),
    );
  }

  Future<void> clearHistory(String projectId) {
    return (delete(diceRolls)..where((t) => t.projectId.equals(projectId))).go();
  }
}
