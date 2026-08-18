import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'location_dao.g.dart';

@DriftAccessor(tables: [Locations])
class LocationDao extends DatabaseAccessor<AppDatabase> with _$LocationDaoMixin {
  LocationDao(super.db);

  static const _uuid = Uuid();

  /// All locations for a project, flat — callers build the tree client-side.
  Stream<List<Location>> watchLocations(String projectId) {
    return (select(locations)
          ..where((t) => t.projectId.equals(projectId))
          ..orderBy([(t) => OrderingTerm(expression: t.name)]))
        .watch();
  }

  Stream<Location> watchLocation(String id) {
    return (select(locations)..where((t) => t.id.equals(id))).watchSingle();
  }

  Future<Location> getLocation(String id) {
    return (select(locations)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<String> createLocation({
    required String projectId,
    String? parentLocationId,
    required String name,
    String? type,
  }) async {
    final id = _uuid.v4();
    await into(locations).insert(
      LocationsCompanion.insert(
        id: id,
        projectId: projectId,
        parentLocationId: Value(parentLocationId),
        name: name,
        type: Value(type),
      ),
    );
    return id;
  }

  Future<void> updateLocation(LocationsCompanion entry) {
    return (update(locations)..where((t) => t.id.equals(entry.id.value))).write(entry);
  }

  Future<void> deleteLocation(String id) {
    return (delete(locations)..where((t) => t.id.equals(id))).go();
  }
}
