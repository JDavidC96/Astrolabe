import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:worldbuilder/router/app_router.dart';

/// Collects the paths of every GoRoute nested under a ShellRoute.
Set<String> _pathsInsideShells(List<RouteBase> routes) {
  final inside = <String>{};

  void walk(RouteBase route, {required bool underShell}) {
    if (route is GoRoute && underShell) inside.add(route.path);
    final nowUnderShell = underShell || route is ShellRouteBase;
    for (final child in route.routes) {
      walk(child, underShell: nowUnderShell);
    }
  }

  for (final route in routes) {
    walk(route, underShell: false);
  }
  return inside;
}

Set<String> _allPaths(List<RouteBase> routes) {
  final all = <String>{};

  void walk(RouteBase route) {
    if (route is GoRoute) all.add(route.path);
    route.routes.forEach(walk);
  }

  routes.forEach(walk);
  return all;
}

void main() {
  final routes = appRouter.configuration.routes;

  test('section lists live inside the project shell', () {
    final inShell = _pathsInsideShells(routes);
    for (final section in [
      'characters',
      'world',
      'factions',
      'timeline',
      'chapters',
      'notes',
      'items',
      'magic',
    ]) {
      expect(
        inShell,
        contains('/project/:projectId/$section'),
        reason: 'the $section list should keep the shell navigation',
      );
    }
  });

  test('detail screens stay outside the shell', () {
    // Regression guard: nesting these under the ShellRoute stacked a second
    // app bar and left the section navigation visible while editing a form.
    final inShell = _pathsInsideShells(routes);
    final detailPaths = [
      '/project/:projectId/characters/new',
      '/project/:projectId/characters/:characterId',
      '/project/:projectId/world/new',
      '/project/:projectId/world/:locationId',
      '/project/:projectId/factions/new',
      '/project/:projectId/factions/:factionId',
      '/project/:projectId/timeline/new',
      '/project/:projectId/timeline/:eventId',
      '/project/:projectId/chapters/:chapterId',
      '/project/:projectId/items/new',
      '/project/:projectId/items/:itemId',
      '/project/:projectId/magic/new',
      '/project/:projectId/magic/:magicId',
    ];

    final all = _allPaths(routes);
    for (final path in detailPaths) {
      expect(all, contains(path), reason: '$path should be routable');
      expect(inShell, isNot(contains(path)), reason: '$path must be full-screen');
    }
  });

  test('"new" is matched before the id parameter that would swallow it', () {
    // If ':characterId' were declared first, /characters/new would try to
    // open a character whose id is literally "new".
    final ordered = <String>[];
    void walk(RouteBase route) {
      if (route is GoRoute) ordered.add(route.path);
      route.routes.forEach(walk);
    }

    routes.forEach(walk);

    for (final section in ['characters', 'world', 'factions', 'timeline']) {
      final newIndex = ordered.indexOf('/project/:projectId/$section/new');
      final idIndex = ordered.indexWhere(
        (p) => p.startsWith('/project/:projectId/$section/:'),
      );
      expect(newIndex, isNonNegative, reason: '$section/new missing');
      expect(idIndex, isNonNegative, reason: '$section/:id missing');
      expect(newIndex, lessThan(idIndex), reason: '$section/new must come first');
    }
  });
}
