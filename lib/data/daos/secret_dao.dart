import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'secret_dao.g.dart';

/// A secret together with everyone who is in on it.
class SecretWithKnowers {
  final Secret secret;
  final List<Character> knowers;
  final Character? owner;

  SecretWithKnowers({
    required this.secret,
    required this.knowers,
    this.owner,
  });
}

@DriftAccessor(tables: [Secrets, SecretKnowers, Characters])
class SecretDao extends DatabaseAccessor<AppDatabase> with _$SecretDaoMixin {
  SecretDao(super.db);

  static const _uuid = Uuid();

  Stream<List<SecretWithKnowers>> watchSecrets(String projectId) {
    final query = select(secrets)
      ..where((t) => t.projectId.equals(projectId))
      ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]);

    return query.watch().asyncMap((rows) async {
      if (rows.isEmpty) return <SecretWithKnowers>[];
      final ids = rows.map((s) => s.id).toList();

      final knowerRows = await (select(secretKnowers).join([
        innerJoin(characters, characters.id.equalsExp(secretKnowers.characterId)),
      ])..where(secretKnowers.secretId.isIn(ids)))
          .get();

      final bySecret = <String, List<Character>>{};
      for (final row in knowerRows) {
        final link = row.readTable(secretKnowers);
        bySecret
            .putIfAbsent(link.secretId, () => [])
            .add(row.readTable(characters));
      }

      final ownerIds =
          rows.map((s) => s.ownerCharacterId).whereType<String>().toList();
      final owners = ownerIds.isEmpty
          ? <Character>[]
          : await (select(characters)..where((t) => t.id.isIn(ownerIds))).get();
      final ownersById = {for (final o in owners) o.id: o};

      return [
        for (final secret in rows)
          SecretWithKnowers(
            secret: secret,
            knowers: bySecret[secret.id] ?? const [],
            owner: secret.ownerCharacterId == null
                ? null
                : ownersById[secret.ownerCharacterId],
          ),
      ];
    });
  }

  /// Secrets a given character is in on — the "what does she already know?"
  /// view from the character's side.
  Stream<List<Secret>> watchSecretsKnownBy(String characterId) {
    final query = select(secrets).join([
      innerJoin(secretKnowers, secretKnowers.secretId.equalsExp(secrets.id)),
    ])
      ..where(secretKnowers.characterId.equals(characterId));
    return query.watch().map(
          (rows) => rows.map((r) => r.readTable(secrets)).toList(),
        );
  }

  Future<Secret> getSecret(String id) {
    return (select(secrets)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<List<SecretKnower>> getKnowerLinks(String secretId) {
    return (select(secretKnowers)..where((t) => t.secretId.equals(secretId)))
        .get();
  }

  Future<String> createSecret({
    required String projectId,
    required String title,
  }) async {
    final id = _uuid.v4();
    await into(secrets).insert(
      SecretsCompanion.insert(id: id, projectId: projectId, title: title),
    );
    return id;
  }

  Future<void> updateSecret(SecretsCompanion entry) {
    return (update(secrets)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteSecret(String id) {
    return (delete(secrets)..where((t) => t.id.equals(id))).go();
  }

  Future<void> setKnower({
    required String secretId,
    required String characterId,
    String? howTheyKnow,
    String? knownSince,
  }) {
    return into(secretKnowers).insertOnConflictUpdate(
      SecretKnowersCompanion.insert(
        secretId: secretId,
        characterId: characterId,
        howTheyKnow: Value(howTheyKnow),
        knownSince: Value(knownSince),
      ),
    );
  }

  Future<void> removeKnower({
    required String secretId,
    required String characterId,
  }) {
    return (delete(secretKnowers)
          ..where((t) =>
              t.secretId.equals(secretId) & t.characterId.equals(characterId)))
        .go();
  }
}
