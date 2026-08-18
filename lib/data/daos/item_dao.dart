import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'item_dao.g.dart';

@DriftAccessor(tables: [Items])
class ItemDao extends DatabaseAccessor<AppDatabase> with _$ItemDaoMixin {
  ItemDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Item>> watchItems(String projectId) {
    return (select(items)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  Stream<List<Item>> watchItemsForOwner(String characterId) {
    return (select(items)..where((t) => t.ownerCharacterId.equals(characterId)))
        .watch();
  }

  Future<Item> getItem(String id) {
    return (select(items)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createItem({required String projectId, required String name}) async {
    final id = _uuid.v4();
    await into(items).insert(
      ItemsCompanion.insert(id: id, projectId: projectId, name: name),
    );
    return id;
  }

  Future<void> updateItem(ItemsCompanion entry) {
    return (update(items)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteItem(String id) {
    return (delete(items)..where((t) => t.id.equals(id))).go();
  }
}
