import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/services/chapter_timeline_sync.dart';

void main() {
  late AppDatabase db;
  late ChapterTimelineSync sync;
  late String projectId;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    sync = ChapterTimelineSync(db);
    projectId = await db.projectDao.createProject(name: 'Eldoria');
  });

  tearDown(() async => db.close());

  Future<String> newChapter({
    required String title,
    String? summary,
    int? year,
  }) async {
    final id = await db.chapterDao.createChapter(
      projectId: projectId,
      title: title,
    );
    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(id),
      summary: Value(summary),
      storyYear: Value(year),
    ));
    // Mirrors what the chapter screen does on save, so these tests exercise
    // the same path the app takes.
    await sync.syncChapter(id);
    return id;
  }

  test('nothing is mirrored while auto-sync is off', () async {
    final chapterId = await newChapter(title: 'Uno', summary: 'Pasa algo');
    await sync.syncChapter(chapterId);

    final events = await db.timelineDao.watchEvents(projectId).first;
    expect(events, isEmpty);
  });

  test('turning it on mirrors existing chapters that have a summary',
      () async {
    await newChapter(title: 'Con resumen', summary: 'Cae la ciudad', year: 298);
    await newChapter(title: 'Sin resumen');

    await sync.setAutoSync(projectId, true);

    final events = await db.timelineDao.watchEvents(projectId).first;
    // The summary-less chapter would only add noise, so it is skipped.
    expect(events, hasLength(1));
    expect(events.single.title, 'Con resumen');
    expect(events.single.description, 'Cae la ciudad');
    expect(events.single.year, 298);
    expect(events.single.sourceChapterId, isNotNull);
  });

  test('editing the chapter updates its mirrored event', () async {
    await sync.setAutoSync(projectId, true);
    final chapterId = await newChapter(title: 'Uno', summary: 'Primera versión');

    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(chapterId),
      title: const Value('Uno, revisado'),
      summary: const Value('Segunda versión'),
      storyYear: const Value(300),
    ));
    await sync.syncChapter(chapterId);

    final events = await db.timelineDao.watchEvents(projectId).first;
    expect(events, hasLength(1), reason: 'must update, not duplicate');
    expect(events.single.title, 'Uno, revisado');
    expect(events.single.description, 'Segunda versión');
    expect(events.single.year, 300);
  });

  test('clearing the summary removes the mirrored event', () async {
    await sync.setAutoSync(projectId, true);
    final chapterId = await newChapter(title: 'Uno', summary: 'Algo');
    expect(await db.timelineDao.watchEvents(projectId).first, hasLength(1));

    await db.chapterDao.updateChapter(
      ChaptersCompanion(id: Value(chapterId), summary: const Value(null)),
    );
    await sync.syncChapter(chapterId);

    expect(await db.timelineDao.watchEvents(projectId).first, isEmpty);
  });

  test('turning it off removes mirrored events but keeps hand-made ones',
      () async {
    await sync.setAutoSync(projectId, true);
    await newChapter(title: 'Capítulo', summary: 'Del capítulo');
    await sync.syncAllChapters(projectId);
    await db.timelineDao.createEvent(projectId: projectId, title: 'A mano');

    expect(await db.timelineDao.watchEvents(projectId).first, hasLength(2));

    await sync.setAutoSync(projectId, false);

    final remaining = await db.timelineDao.watchEvents(projectId).first;
    expect(remaining, hasLength(1));
    expect(remaining.single.title, 'A mano');
  });

  test('an unlinked event survives later chapter edits untouched', () async {
    await sync.setAutoSync(projectId, true);
    final chapterId = await newChapter(title: 'Uno', summary: 'Original');
    final event = (await db.timelineDao.watchEvents(projectId).first).single;

    await db.timelineDao.unlinkFromChapter(event.id);
    await db.timelineDao.updateEvent(TimelineEventsCompanion(
      id: Value(event.id),
      title: const Value('Redactado a mano'),
    ));

    // The chapter changes and re-syncs; the detached event must not move.
    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(chapterId),
      summary: const Value('Texto nuevo del capítulo'),
    ));
    await sync.syncChapter(chapterId);

    final events = await db.timelineDao.watchEvents(projectId).first;
    final detached = events.firstWhere((e) => e.sourceChapterId == null);
    expect(detached.title, 'Redactado a mano');
    expect(detached.description, 'Original');
    // Re-syncing creates a fresh mirrored event, leaving the manual one be.
    expect(events.where((e) => e.sourceChapterId != null), hasLength(1));
  });

  test('deleting a chapter takes its mirrored event with it', () async {
    await sync.setAutoSync(projectId, true);
    final chapterId = await newChapter(title: 'Uno', summary: 'Algo');
    expect(await db.timelineDao.watchEvents(projectId).first, hasLength(1));

    await db.chapterDao.deleteChapter(chapterId);

    expect(await db.timelineDao.watchEvents(projectId).first, isEmpty,
        reason: 'the cascade should clean up the orphaned event');
  });

  test('the one-off copy is independent of the chapter', () async {
    final chapterId =
        await newChapter(title: 'Uno', summary: 'Resumen', year: 42);
    await sync.addChapterOnce(chapterId);

    final events = await db.timelineDao.watchEvents(projectId).first;
    expect(events, hasLength(1));
    expect(events.single.description, 'Resumen');
    expect(events.single.year, 42);
    // Not linked, so nothing will ever overwrite it.
    expect(events.single.sourceChapterId, isNull);
  });

  group('chronological ordering', () {
    test('sorts by year when asked, leaving undated events last', () async {
      final a = await db.timelineDao
          .createEvent(projectId: projectId, title: 'Tardío');
      final b = await db.timelineDao
          .createEvent(projectId: projectId, title: 'Temprano');
      final c = await db.timelineDao
          .createEvent(projectId: projectId, title: 'Sin año');

      await db.timelineDao.updateEvent(
          TimelineEventsCompanion(id: Value(a), year: const Value(300)));
      await db.timelineDao.updateEvent(
          TimelineEventsCompanion(id: Value(b), year: const Value(150)));

      final byYear = await db.timelineDao
          .watchEvents(projectId, sortByYear: true)
          .first;
      expect(byYear.map((e) => e.title), ['Temprano', 'Tardío', 'Sin año']);

      // Manual order is unaffected and still reflects creation order.
      final manual = await db.timelineDao.watchEvents(projectId).first;
      expect(manual.map((e) => e.id), [a, b, c]);
    });
  });

  group('chapters a character appears in', () {
    test('reads the link back from the character side', () async {
      final aria = await db.characterDao
          .createCharacter(projectId: projectId, firstName: 'Aria');
      final kael = await db.characterDao
          .createCharacter(projectId: projectId, firstName: 'Kael');

      final uno = await newChapter(title: 'Uno');
      final dos = await newChapter(title: 'Dos');
      await newChapter(title: 'Tres');

      await db.chapterDao.setChapterCharacters(uno, [aria, kael]);
      await db.chapterDao.setChapterCharacters(dos, [aria]);

      final ariaChapters =
          await db.chapterDao.watchChaptersWithCharacter(aria).first;
      expect(ariaChapters.map((c) => c.title), ['Uno', 'Dos']);

      final kaelChapters =
          await db.chapterDao.watchChaptersWithCharacter(kael).first;
      expect(kaelChapters.map((c) => c.title), ['Uno']);
    });

    test('a character in nothing yet gets an empty list', () async {
      final nadie = await db.characterDao
          .createCharacter(projectId: projectId, firstName: 'Nadie');
      expect(await db.chapterDao.watchChaptersWithCharacter(nadie).first,
          isEmpty);
    });

    test('removing a character from a chapter updates the reverse view',
        () async {
      final aria = await db.characterDao
          .createCharacter(projectId: projectId, firstName: 'Aria');
      final uno = await newChapter(title: 'Uno');
      await db.chapterDao.setChapterCharacters(uno, [aria]);
      expect(await db.chapterDao.watchChaptersWithCharacter(aria).first,
          hasLength(1));

      await db.chapterDao.setChapterCharacters(uno, []);
      expect(
          await db.chapterDao.watchChaptersWithCharacter(aria).first, isEmpty);
    });
  });
}
