import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

import '../data/database.dart';

/// Renders a flat list of [Location]s as an expandable tree, following
/// `parentLocationId` to nest continents > kingdoms > cities > etc.
class LocationTree extends StatelessWidget {
  const LocationTree({
    super.key,
    required this.locations,
    required this.onTap,
    required this.onAddChild,
    required this.onDelete,
    required this.onOpenMap,
  });

  final List<Location> locations;
  final void Function(Location location) onTap;
  final void Function(String? parentLocationId) onAddChild;
  final void Function(Location location) onDelete;
  final void Function(Location location) onOpenMap;

  @override
  Widget build(BuildContext context) {
    final byParent = <String?, List<Location>>{};
    for (final loc in locations) {
      byParent.putIfAbsent(loc.parentLocationId, () => []).add(loc);
    }
    for (final list in byParent.values) {
      list.sort((a, b) => a.name.compareTo(b.name));
    }
    final roots = byParent[null] ?? const <Location>[];

    if (roots.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            L.of(context).worldEmpty,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return ListView(
      children: [
        for (final root in roots)
          _LocationNode(
            location: root,
            byParent: byParent,
            onTap: onTap,
            onAddChild: onAddChild,
            onDelete: onDelete,
            onOpenMap: onOpenMap,
            depth: 0,
          ),
      ],
    );
  }
}

class _LocationNode extends StatelessWidget {
  const _LocationNode({
    required this.location,
    required this.byParent,
    required this.onTap,
    required this.onAddChild,
    required this.onDelete,
    required this.onOpenMap,
    required this.depth,
  });

  final Location location;
  final Map<String?, List<Location>> byParent;
  final void Function(Location location) onTap;
  final void Function(String? parentLocationId) onAddChild;
  final void Function(Location location) onDelete;
  final void Function(Location location) onOpenMap;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final children = byParent[location.id] ?? const <Location>[];
    final padding = EdgeInsets.only(left: 12.0 * depth);
    final tileTitle = Text(location.name);
    final tileSubtitle = location.type != null && location.type!.isNotEmpty
        ? Text(location.type!)
        : null;
    final hasMap =
        location.mapImagePath != null && location.mapImagePath!.isNotEmpty;
    final actions = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Only offered where there is actually a map to open.
        if (hasMap)
          IconButton(
            icon: const Icon(Icons.map_outlined),
            tooltip: L.of(context).worldViewMap,
            onPressed: () => onOpenMap(location),
          ),
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: L.of(context).worldAddSub,
          onPressed: () => onAddChild(location.id),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          tooltip: L.of(context).commonDelete,
          onPressed: () => onDelete(location),
        ),
      ],
    );

    if (children.isEmpty) {
      return Padding(
        padding: padding,
        child: ListTile(
          leading: const Icon(Icons.place_outlined),
          title: tileTitle,
          subtitle: tileSubtitle,
          trailing: actions,
          onTap: () => onTap(location),
        ),
      );
    }

    return Padding(
      padding: padding,
      child: ExpansionTile(
        leading: const Icon(Icons.map_outlined),
        title: tileTitle,
        subtitle: tileSubtitle,
        trailing: actions,
        onExpansionChanged: (_) {},
        children: [
          GestureDetector(
            onTap: () => onTap(location),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(L.of(context).worldViewDetails),
            ),
          ),
          for (final child in children)
            _LocationNode(
              location: child,
              byParent: byParent,
              onTap: onTap,
              onAddChild: onAddChild,
              onDelete: onDelete,
              onOpenMap: onOpenMap,
              depth: depth + 1,
            ),
        ],
      ),
    );
  }
}
