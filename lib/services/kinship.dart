/// Derives every family relationship from the only facts worth storing:
/// who is whose parent, and who is partnered with whom.
///
/// Siblings, grandparents, uncles and cousins are all consequences of those
/// links, so they are computed rather than recorded — that way they can
/// never contradict the underlying data.
class Kinship {
  Kinship(this._parentsOf, this._partnersOf) {
    // Invert once so child lookups are as cheap as parent lookups.
    for (final entry in _parentsOf.entries) {
      for (final parent in entry.value) {
        _childrenOf.putIfAbsent(parent, () => <String>{}).add(entry.key);
      }
    }
  }

  /// Builds from raw link rows.
  factory Kinship.fromLinks({
    required Iterable<(String parentId, String childId)> familyLinks,
    Iterable<(String, String)> partnerLinks = const [],
  }) {
    final parents = <String, Set<String>>{};
    for (final (parentId, childId) in familyLinks) {
      parents.putIfAbsent(childId, () => <String>{}).add(parentId);
    }
    final partners = <String, Set<String>>{};
    for (final (a, b) in partnerLinks) {
      partners.putIfAbsent(a, () => <String>{}).add(b);
      partners.putIfAbsent(b, () => <String>{}).add(a);
    }
    return Kinship(parents, partners);
  }

  final Map<String, Set<String>> _parentsOf;
  final Map<String, Set<String>> _partnersOf;
  final Map<String, Set<String>> _childrenOf = {};

  Set<String> parents(String id) => _parentsOf[id] ?? const {};
  Set<String> children(String id) => _childrenOf[id] ?? const {};
  Set<String> partners(String id) => _partnersOf[id] ?? const {};

  /// Anyone sharing at least one parent, excluding the person themselves.
  Set<String> siblings(String id) {
    final result = <String>{};
    for (final parent in parents(id)) {
      result.addAll(children(parent));
    }
    return result..remove(id);
  }

  /// Siblings sharing *every* known parent, and with at least two parents
  /// recorded — otherwise "full" would be an overstatement.
  Set<String> fullSiblings(String id) {
    final mine = parents(id);
    if (mine.length < 2) return {};
    return siblings(id)
        .where((s) => parents(s).length == mine.length && parents(s).containsAll(mine))
        .toSet();
  }

  /// Siblings sharing some but not all parents.
  Set<String> halfSiblings(String id) =>
      siblings(id).difference(fullSiblings(id));

  Set<String> grandparents(String id) {
    final result = <String>{};
    for (final parent in parents(id)) {
      result.addAll(parents(parent));
    }
    return result;
  }

  Set<String> grandchildren(String id) {
    final result = <String>{};
    for (final child in children(id)) {
      result.addAll(children(child));
    }
    return result;
  }

  /// Siblings of one's parents, plus those siblings' partners (an uncle by
  /// marriage is still an uncle).
  Set<String> unclesAndAunts(String id) {
    final result = <String>{};
    for (final parent in parents(id)) {
      for (final sibling in siblings(parent)) {
        result.add(sibling);
        result.addAll(partners(sibling));
      }
    }
    return result..removeAll(parents(id));
  }

  Set<String> niblings(String id) {
    final result = <String>{};
    for (final sibling in siblings(id)) {
      result.addAll(children(sibling));
    }
    return result..removeAll(children(id));
  }

  /// First cousins: children of one's parents' siblings.
  Set<String> cousins(String id) {
    final result = <String>{};
    for (final parent in parents(id)) {
      for (final auntUncle in siblings(parent)) {
        result.addAll(children(auntUncle));
      }
    }
    return result
      ..remove(id)
      ..removeAll(siblings(id));
  }

  /// Every ancestor, walking up until the lines run out. Guarded against
  /// cycles so bad data cannot hang the UI.
  Set<String> ancestors(String id) {
    final result = <String>{};
    final queue = <String>[id];
    while (queue.isNotEmpty) {
      for (final parent in parents(queue.removeLast())) {
        if (result.add(parent)) queue.add(parent);
      }
    }
    return result;
  }

  Set<String> descendants(String id) {
    final result = <String>{};
    final queue = <String>[id];
    while (queue.isNotEmpty) {
      for (final child in children(queue.removeLast())) {
        if (result.add(child)) queue.add(child);
      }
    }
    return result;
  }

  /// Generation depth: 0 for anyone with no recorded parents, otherwise one
  /// deeper than their deepest parent. Used to lay the tree out in rows.
  Map<String, int> generations(Iterable<String> everyone) {
    final depth = <String, int>{};

    int resolve(String id, Set<String> visiting) {
      final cached = depth[id];
      if (cached != null) return cached;
      // A cycle would otherwise recurse forever; treat it as a root.
      if (!visiting.add(id)) return 0;

      var result = 0;
      for (final parent in parents(id)) {
        final parentDepth = resolve(parent, visiting) + 1;
        if (parentDepth > result) result = parentDepth;
      }
      visiting.remove(id);
      depth[id] = result;
      return result;
    }

    for (final id in everyone) {
      resolve(id, <String>{});
    }
    return depth;
  }
}
