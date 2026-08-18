import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'relationship_dao.g.dart';

/// A relationship together with everyone in it. [others] excludes the
/// character whose detail screen is being shown, so the UI can render
/// "Hermanos — Kael, Lyra" without repeating the current character.
class RelationshipWithMembers {
  final CharacterRelationship relationship;
  final List<Character> members;
  final List<Character> others;

  RelationshipWithMembers({
    required this.relationship,
    required this.members,
    required this.others,
  });
}

@DriftAccessor(tables: [CharacterRelationships, RelationshipMembers, Characters])
class RelationshipDao extends DatabaseAccessor<AppDatabase>
    with _$RelationshipDaoMixin {
  RelationshipDao(super.db);

  static const _uuid = Uuid();

  /// Every relationship the given character belongs to, with all members
  /// resolved.
  Stream<List<RelationshipWithMembers>> watchRelationshipsForCharacter(
    String characterId,
  ) {
    final membership = select(relationshipMembers)
      ..where((t) => t.characterId.equals(characterId));

    return membership.watch().asyncMap((rows) async {
      final ids = rows.map((r) => r.relationshipId).toList();
      if (ids.isEmpty) return <RelationshipWithMembers>[];
      return _loadRelationships(ids, excluding: characterId);
    });
  }

  Stream<List<RelationshipWithMembers>> watchRelationships(String projectId) {
    final query = select(characterRelationships)
      ..where((t) => t.projectId.equals(projectId))
      ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]);

    return query.watch().asyncMap(
          (rows) => _loadRelationships(rows.map((r) => r.id).toList()),
        );
  }

  Future<List<RelationshipWithMembers>> _loadRelationships(
    List<String> relationshipIds, {
    String? excluding,
  }) async {
    if (relationshipIds.isEmpty) return [];

    final relationships = await (select(characterRelationships)
          ..where((t) => t.id.isIn(relationshipIds))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();

    final memberRows = await (select(relationshipMembers).join([
      innerJoin(characters, characters.id.equalsExp(relationshipMembers.characterId)),
    ])..where(relationshipMembers.relationshipId.isIn(relationshipIds)))
        .get();

    final byRelationship = <String, List<Character>>{};
    for (final row in memberRows) {
      final link = row.readTable(relationshipMembers);
      byRelationship
          .putIfAbsent(link.relationshipId, () => [])
          .add(row.readTable(characters));
    }

    return [
      for (final relationship in relationships)
        () {
          final members = byRelationship[relationship.id] ?? const <Character>[];
          return RelationshipWithMembers(
            relationship: relationship,
            members: members,
            others: excluding == null
                ? members
                : members.where((c) => c.id != excluding).toList(),
          );
        }(),
    ];
  }

  Future<String> createRelationship({
    required String projectId,
    required String relationshipType,
    String? description,
    required List<String> characterIds,
  }) async {
    final id = _uuid.v4();
    await transaction(() async {
      await into(characterRelationships).insert(
        CharacterRelationshipsCompanion.insert(
          id: id,
          projectId: projectId,
          relationshipType: relationshipType,
          description: Value(description),
        ),
      );
      for (final characterId in characterIds) {
        await into(relationshipMembers).insert(
          RelationshipMembersCompanion.insert(
            relationshipId: id,
            characterId: characterId,
          ),
        );
      }
    });
    return id;
  }

  Future<void> updateRelationship({
    required String id,
    required String relationshipType,
    String? description,
    required List<String> characterIds,
  }) {
    return transaction(() async {
      await (update(characterRelationships)..where((t) => t.id.equals(id))).write(
        CharacterRelationshipsCompanion(
          relationshipType: Value(relationshipType),
          description: Value(description),
        ),
      );
      await (delete(relationshipMembers)
            ..where((t) => t.relationshipId.equals(id)))
          .go();
      for (final characterId in characterIds) {
        await into(relationshipMembers).insert(
          RelationshipMembersCompanion.insert(
            relationshipId: id,
            characterId: characterId,
          ),
        );
      }
    });
  }

  Future<void> deleteRelationship(String id) {
    return (delete(characterRelationships)..where((t) => t.id.equals(id))).go();
  }
}
