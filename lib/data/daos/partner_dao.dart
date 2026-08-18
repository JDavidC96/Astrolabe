import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'partner_dao.g.dart';

@DriftAccessor(tables: [PartnerLinks, Characters])
class PartnerDao extends DatabaseAccessor<AppDatabase> with _$PartnerDaoMixin {
  PartnerDao(super.db);

  /// Partnerships are symmetric, so every row is stored with the smaller id
  /// first. Callers never have to care which way round they ask.
  static (String, String) _canonical(String a, String b) =>
      a.compareTo(b) <= 0 ? (a, b) : (b, a);

  Stream<List<PartnerLink>> watchAllPartners() => select(partnerLinks).watch();

  Stream<List<Character>> watchPartnersOf(String characterId) {
    final query = select(partnerLinks).join([
      leftOuterJoin(characters, characters.id.equalsExp(partnerLinks.aId)),
    ])
      ..where(partnerLinks.aId.equals(characterId) |
          partnerLinks.bId.equals(characterId));

    // Resolve the *other* side per row, which a single join cannot express.
    return query.watch().asyncMap((rows) async {
      final otherIds = <String>[];
      for (final row in rows) {
        final link = row.readTable(partnerLinks);
        otherIds.add(link.aId == characterId ? link.bId : link.aId);
      }
      if (otherIds.isEmpty) return <Character>[];
      return (select(characters)..where((t) => t.id.isIn(otherIds))).get();
    });
  }

  Future<void> link({
    required String aId,
    required String bId,
    String? type,
    String? status,
  }) {
    final (first, second) = _canonical(aId, bId);
    return into(partnerLinks).insertOnConflictUpdate(
      PartnerLinksCompanion.insert(
        aId: first,
        bId: second,
        type: Value(type),
        status: Value(status),
      ),
    );
  }

  Future<void> unlink({required String aId, required String bId}) {
    final (first, second) = _canonical(aId, bId);
    return (delete(partnerLinks)
          ..where((t) => t.aId.equals(first) & t.bId.equals(second)))
        .go();
  }
}
