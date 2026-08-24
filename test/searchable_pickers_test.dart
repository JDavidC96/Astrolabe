import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/widgets/searchable_pickers.dart';

/// Builds a list long enough to trigger the search box.
List<PickOption> manyOptions() => [
      const PickOption(id: 'aria', label: 'Aria Valdris'),
      const PickOption(id: 'kael', label: 'Kael Valdris'),
      const PickOption(id: 'lyra', label: 'Lyra Sombragris'),
      const PickOption(id: 'bran', label: 'Bran el Viejo'),
      const PickOption(id: 'nym', label: 'Nymeria'),
      const PickOption(id: 'tor', label: 'Tormund'),
      const PickOption(id: 'sam', label: 'Samwell'),
      const PickOption(id: 'ygr', label: 'Ygritte'),
      const PickOption(id: 'jon', label: 'Jon Nieve'),
    ];

void main() {
  group('option matching', () {
    test('an empty query matches everything', () {
      const option = PickOption(id: 'a', label: 'Aria');
      expect(option.matches(''), isTrue);
    });

    test('matching ignores case', () {
      const option = PickOption(id: 'a', label: 'Aria Valdris');
      expect(option.matches('aria'), isTrue);
      expect(option.matches('ARIA'), isTrue);
      expect(option.matches('valdris'), isTrue);
    });

    test('the secondary line is searchable too', () {
      const option =
          PickOption(id: 'a', label: 'Aria', sublabel: 'Guardia del Norte');
      expect(option.matches('guardia'), isTrue);
    });

    test('a non-match is rejected', () {
      const option = PickOption(id: 'a', label: 'Aria');
      expect(option.matches('zzz'), isFalse);
    });
  });

  group('searchable checkbox list', () {
    testWidgets('short lists get no search box', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SearchableCheckboxList(
            options: const [
              PickOption(id: 'a', label: 'Aria'),
              PickOption(id: 'b', label: 'Kael'),
            ],
            selected: const {},
            onChanged: (id, isSelected) {},
          ),
        ),
      ));

      expect(find.byType(TextField), findsNothing);
      expect(find.text('Aria'), findsOneWidget);
    });

    testWidgets('long lists get a search box that filters', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SearchableCheckboxList(
            options: manyOptions(),
            selected: const {},
            onChanged: (id, isSelected) {},
          ),
        ),
      ));

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Jon Nieve'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'valdris');
      await tester.pump();

      expect(find.text('Aria Valdris'), findsOneWidget);
      expect(find.text('Kael Valdris'), findsOneWidget);
      expect(find.text('Jon Nieve'), findsNothing);
    });

    testWidgets('filtering never drops an existing selection', (tester) async {
      // The whole point of the guard: Jon is selected, then filtered out of
      // view. He must stay selected, and the user must be told.
      final selected = <String>{'jon'};

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => SearchableCheckboxList(
              options: manyOptions(),
              selected: selected,
              onChanged: (id, isSelected) => setState(() {
                if (isSelected) {
                  selected.add(id);
                } else {
                  selected.remove(id);
                }
              }),
            ),
          ),
        ),
      ));

      await tester.enterText(find.byType(TextField), 'valdris');
      await tester.pump();

      expect(find.text('Jon Nieve'), findsNothing);
      expect(selected, contains('jon'),
          reason: 'hiding a row must not deselect it');
      expect(find.textContaining('fuera del filtro'), findsOneWidget);

      // Clearing the search brings him back, still ticked.
      await tester.enterText(find.byType(TextField), '');
      await tester.pump();
      final jonTile = tester.widget<CheckboxListTile>(
        find.ancestor(
          of: find.text('Jon Nieve'),
          matching: find.byType(CheckboxListTile),
        ),
      );
      expect(jonTile.value, isTrue);
    });

    testWidgets('ticking a filtered row selects the right person',
        (tester) async {
      final selected = <String>{};

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => SearchableCheckboxList(
              options: manyOptions(),
              selected: selected,
              onChanged: (id, isSelected) => setState(() {
                if (isSelected) {
                  selected.add(id);
                } else {
                  selected.remove(id);
                }
              }),
            ),
          ),
        ),
      ));

      await tester.enterText(find.byType(TextField), 'lyra');
      await tester.pump();
      await tester.tap(find.text('Lyra Sombragris'));
      await tester.pump();

      // Index-based bugs would have selected whoever sat at that row in the
      // unfiltered list instead.
      expect(selected, {'lyra'});
    });

    testWidgets('a search with no hits says so instead of looking empty',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SearchableCheckboxList(
            options: manyOptions(),
            selected: const {},
            onChanged: (id, isSelected) {},
          ),
        ),
      ));

      await tester.enterText(find.byType(TextField), 'zzzz');
      await tester.pump();

      expect(find.text('Nada coincide con la búsqueda.'), findsOneWidget);
    });

    testWidgets('an empty option list shows the empty message', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SearchableCheckboxList(
            options: [],
            selected: {},
            onChanged: _noop,
            emptyMessage: 'No hay personajes todavía.',
          ),
        ),
      ));

      expect(find.text('No hay personajes todavía.'), findsOneWidget);
    });
  });

  group('searchable pick dialog', () {
    testWidgets('returns the id of the tapped option', (tester) async {
      String? picked;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                picked = await showDialog<String>(
                  context: context,
                  builder: (context) => SearchablePickDialog(
                    title: 'Elegir',
                    options: manyOptions(),
                  ),
                );
              },
              child: const Text('abrir'),
            ),
          ),
        ),
      ));

      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'nieve');
      await tester.pump();
      await tester.tap(find.text('Jon Nieve'));
      await tester.pumpAndSettle();

      expect(picked, 'jon');
    });
  });
}

void _noop(String id, bool selected) {}
