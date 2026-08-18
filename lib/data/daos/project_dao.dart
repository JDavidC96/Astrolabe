import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [Projects])
class ProjectDao extends DatabaseAccessor<AppDatabase> with _$ProjectDaoMixin {
  ProjectDao(super.db);

  static const _uuid = Uuid();

  Stream<List<Project>> watchAllProjects() {
    return (select(projects)
          ..orderBy([
            (t) => OrderingTerm(expression: t.updatedAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  Stream<Project> watchProject(String id) {
    return (select(projects)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<Project> getProject(String id) {
    return (select(projects)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createProject({
    required String name,
    String? description,
    String kind = ProjectKind.novel,
  }) async {
    final id = _uuid.v4();
    await into(projects).insert(
      ProjectsCompanion.insert(
        id: id,
        name: name,
        description: Value(description),
        kind: Value(kind),
      ),
    );
    return id;
  }

  Future<void> updateProject({
    required String id,
    required String name,
    String? description,
    String? coverImagePath,
  }) {
    return (update(projects)..where((t) => t.id.equals(id))).write(
      ProjectsCompanion(
        name: Value(name),
        description: Value(description),
        coverImagePath: Value(coverImagePath),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Persists just the cover, so choosing an image takes effect immediately
  /// without waiting for the user to confirm the rest of the form.
  Future<void> updateProjectCover({
    required String id,
    required String? coverImagePath,
  }) {
    return (update(projects)..where((t) => t.id.equals(id))).write(
      ProjectsCompanion(
        coverImagePath: Value(coverImagePath),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  /// Persists the visual theme on its own, so switching themes in the
  /// picker applies immediately without saving the rest of the form.
  Future<void> updateProjectTheme({
    required String id,
    required String themeId,
  }) {
    return (update(projects)..where((t) => t.id.equals(id))).write(
      ProjectsCompanion(
        themeId: Value(themeId),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> touchProject(String id) {
    return (update(projects)..where((t) => t.id.equals(id)))
        .write(ProjectsCompanion(updatedAt: Value(DateTime.now())));
  }

  Future<void> deleteProject(String id) {
    return (delete(projects)..where((t) => t.id.equals(id))).go();
  }
}
