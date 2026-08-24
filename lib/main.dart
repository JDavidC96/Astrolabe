import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'l10n/app_localizations.dart';
import 'providers/locale_providers.dart';
import 'providers/lock_providers.dart';
import 'providers/theme_providers.dart';
import 'router/app_router.dart';
import 'screens/lock/lock_screen.dart';

void main() {
  runApp(const ProviderScope(child: WorldbuilderApp()));
}

class WorldbuilderApp extends ConsumerWidget {
  const WorldbuilderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // The theme follows whichever universe is open, so each one keeps its
    // own look; app-level screens fall back to the neutral default.
    return MaterialApp.router(
      title: 'Astrolabe',
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeModeProvider),
      theme: ref.watch(lightThemeDataProvider),
      darkTheme: ref.watch(darkThemeDataProvider),
      // Null means "follow the device", which is what most people expect
      // until they deliberately pick a language.
      locale: ref.watch(localeProvider),
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: appRouter,
      // Wrapping at the builder level keeps the lock above every route, so
      // no deep link can slip past it.
      builder: (context, child) => _LockGate(child: child ?? const SizedBox()),
    );
  }
}

class _LockGate extends ConsumerWidget {
  const _LockGate({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lock = ref.watch(lockControllerProvider);

    if (!lock.checked) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (lock.shouldShowLock) {
      return const LockScreen();
    }
    return child;
  }
}
