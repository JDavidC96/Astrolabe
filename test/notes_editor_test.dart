import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:worldbuilder/providers/data_providers.dart';
import 'package:worldbuilder/screens/notes/notes_list_screen.dart';

/// A phone, in logical pixels, with the keyboard taking its share of the
/// screen — the case that was overflowing.
const phone = Size(360, 480);

Widget harness() {
  return ProviderScope(
    overrides: [
      // An empty list keeps the database out of the test entirely.
      notesStreamProvider('p1').overrideWith((ref) => Stream.value(<Note>[])),
    ],
    child: MaterialApp(
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      locale: const Locale('es'),
      home: const NotesListScreen(projectId: 'p1'),
    ),
  );
}

Future<void> openEditor(WidgetTester tester) async {
  tester.view.physicalSize = phone;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(harness());
  await tester.pump();
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('the editor fits on a phone screen', (tester) async {
    await openEditor(tester);

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the style buttons are reachable on a phone', (tester) async {
    await openEditor(tester);

    // Both sit inside the dialog, hit-testable, not clipped off the edge.
    await tester.tap(find.byIcon(Icons.format_bold));
    await tester.tap(find.byIcon(Icons.format_italic));
    await tester.pump();

    expect(tester.takeException(), isNull);
  });

  testWidgets('the editor scrolls rather than clipping its buttons',
      (tester) async {
    await openEditor(tester);

    // Everything below the fold is still reachable.
    expect(find.byType(Scrollable), findsWidgets);
    await tester.drag(find.byIcon(Icons.format_bold), const Offset(0, -80));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
