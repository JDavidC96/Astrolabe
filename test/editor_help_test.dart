import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:worldbuilder/router/app_router.dart';
import 'package:worldbuilder/screens/help/editor_help_screen.dart';

Widget harness(Locale locale) {
  return MaterialApp(
    localizationsDelegates: L.localizationsDelegates,
    supportedLocales: L.supportedLocales,
    locale: locale,
    home: const EditorHelpScreen(),
  );
}

void main() {
  test('the guide has a route of its own to reach', () {
    final paths = <String>{};
    void walk(List<RouteBase> routes) {
      for (final route in routes) {
        if (route is GoRoute) paths.add(route.path);
        walk(route.routes);
      }
    }

    walk(appRouter.configuration.routes);
    expect(paths, contains('/help/editor'));
  });

  testWidgets('it reads end to end in Spanish', (tester) async {
    await tester.pumpWidget(harness(const Locale('es')));
    await tester.pumpAndSettle();

    expect(find.text('El editor de texto'), findsOneWidget);
    expect(find.text('Negrita y cursiva'), findsOneWidget);

    // The later sections are below the fold, so read down to one of them.
    await tester.scrollUntilVisible(find.text('Qué queda guardado'), 300);
    await tester.pumpAndSettle();
    expect(find.text('Qué queda guardado'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('and in English', (tester) async {
    await tester.pumpWidget(harness(const Locale('en')));
    await tester.pumpAndSettle();

    expect(find.text('The text editor'), findsOneWidget);
    expect(find.text('Bold and italic'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the sample shows the formatting beside what is stored',
      (tester) async {
    await tester.pumpWidget(harness(const Locale('es')));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('Qué queda guardado'),
      300,
    );
    await tester.pumpAndSettle();

    // The stored half prints the markers; the other half renders them, so
    // the words appear without their asterisks somewhere on screen.
    final rendered = find.byWidgetPredicate(
      (w) =>
          w is RichText &&
          w.text.toPlainText() == 'La Casa Valdris cayó en el invierno largo.',
    );
    expect(rendered, findsWidgets);
  });

  testWidgets('every section fits a phone screen', (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(harness(const Locale('es')));
    await tester.pumpAndSettle();

    // Read it the whole way down, watching for anything that overflows.
    for (var i = 0; i < 12; i++) {
      await tester.drag(find.byType(ListView), const Offset(0, -400));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
  });
}
