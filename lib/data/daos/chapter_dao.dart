import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'chapter_dao.g.dart';

@DriftAccessor(tables: [
  Chapters,
  ChapterCharacters,
  ChapterLocations,
  Characters,
  Locations,
])
class ChapterDao extends DatabaseAccessor<AppDatabase> with _$ChapterDaoMixin {
  ChapterDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Chapter>> watchChapters(String projectId) {
    return (select(chapters)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.sortIndex)]))
        .watch();
  }

  Future<Chapter> getChapter(String id) {
    return (select(chapters)..where((t) => t.id.equals(id))).getSingle();
  }

  Stream<List<Character>> watchChapterCharacters(String chapterId) {
    final query = select(characters).join([
      innerJoin(
        chapterCharacters,
        chapterCharacters.characterId.equalsExp(characters.id),
      ),
    ])
      ..where(chapterCharacters.chapterId.equals(chapterId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(characters)).toList(),
        );
  }

  Stream<List<Location>> watchChapterLocations(String chapterId) {
    final query = select(locations).join([
      innerJoin(
        chapterLocations,
        chapterLocations.locationId.equalsExp(locations.id),
      ),
    ])
      ..where(chapterLocations.chapterId.equals(chapterId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(locations)).toList(),
        );
  }

  Future<String> createChapter({
    required String projectId,
    required String title,
  }) async {
    final id = _uuid.v4();
    final existing =
        await (select(chapters)..where((t) => t.projectId.equals(projectId))).get();
    await into(chapters).insert(
      ChaptersCompanion.insert(
        id: id,
        projectId: projectId,
        title: title,
        sortIndex: Value(existing.length),
      ),
    );
    return id;
  }

  Future<void> updateChapter(ChaptersCompanion entry) {
    return (update(chapters)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteChapter(String id) {
    return (delete(chapters)..where((t) => t.id.equals(id))).go();
  }

  Future<void> reorderChapters(List<String> orderedIds) {
    return transaction(() async {
      for (var i = 0; i < orderedIds.length; i++) {
        await (update(chapters)..where((t) => t.id.equals(orderedIds[i])))
            .write(ChaptersCompanion(sortIndex: Value(i)));
      }
    });
  }

  Future<void> setChapterCharacters(String chapterId, List<String> characterIds) {
    return transaction(() async {
      await (delete(chapterCharacters)..where((t) => t.chapterId.equals(chapterId)))
          .go();
      for (final characterId in characterIds) {
        await into(chapterCharacters).insert(
          ChapterCharactersCompanion.insert(
            chapterId: chapterId,
            characterId: characterId,
          ),
        );
      }
    });
  }

  Future<void> setChapterLocations(String chapterId, List<String> locationIds) {
    return transaction(() async {
      await (delete(chapterLocations)..where((t) => t.chapterId.equals(chapterId)))
          .go();
      for (final locationId in locationIds) {
        await into(chapterLocations).insert(
          ChapterLocationsCompanion.insert(
            chapterId: chapterId,
            locationId: locationId,
          ),
        );
      }
    });
  }
}
