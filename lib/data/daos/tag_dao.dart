import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'tag_dao.g.dart';

/// The kinds of entity a tag can be attached to. Stored as plain strings in
/// [TagLinks.entityType]; kept here so callers never hand-type them.
class TagEntity {
  static const character = 'character';
  static const location = 'location';
  static const faction = 'faction';
  static const event = 'event';
  static const item = 'item';
  static const magic = 'magic';
  static const chapter = 'chapter';
  static const note = 'note';
}

@DriftAccessor(tables: [Tags, TagLinks])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  TagDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Tag>> watchTags(String projectId) {
    return (select(tags)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  Stream<List<Tag>> watchTagsFor(String entityType, String entityId) {
    final query = select(tags).join([
      innerJoin(tagLinks, tagLinks.tagId.equalsExp(tags.id)),
    ])
      ..where(tagLinks.entityType.equals(entityType) &
          tagLinks.entityId.equals(entityId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(tags)).toList(),
        );
  }

  /// Ids of every entity of [entityType] carrying [tagId] — used to filter
  /// lists by tag.
  Future<List<String>> entityIdsWithTag(String tagId, String entityType) async {
    final rows = await (select(tagLinks)
          ..where((t) => t.tagId.equals(tagId) & t.entityType.equals(entityType)))
        .get();
    return rows.map((r) => r.entityId).toList();
  }

  /// Finds a tag by name within the project, creating it if needed, so the
  /// user can just type a tag without managing a separate tag list.
  Future<Tag> ensureTag({
    required String projectId,
    required String name,
    int? color,
  }) async {
    final trimmed = name.trim();
    final existing = await (select(tags)
          ..where((t) => t.projectId.equals(projectId) & t.name.equals(trimmed)))
        .getSingleOrNull();
    if (existing != null) return existing;

    final id = _uuid.v4();
    await into(tags).insert(
      TagsCompanion.insert(
        id: id,
        projectId: projectId,
        name: trimmed,
        color: Value(color),
      ),
    );
    return (select(tags)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<void> attachTag({
    required String tagId,
    required String entityType,
    required String entityId,
  }) {
    return into(tagLinks).insert(
      TagLinksCompanion.insert(
        tagId: tagId,
        entityType: entityType,
        entityId: entityId,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> detachTag({
    required String tagId,
    required String entityType,
    required String entityId,
  }) {
    return (delete(tagLinks)
          ..where((t) =>
              t.tagId.equals(tagId) &
              t.entityType.equals(entityType) &
              t.entityId.equals(entityId)))
        .go();
  }

  /// Removes a tag entirely, including every link to it.
  Future<void> deleteTag(String tagId) {
    return (delete(tags)..where((t) => t.id.equals(tagId))).go();
  }
}
