import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'timeline_dao.g.dart';

@DriftAccessor(tables: [TimelineEvents, EventCharacters, Characters])
class TimelineDao extends DatabaseAccessor<AppDatabase> with _$TimelineDaoMixin {
  TimelineDao(super.db);

  static const _uuid = Uuid();

  /// Events for a project.
  ///
  /// With [sortByYear] the order is chronological, and events with no year
  /// yet fall to the end rather than being treated as year zero — an
  /// unknown date should not silently jump to the beginning of history.
  Stream<List<TimelineEvent>> watchEvents(
    String projectId, {
    bool sortByYear = false,
  }) {
    final query = select(timelineEvents)
      ..where((t) => t.projectId.equals(projectId));

    if (sortByYear) {
      query.orderBy([
        (t) => OrderingTerm(expression: t.year.isNull()),
        (t) => OrderingTerm(expression: t.year),
        (t) => OrderingTerm(expression: t.sortIndex),
      ]);
    } else {
      query.orderBy([(t) => OrderingTerm(expression: t.sortIndex)]);
    }
    return query.watch();
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

  /// The event mirroring a given chapter, if one exists.
  Future<TimelineEvent?> findEventForChapter(String chapterId) {
    return (select(timelineEvents)
          ..where((t) => t.sourceChapterId.equals(chapterId)))
        .getSingleOrNull();
  }

  Future<String> createEventForChapter({
    required String projectId,
    required String chapterId,
    required String title,
    String? description,
    int? year,
  }) async {
    final id = _uuid.v4();
    final existing =
        await (select(timelineEvents)..where((t) => t.projectId.equals(projectId)))
            .get();
    await into(timelineEvents).insert(
      TimelineEventsCompanion.insert(
        id: id,
        projectId: projectId,
        title: title,
        description: Value(description),
        year: Value(year),
        sourceChapterId: Value(chapterId),
        sortIndex: Value(existing.length),
      ),
    );
    return id;
  }

  /// Detaches an event from its chapter, so the user can edit it freely
  /// without the next chapter save overwriting their wording.
  Future<void> unlinkFromChapter(String eventId) {
    return (update(timelineEvents)..where((t) => t.id.equals(eventId)))
        .write(const TimelineEventsCompanion(sourceChapterId: Value(null)));
  }

  /// Removes every event that mirrors a chapter in this project. Used when
  /// the auto-sync switch is turned off; hand-made events are untouched.
  Future<void> deleteChapterLinkedEvents(String projectId) {
    return (delete(timelineEvents)
          ..where((t) =>
              t.projectId.equals(projectId) & t.sourceChapterId.isNotNull()))
        .go();
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
