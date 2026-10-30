import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:worldbuilder/services/styled_text.dart';
import 'package:worldbuilder/widgets/markup_text_field.dart';
import 'package:worldbuilder/widgets/styled_text_controller.dart';

Widget harness(StyledTextController controller) {
  return MaterialApp(
    localizationsDelegates: L.localizationsDelegates,
    supportedLocales: L.supportedLocales,
    locale: const Locale('es'),
    home: Scaffold(
      body: MarkupTextField(controller: controller, label: 'Contenido'),
    ),
  );
}

/// The styles the field is actually painting, one entry per character.
List<int> painted(WidgetTester tester, StyledTextController controller) {
  final span = controller.buildTextSpan(
    context: tester.element(find.byType(TextField)),
    style: const TextStyle(),
    withComposing: false,
  );

  final flags = <int>[];
  span.visitChildren((child) {
    if (child is TextSpan && child.text != null) {
      var flag = 0;
      if (child.style?.fontWeight == FontWeight.bold) flag |= styleBold;
      if (child.style?.fontStyle == FontStyle.italic) flag |= styleItalic;
      flags.addAll(List.filled(child.text!.length, flag));
    }
    return true;
  });
  return flags;
}

void main() {
  testWidgets('the bold button styles the selected words, with no markers',
      (tester) async {
    final controller = StyledTextController.fromMarkdown('La Casa Valdris');
    addTearDown(controller.dispose);
    controller.selection =
        const TextSelection(baseOffset: 3, extentOffset: 15);

    await tester.pumpWidget(harness(controller));
    await tester.tap(find.byIcon(Icons.format_bold));
    await tester.pump();

    // The writer sees the words, unchanged.
    expect(controller.text, 'La Casa Valdris');
    // And they are painted bold from the fourth character on.
    expect(painted(tester, controller),
        [0, 0, 0, ...List.filled(12, styleBold)]);
    // Only what gets stored carries the markers.
    expect(controller.toMarkdown(), 'La **Casa Valdris**');
  });

  testWidgets('a second press takes the style back off', (tester) async {
    final controller = StyledTextController.fromMarkdown('**Casa**');
    addTearDown(controller.dispose);
    controller.selection = const TextSelection(baseOffset: 0, extentOffset: 4);

    await tester.pumpWidget(harness(controller));
    await tester.tap(find.byIcon(Icons.format_bold));
    await tester.pump();

    expect(controller.toMarkdown(), 'Casa');
  });

  testWidgets('an old note opens with its markers already gone',
      (tester) async {
    final controller =
        StyledTextController.fromMarkdown('El **rey** ha *muerto*');
    addTearDown(controller.dispose);

    await tester.pumpWidget(harness(controller));

    expect(controller.text, 'El rey ha muerto');
    expect(find.text('El rey ha muerto'), findsOneWidget);
  });

  testWidgets('turning bold on with no selection styles what comes next',
      (tester) async {
    final controller = StyledTextController.fromMarkdown('Nota: ');
    addTearDown(controller.dispose);
    controller.selection = const TextSelection.collapsed(offset: 6);

    await tester.pumpWidget(harness(controller));
    await tester.tap(find.byIcon(Icons.format_bold));
    await tester.pump();

    // Nothing has been typed yet, so nothing changed.
    expect(controller.text, 'Nota: ');

    await tester.enterText(find.byType(TextField), 'Nota: hola');
    await tester.pump();

    expect(controller.toMarkdown(), 'Nota: **hola**');
  });

  testWidgets('the button lights up when the caret is inside bold text',
      (tester) async {
    final controller = StyledTextController.fromMarkdown('**Casa** vieja');
    addTearDown(controller.dispose);

    await tester.pumpWidget(harness(controller));

    IconButton boldButton() => tester.widget<IconButton>(
          find.ancestor(
            of: find.byIcon(Icons.format_bold),
            matching: find.byType(IconButton),
          ),
        );

    controller.selection = const TextSelection(baseOffset: 0, extentOffset: 4);
    await tester.pump();
    expect(boldButton().isSelected, isTrue);

    controller.selection = const TextSelection(baseOffset: 5, extentOffset: 10);
    await tester.pump();
    expect(boldButton().isSelected, isFalse);
  });

  testWidgets('typing after bold text carries the style along',
      (tester) async {
    final controller = StyledTextController.fromMarkdown('**Casa**');
    addTearDown(controller.dispose);

    await tester.pumpWidget(harness(controller));
    await tester.enterText(find.byType(TextField), 'Casas');
    await tester.pump();

    expect(controller.toMarkdown(), '**Casas**');
  });
}
