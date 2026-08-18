import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'custom_field_dao.g.dart';

@DriftAccessor(tables: [CustomFields])
class CustomFieldDao extends DatabaseAccessor<AppDatabase>
    with _$CustomFieldDaoMixin {
  CustomFieldDao(super.db);

  static const _uuid = Uuid();

  Stream<List<CustomField>> watchFields(String entityType, String entityId) {
    return (select(customFields)
          ..where((t) =>
              t.entityType.equals(entityType) & t.entityId.equals(entityId))
          ..orderBy([(t) => OrderingTerm(expression: t.sortIndex)]))
        .watch();
  }

  Future<String> addField({
    required String projectId,
    required String entityType,
    required String entityId,
    required String label,
    String? value,
  }) async {
    final id = _uuid.v4();
    final existing = await (select(customFields)
          ..where((t) =>
              t.entityType.equals(entityType) & t.entityId.equals(entityId)))
        .get();
    await into(customFields).insert(
      CustomFieldsCompanion.insert(
        id: id,
        projectId: projectId,
        entityType: entityType,
        entityId: entityId,
        label: label,
        value: Value(value),
        sortIndex: Value(existing.length),
      ),
    );
    return id;
  }

  Future<void> updateField({
    required String id,
    String? label,
    String? value,
  }) {
    return (update(customFields)..where((t) => t.id.equals(id))).write(
      CustomFieldsCompanion(
        label: label == null ? const Value.absent() : Value(label),
        value: Value(value),
      ),
    );
  }

  Future<void> deleteField(String id) {
    return (delete(customFields)..where((t) => t.id.equals(id))).go();
  }
}
