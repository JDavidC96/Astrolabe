import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [Notes])
class NoteDao extends DatabaseAccessor<AppDatabase> with _$NoteDaoMixin {
  NoteDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Note>> watchNotes(String projectId) {
    return (select(notes)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  Future<Note> getNote(String id) {
    return (select(notes)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createNote({required String projectId, required String title}) async {
    final id = _uuid.v4();
    await into(notes).insert(
      NotesCompanion.insert(id: id, projectId: projectId, title: title),
    );
    return id;
  }

  Future<void> updateNote(NotesCompanion entry) {
    return (update(notes)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteNote(String id) {
    return (delete(notes)..where((t) => t.id.equals(id))).go();
  }
}
