import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [Characters])
class CharacterDao extends DatabaseAccessor<AppDatabase> with _$CharacterDaoMixin {
  CharacterDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Character>> watchCharacters(String projectId) {
    return (select(characters)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.firstName)]))
        .watch();
  }

  Stream<Character> watchCharacter(String id) {
    return (select(characters)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<Character> getCharacter(String id) {
    return (select(characters)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createCharacter({
    required String projectId,
    required String firstName,
  }) async {
    final id = _uuid.v4();
    await into(characters).insert(
      CharactersCompanion.insert(id: id, projectId: projectId, firstName: firstName),
    );
    return id;
  }

  Future<void> updateCharacter(CharactersCompanion entry) {
    return (update(characters)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteCharacter(String id) {
    return (delete(characters)..where((t) => t.id.equals(id))).go();
  }
}
