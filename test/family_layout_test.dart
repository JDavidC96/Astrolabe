import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/family_layout.dart';
import 'package:worldbuilder/services/kinship.dart';

void main() {
  test('people with no family links are kept out of the tree', () {
    final kinship = Kinship.fromLinks(familyLinks: [('padre', 'hija')]);
    final layout = FamilyLayout.build(
      everyone: ['padre', 'hija', 'solitario'],
      kinship: kinship,
    );

    expect(layout.unlinked, ['solitario']);
    expect(layout.slots.containsKey('solitario'), isFalse);
    expect(layout.rows.expand((r) => r), containsAll(['padre', 'hija']));
  });

  test('each generation becomes its own row', () {
    final kinship = Kinship.fromLinks(familyLinks: [
      ('abuelo', 'padre'),
      ('padre', 'hija'),
    ]);
    final layout = FamilyLayout.build(
      everyone: ['abuelo', 'padre', 'hija'],
      kinship: kinship,
    );

    expect(layout.rows.length, 3);
    expect(layout.slots['abuelo']!.generation, 0);
    expect(layout.slots['padre']!.generation, 1);
    expect(layout.slots['hija']!.generation, 2);
  });

  test('partners are pulled onto the same row even at different depths', () {
    // "entra" marries into the family and has no parents recorded, so by
    // depth alone she would sit in the top row, away from her husband.
    final kinship = Kinship.fromLinks(
      familyLinks: [('abuelo', 'padre')],
      partnerLinks: [('padre', 'entra')],
    );
    final layout = FamilyLayout.build(
      everyone: ['abuelo', 'padre', 'entra'],
      kinship: kinship,
    );

    expect(
      layout.slots['entra']!.generation,
      layout.slots['padre']!.generation,
      reason: 'partners must share a row or the connector crosses generations',
    );
  });

  test('partners end up adjacent so a connector can be drawn', () {
    final kinship = Kinship.fromLinks(
      familyLinks: const [],
      partnerLinks: [('a', 'b')],
    );
    final layout = FamilyLayout.build(
      everyone: ['a', 'otro', 'b'],
      kinship: kinship,
    );

    final a = layout.slots['a']!;
    final b = layout.slots['b']!;
    expect((a.column - b.column).abs(), 1);
    expect(layout.partnerEdges, hasLength(1));
  });

  test('a partnership is only emitted once', () {
    final kinship = Kinship.fromLinks(
      familyLinks: const [],
      partnerLinks: [('a', 'b')],
    );
    final layout =
        FamilyLayout.build(everyone: ['a', 'b'], kinship: kinship);
    expect(layout.partnerEdges, hasLength(1));
  });

  test('an edge is produced for every parent-child link', () {
    final kinship = Kinship.fromLinks(familyLinks: [
      ('padre', 'aria'),
      ('madre', 'aria'),
      ('padre', 'kael'),
      ('madre', 'kael'),
    ]);
    final layout = FamilyLayout.build(
      everyone: ['padre', 'madre', 'aria', 'kael'],
      kinship: kinship,
    );

    expect(layout.parentEdges, hasLength(4));
    expect(layout.parentEdges, contains(('padre', 'aria')));
    expect(layout.parentEdges, contains(('madre', 'kael')));
  });

  test('children are ordered near their parents to reduce crossings', () {
    // Two couples, each with a child. The children must not end up swapped
    // relative to their parents, or the lines would cross.
    final kinship = Kinship.fromLinks(familyLinks: [
      ('ana', 'hijoDeAna'),
      ('zoe', 'hijoDeZoe'),
    ]);
    final layout = FamilyLayout.build(
      everyone: ['ana', 'zoe', 'hijoDeZoe', 'hijoDeAna'],
      kinship: kinship,
    );

    final anaCol = layout.slots['ana']!.column;
    final zoeCol = layout.slots['zoe']!.column;
    final hijoAnaCol = layout.slots['hijoDeAna']!.column;
    final hijoZoeCol = layout.slots['hijoDeZoe']!.column;

    // Whatever the absolute positions, the relative order must match.
    expect(
      (anaCol < zoeCol) == (hijoAnaCol < hijoZoeCol),
      isTrue,
      reason: 'child order should follow parent order',
    );
  });

  test('an empty family produces an empty layout rather than throwing', () {
    final layout = FamilyLayout.build(
      everyone: const [],
      kinship: Kinship.fromLinks(familyLinks: const []),
    );
    expect(layout.rows, isEmpty);
    expect(layout.parentEdges, isEmpty);
  });

  test('cyclic data still terminates', () {
    final kinship = Kinship.fromLinks(familyLinks: [
      ('a', 'b'),
      ('b', 'a'),
    ]);
    final layout = FamilyLayout.build(everyone: ['a', 'b'], kinship: kinship);
    expect(layout.slots.length, 2);
  });
}
