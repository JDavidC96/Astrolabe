import 'kinship.dart';

/// Where one person sits in the drawn tree.
class TreeSlot {
  const TreeSlot({required this.id, required this.generation, required this.column});

  final String id;
  final int generation;
  final int column;
}

/// The finished arrangement: rows of ids, plus the edges to draw between
/// them.
class FamilyLayout {
  const FamilyLayout({
    required this.rows,
    required this.slots,
    required this.parentEdges,
    required this.partnerEdges,
    required this.unlinked,
  });

  /// Ids per generation, already ordered left to right.
  final List<List<String>> rows;

  /// Lookup from id to its position.
  final Map<String, TreeSlot> slots;

  /// (parentId, childId) pairs that need a line drawn.
  final List<(String, String)> parentEdges;

  /// (aId, bId) pairs sitting side by side as partners.
  final List<(String, String)> partnerEdges;

  /// People with no family links at all; shown separately so they don't
  /// stretch the tree with empty space.
  final List<String> unlinked;

  static const empty = FamilyLayout(
    rows: [],
    slots: {},
    parentEdges: [],
    partnerEdges: [],
    unlinked: [],
  );

  /// Arranges [everyone] into generation rows.
  ///
  /// Ordering matters as much as grouping: children are placed near the
  /// average position of their parents, and partners are pulled next to
  /// each other, which is what keeps the connecting lines readable instead
  /// of a tangle.
  static FamilyLayout build({
    required List<String> everyone,
    required Kinship kinship,
  }) {
    final connected = everyone
        .where((id) =>
            kinship.parents(id).isNotEmpty ||
            kinship.children(id).isNotEmpty ||
            kinship.partners(id).isNotEmpty)
        .toList();
    final unlinked = everyone.where((id) => !connected.contains(id)).toList();

    if (connected.isEmpty) {
      return FamilyLayout(
        rows: const [],
        slots: const {},
        parentEdges: const [],
        partnerEdges: const [],
        unlinked: unlinked,
      );
    }

    final depths = kinship.generations(connected);

    // Partners belong on the same row, or the connector between them would
    // cut across a generation.
    var changed = true;
    var guard = 0;
    while (changed && guard < 50) {
      changed = false;
      guard++;
      for (final id in connected) {
        for (final partner in kinship.partners(id)) {
          if (!depths.containsKey(partner)) continue;
          final deeper = depths[id]! > depths[partner]! ? depths[id]! : depths[partner]!;
          if (depths[id] != deeper || depths[partner] != deeper) {
            depths[id] = deeper;
            depths[partner] = deeper;
            changed = true;
          }
        }
      }
    }

    final maxDepth = depths.values.fold(0, (a, b) => a > b ? a : b);
    final rows = <List<String>>[];
    for (var depth = 0; depth <= maxDepth; depth++) {
      rows.add(connected.where((id) => depths[id] == depth).toList());
    }

    // Top row: keep a stable alphabetical order. Lower rows: sort by where
    // the parents ended up, then tuck partners together.
    for (var depth = 0; depth < rows.length; depth++) {
      final row = rows[depth];
      if (depth == 0) {
        row.sort();
      } else {
        final previous = rows[depth - 1];
        double anchor(String id) {
          final positions = kinship
              .parents(id)
              .map((p) => previous.indexOf(p))
              .where((i) => i >= 0)
              .toList();
          if (positions.isEmpty) return double.maxFinite;
          return positions.reduce((a, b) => a + b) / positions.length;
        }

        row.sort((a, b) {
          final byParent = anchor(a).compareTo(anchor(b));
          return byParent != 0 ? byParent : a.compareTo(b);
        });
      }
      _groupPartners(row, kinship);
    }

    final slots = <String, TreeSlot>{};
    for (var depth = 0; depth < rows.length; depth++) {
      for (var column = 0; column < rows[depth].length; column++) {
        final id = rows[depth][column];
        slots[id] = TreeSlot(id: id, generation: depth, column: column);
      }
    }

    final parentEdges = <(String, String)>[];
    for (final id in connected) {
      for (final parent in kinship.parents(id)) {
        if (slots.containsKey(parent)) parentEdges.add((parent, id));
      }
    }

    // Emit each partnership once, and only when the two ended up adjacent.
    final partnerEdges = <(String, String)>[];
    final seen = <String>{};
    for (final id in connected) {
      for (final partner in kinship.partners(id)) {
        final key = ([id, partner]..sort()).join('|');
        if (!seen.add(key)) continue;
        final a = slots[id];
        final b = slots[partner];
        if (a == null || b == null) continue;
        if (a.generation == b.generation && (a.column - b.column).abs() == 1) {
          partnerEdges.add(a.column < b.column ? (id, partner) : (partner, id));
        }
      }
    }

    return FamilyLayout(
      rows: rows,
      slots: slots,
      parentEdges: parentEdges,
      partnerEdges: partnerEdges,
      unlinked: unlinked..sort(),
    );
  }

  /// Moves each person's partner to sit immediately after them, preserving
  /// the rest of the order.
  static void _groupPartners(List<String> row, Kinship kinship) {
    for (var i = 0; i < row.length; i++) {
      final partners = kinship.partners(row[i]);
      if (partners.isEmpty) continue;
      for (var j = i + 2; j < row.length; j++) {
        if (partners.contains(row[j])) {
          final moved = row.removeAt(j);
          row.insert(i + 1, moved);
          break;
        }
      }
    }
  }
}
