import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'magic_dao.g.dart';

@DriftAccessor(tables: [MagicSystems])
class MagicDao extends DatabaseAccessor<AppDatabase> with _$MagicDaoMixin {
  MagicDao(super.db);

  static const _uuid = Uuid();

  Stream<List<MagicSystem>> watchMagicSystems(String projectId) {
    return (select(magicSystems)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  Future<MagicSystem> getMagicSystem(String id) {
    return (select(magicSystems)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createMagicSystem({
    required String projectId,
    required String name,
  }) async {
    final id = _uuid.v4();
    await into(magicSystems).insert(
      MagicSystemsCompanion.insert(id: id, projectId: projectId, name: name),
    );
    return id;
  }

  Future<void> updateMagicSystem(MagicSystemsCompanion entry) {
    return (update(magicSystems)..where((t) => t.id.equals(entry.id.value)))
        .write(entry);
  }

  Future<void> deleteMagicSystem(String id) {
    return (delete(magicSystems)..where((t) => t.id.equals(id))).go();
  }
}
