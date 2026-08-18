import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../router/app_router.dart';
import '../theme/app_themes.dart';
import 'data_providers.dart';

/// The project whose screen is currently open, derived from the router so
/// every route inside a universe — including the full-screen detail routes
/// that live outside the shell — picks up that universe's theme.
final activeProjectIdProvider = StateNotifierProvider<_ActiveProjectNotifier, String?>(
  (ref) => _ActiveProjectNotifier(),
);

class _ActiveProjectNotifier extends StateNotifier<String?> {
  _ActiveProjectNotifier() : super(_parse(appRouter.routerDelegate.currentConfiguration.uri.path)) {
    appRouter.routerDelegate.addListener(_onRouteChanged);
  }

  void _onRouteChanged() {
    final next = _parse(appRouter.routerDelegate.currentConfiguration.uri.path);
    if (next != state) state = next;
  }

  /// Pulls the id out of `/project/<id>/...`; null anywhere else.
  static String? _parse(String path) {
    final segments = Uri.parse(path).pathSegments;
    if (segments.length >= 2 && segments.first == 'project') {
      return segments[1];
    }
    return null;
  }

  @override
  void dispose() {
    appRouter.routerDelegate.removeListener(_onRouteChanged);
    super.dispose();
  }
}

/// The theme to render with: the open universe's, or the neutral default
/// on the projects list and other app-level screens.
final activeThemeProvider = Provider<AppTheme>((ref) {
  final projectId = ref.watch(activeProjectIdProvider);
  if (projectId == null) return themeById(defaultThemeId);

  final project = ref.watch(projectStreamProvider(projectId));
  return themeById(project.valueOrNull?.themeId);
});

final lightThemeDataProvider = Provider<ThemeData>((ref) {
  return ref.watch(activeThemeProvider).themeData(Brightness.light);
});

final darkThemeDataProvider = Provider<ThemeData>((ref) {
  return ref.watch(activeThemeProvider).themeData(Brightness.dark);
});

/// Light / dark / follow-the-system, persisted across launches. This is an
/// app-wide preference rather than a per-universe one: it's about the room
/// you're reading in, not about the story.
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) => ThemeModeNotifier());

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _load();
  }

  static const _key = 'theme_mode';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    state = ThemeMode.values.firstWhere(
      (m) => m.name == stored,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> set(ThemeMode mode) async {
    state = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }
}
