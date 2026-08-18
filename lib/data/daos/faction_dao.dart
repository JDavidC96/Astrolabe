import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'faction_dao.g.dart';

@DriftAccessor(tables: [Factions, Characters])
class FactionDao extends DatabaseAccessor<AppDatabase> with _$FactionDaoMixin {
  FactionDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Faction>> watchFactions(String projectId) {
    return (select(factions)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  Stream<Faction> watchFaction(String id) {
    return (select(factions)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<Faction> getFaction(String id) {
    return (select(factions)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<Character>> watchFactionMembers(String factionId) {
    return (select(characters)..where((t) => t.factionId.equals(factionId)))
        .watch();
  }

  Future<String> createFaction({
    required String projectId,
    required String name,
    String? type,
    String? description,
  }) async {
    final id = _uuid.v4();
    await into(factions).insert(
      FactionsCompanion.insert(
        id: id,
        projectId: projectId,
        name: name,
        type: Value(type),
        description: Value(description),
      ),
    );
    return id;
  }

  Future<void> updateFaction(FactionsCompanion entry) {
    return (update(factions)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteFaction(String id) {
    return (delete(factions)..where((t) => t.id.equals(id))).go();
  }
}
