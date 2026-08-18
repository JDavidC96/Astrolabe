import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';
import 'tag_dao.dart';

part 'search_dao.g.dart';

/// One hit from the global search, flattened so the results list can render
/// every entity kind with the same widget.
class SearchResult {
  final String entityType;
  final String entityId;
  final String title;
  final String? subtitle;
  final String? imagePath;

  SearchResult({
    required this.entityType,
    required this.entityId,
    required this.title,
    this.subtitle,
    this.imagePath,
  });
}

@DriftAccessor(tables: [
  Characters,
  Locations,
  Factions,
  TimelineEvents,
  Items,
  MagicSystems,
  Chapters,
  Notes,
])
class SearchDao extends DatabaseAccessor<AppDatabase> with _$SearchDaoMixin {
  SearchDao(super.db);

  /// Searches every section of a project at once. Matching is a
  /// case-insensitive substring test over each entity's most identifying
  /// text fields.
  Future<List<SearchResult>> search(String projectId, String query) async {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return [];
    final pattern = '%$q%';

    bool matches(String? value) =>
        value != null && value.toLowerCase().contains(q);

    final results = <SearchResult>[];

    final characterRows = await (select(characters)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.firstName.lower().like(pattern) |
                  t.lastName.lower().like(pattern) |
                  t.aliasNickname.lower().like(pattern) |
                  t.race.lower().like(pattern) |
                  t.occupation.lower().like(pattern) |
                  t.backstory.lower().like(pattern) |
                  t.notes.lower().like(pattern))))
        .get();
    for (final c in characterRows) {
      results.add(SearchResult(
        entityType: TagEntity.character,
        entityId: c.id,
        title: '${c.firstName} ${c.lastName ?? ''}'.trim(),
        subtitle: [
          if (c.race != null && c.race!.isNotEmpty) c.race!,
          if (c.occupation != null && c.occupation!.isNotEmpty) c.occupation!,
        ].join(' · '),
        imagePath: c.portraitImagePath,
      ));
    }

    final locationRows = await (select(locations)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.name.lower().like(pattern) |
                  t.type.lower().like(pattern) |
                  t.description.lower().like(pattern) |
                  t.government.lower().like(pattern))))
        .get();
    for (final l in locationRows) {
      results.add(SearchResult(
        entityType: TagEntity.location,
        entityId: l.id,
        title: l.name,
        subtitle: l.type,
        imagePath: l.mapImagePath,
      ));
    }

    final factionRows = await (select(factions)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.name.lower().like(pattern) |
                  t.type.lower().like(pattern) |
                  t.description.lower().like(pattern))))
        .get();
    for (final f in factionRows) {
      results.add(SearchResult(
        entityType: TagEntity.faction,
        entityId: f.id,
        title: f.name,
        subtitle: f.type,
        imagePath: f.symbolImagePath,
      ));
    }

    final eventRows = await (select(timelineEvents)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.title.lower().like(pattern) |
                  t.fictionalDate.lower().like(pattern) |
                  t.description.lower().like(pattern))))
        .get();
    for (final e in eventRows) {
      results.add(SearchResult(
        entityType: TagEntity.event,
        entityId: e.id,
        title: e.title,
        subtitle: e.fictionalDate,
      ));
    }

    final itemRows = await (select(items)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.name.lower().like(pattern) |
                  t.type.lower().like(pattern) |
                  t.description.lower().like(pattern) |
                  t.powers.lower().like(pattern))))
        .get();
    for (final i in itemRows) {
      results.add(SearchResult(
        entityType: TagEntity.item,
        entityId: i.id,
        title: i.name,
        subtitle: i.type,
        imagePath: i.imagePath,
      ));
    }

    final magicRows = await (select(magicSystems)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.name.lower().like(pattern) |
                  t.description.lower().like(pattern) |
                  t.rules.lower().like(pattern) |
                  t.source.lower().like(pattern))))
        .get();
    for (final m in magicRows) {
      results.add(SearchResult(
        entityType: TagEntity.magic,
        entityId: m.id,
        title: m.name,
        subtitle: m.source,
        imagePath: m.imagePath,
      ));
    }

    final chapterRows = await (select(chapters)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.title.lower().like(pattern) |
                  t.summary.lower().like(pattern) |
                  t.content.lower().like(pattern))))
        .get();
    for (final c in chapterRows) {
      results.add(SearchResult(
        entityType: TagEntity.chapter,
        entityId: c.id,
        title: c.title,
        subtitle: matches(c.summary) ? c.summary : null,
      ));
    }

    final noteRows = await (select(notes)
          ..where((t) =>
              t.projectId.equals(projectId) &
              (t.title.lower().like(pattern) | t.content.lower().like(pattern))))
        .get();
    for (final n in noteRows) {
      results.add(SearchResult(
        entityType: TagEntity.note,
        entityId: n.id,
        title: n.title,
        subtitle: matches(n.content) ? n.content : null,
      ));
    }

    return results;
  }
}
