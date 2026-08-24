import 'package:drift/drift.dart';

import '../data/database.dart';

/// Mirrors chapter summaries into the timeline.
///
/// Ownership is deliberate and one-directional: while an event carries a
/// `sourceChapterId`, the chapter is the source of truth for its title,
/// summary and year. That keeps the two from drifting apart silently. A
/// user who wants to edit the wording on the timeline can unlink the event,
/// which turns it into an ordinary hand-made entry.
class ChapterTimelineSync {
  ChapterTimelineSync(this._db);

  final AppDatabase _db;

  /// Brings one chapter's mirrored event up to date.
  ///
  /// A chapter only earns a place on the timeline once it has a summary —
  /// an empty stub would just be noise.
  Future<void> syncChapter(String chapterId) async {
    final chapter = await _db.chapterDao.getChapter(chapterId);
    final project = await _db.projectDao.getProject(chapter.projectId);
    if (!project.autoChapterTimeline) return;

    final existing = await _db.timelineDao.findEventForChapter(chapterId);
    final summary = chapter.summary?.trim();

    if (summary == null || summary.isEmpty) {
      // Lost its summary: drop the mirrored event rather than leaving a
      // stale one behind.
      if (existing != null) await _db.timelineDao.deleteEvent(existing.id);
      return;
    }

    if (existing == null) {
      await _db.timelineDao.createEventForChapter(
        projectId: chapter.projectId,
        chapterId: chapterId,
        title: chapter.title,
        description: summary,
        year: chapter.storyYear,
      );
    } else {
      await _db.timelineDao.updateEvent(
        TimelineEventsCompanion(
          id: Value(existing.id),
          title: Value(chapter.title),
          description: Value(summary),
          year: Value(chapter.storyYear),
        ),
      );
    }
  }

  /// Rebuilds every mirrored event in a project — used when the switch is
  /// first turned on, so existing chapters appear immediately.
  Future<void> syncAllChapters(String projectId) async {
    final chapters = await _db.chapterDao.watchChapters(projectId).first;
    for (final chapter in chapters) {
      await syncChapter(chapter.id);
    }
  }

  /// Turns the feature on or off for a project, adding or removing the
  /// mirrored events to match.
  Future<void> setAutoSync(String projectId, bool enabled) async {
    await _db.projectDao.setAutoChapterTimeline(projectId, enabled);
    if (enabled) {
      await syncAllChapters(projectId);
    } else {
      await _db.timelineDao.deleteChapterLinkedEvents(projectId);
    }
  }

  /// One-off copy of a chapter onto the timeline, deliberately *not*
  /// linked, so it stays exactly as the user leaves it.
  Future<String> addChapterOnce(String chapterId) async {
    final chapter = await _db.chapterDao.getChapter(chapterId);
    final id = await _db.timelineDao.createEvent(
      projectId: chapter.projectId,
      title: chapter.title,
    );
    await _db.timelineDao.updateEvent(
      TimelineEventsCompanion(
        id: Value(id),
        description: Value(chapter.summary?.trim()),
        year: Value(chapter.storyYear),
      ),
    );
    return id;
  }
}
