import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'family_dao.g.dart';

/// A character plus their immediate family, used to lay out the tree.
class FamilyNode {
  final Character character;
  final List<String> parentIds;
  final List<String> childIds;

  FamilyNode({
    required this.character,
    required this.parentIds,
    required this.childIds,
  });
}

@DriftAccessor(tables: [FamilyLinks, Characters])
class FamilyDao extends DatabaseAccessor<AppDatabase> with _$FamilyDaoMixin {
  FamilyDao(super.db);

  /// Every parent/child link in the project, resolved into nodes the tree
  /// widget can walk without issuing further queries.
  Stream<List<FamilyNode>> watchFamily(String projectId) {
    final charactersQuery = select(characters)
      ..where((t) => t.projectId.equals(projectId))
      ..orderBy([(t) => OrderingTerm(expression: t.firstName)]);

    return charactersQuery.watch().asyncMap((people) async {
      if (people.isEmpty) return <FamilyNode>[];
      final ids = people.map((c) => c.id).toSet();
      final links = await select(familyLinks).get();

      final parents = <String, List<String>>{};
      final children = <String, List<String>>{};
      for (final link in links) {
        // Links are global; keep only those inside this project.
        if (!ids.contains(link.parentId) || !ids.contains(link.childId)) {
          continue;
        }
        parents.putIfAbsent(link.childId, () => []).add(link.parentId);
        children.putIfAbsent(link.parentId, () => []).add(link.childId);
      }

      return [
        for (final person in people)
          FamilyNode(
            character: person,
            parentIds: parents[person.id] ?? const [],
            childIds: children[person.id] ?? const [],
          ),
      ];
    });
  }

  Stream<List<Character>> watchParents(String childId) {
    final query = select(characters).join([
      innerJoin(familyLinks, familyLinks.parentId.equalsExp(characters.id)),
    ])
      ..where(familyLinks.childId.equals(childId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(characters)).toList(),
        );
  }

  Stream<List<Character>> watchChildren(String parentId) {
    final query = select(characters).join([
      innerJoin(familyLinks, familyLinks.childId.equalsExp(characters.id)),
    ])
      ..where(familyLinks.parentId.equals(parentId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(characters)).toList(),
        );
  }

  /// Would making [parentId] a parent of [childId] create a cycle? A person
  /// cannot end up as their own ancestor.
  Future<bool> wouldCreateCycle(String parentId, String childId) async {
    if (parentId == childId) return true;
    final links = await select(familyLinks).get();
    final childrenOf = <String, List<String>>{};
    for (final link in links) {
      childrenOf.putIfAbsent(link.parentId, () => []).add(link.childId);
    }
    // Walk down from the prospective child; if we reach the prospective
    // parent, the link would close a loop.
    final seen = <String>{childId};
    final queue = <String>[childId];
    while (queue.isNotEmpty) {
      final current = queue.removeLast();
      for (final next in childrenOf[current] ?? const <String>[]) {
        if (next == parentId) return true;
        if (seen.add(next)) queue.add(next);
      }
    }
    return false;
  }

  Future<void> addLink({required String parentId, required String childId}) {
    return into(familyLinks).insert(
      FamilyLinksCompanion.insert(parentId: parentId, childId: childId),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> removeLink({required String parentId, required String childId}) {
    return (delete(familyLinks)
          ..where((t) => t.parentId.equals(parentId) & t.childId.equals(childId)))
        .go();
  }
}
