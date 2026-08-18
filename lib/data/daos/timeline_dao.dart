import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'timeline_dao.g.dart';

@DriftAccessor(tables: [TimelineEvents, EventCharacters, Characters])
class TimelineDao extends DatabaseAccessor<AppDatabase> with _$TimelineDaoMixin {
  TimelineDao(super.db);

  static const _uuid = Uuid();

  Stream<List<TimelineEvent>> watchEvents(String projectId) {
    return (select(timelineEvents)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.sortIndex)]))
        .watch();
  }

  Stream<TimelineEvent> watchEvent(String id) {
    return (select(timelineEvents)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<TimelineEvent> getEvent(String id) {
    return (select(timelineEvents)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<Character>> watchEventCharacters(String eventId) {
    final query = select(characters).join([
      innerJoin(eventCharacters, eventCharacters.characterId.equalsExp(characters.id)),
    ])
      ..where(eventCharacters.eventId.equals(eventId));
    return query.watch().map((rows) => rows.map((r) => r.readTable(characters)).toList());
  }

  Future<String> createEvent({
    required String projectId,
    required String title,
  }) async {
    final id = _uuid.v4();
    final existing = await (select(timelineEvents)..where((t) => t.projectId.equals(projectId))).get();
    await into(timelineEvents).insert(
      TimelineEventsCompanion.insert(
        id: id,
        projectId: projectId,
        title: title,
        sortIndex: Value(existing.length),
      ),
    );
    return id;
  }

  Future<void> updateEvent(TimelineEventsCompanion entry) {
    return (update(timelineEvents)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteEvent(String id) {
    return (delete(timelineEvents)..where((t) => t.id.equals(id))).go();
  }

  /// Persists a new manual ordering (called after a drag-and-drop reorder).
  Future<void> reorderEvents(List<String> orderedEventIds) {
    return transaction(() async {
      for (var i = 0; i < orderedEventIds.length; i++) {
        await (update(timelineEvents)..where((t) => t.id.equals(orderedEventIds[i])))
            .write(TimelineEventsCompanion(sortIndex: Value(i)));
      }
    });
  }

  Future<void> setEventCharacters(String eventId, List<String> characterIds) {
    return transaction(() async {
      await (delete(eventCharacters)..where((t) => t.eventId.equals(eventId))).go();
      for (final characterId in characterIds) {
        await into(eventCharacters).insert(
          EventCharactersCompanion.insert(eventId: eventId, characterId: characterId),
        );
      }
    });
  }
}
