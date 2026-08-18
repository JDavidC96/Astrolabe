import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../database.dart';
import '../tables.dart';

part 'map_pin_dao.g.dart';

@DriftAccessor(tables: [MapPins])
class MapPinDao extends DatabaseAccessor<AppDatabase> with _$MapPinDaoMixin {
  MapPinDao(super.db);

  static const _uuid = Uuid();

  /// Pins drawn on one location's map.
  Stream<List<MapPin>> watchPinsOnMap(String mapLocationId) {
    return (select(mapPins)
          ..where((t) => t.mapLocationId.equals(mapLocationId))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .watch();
  }

  Future<String> addPin({
    required String projectId,
    required String mapLocationId,
    required String targetType,
    required String targetId,
    required double x,
    required double y,
    String? label,
  }) async {
    final id = _uuid.v4();
    await into(mapPins).insert(
      MapPinsCompanion.insert(
        id: id,
        projectId: projectId,
        mapLocationId: mapLocationId,
        targetType: targetType,
        targetId: targetId,
        x: x,
        y: y,
        label: Value(label),
      ),
    );
    return id;
  }

  /// Moves a pin after a drag. Coordinates are clamped so a pin can never be
  /// dropped outside the image and become unreachable.
  Future<void> movePin({
    required String id,
    required double x,
    required double y,
  }) {
    return (update(mapPins)..where((t) => t.id.equals(id))).write(
      MapPinsCompanion(
        x: Value(x.clamp(0.0, 1.0)),
        y: Value(y.clamp(0.0, 1.0)),
      ),
    );
  }

  Future<void> updateLabel({required String id, String? label}) {
    return (update(mapPins)..where((t) => t.id.equals(id)))
        .write(MapPinsCompanion(label: Value(label)));
  }

  Future<void> deletePin(String id) {
    return (delete(mapPins)..where((t) => t.id.equals(id))).go();
  }
}
