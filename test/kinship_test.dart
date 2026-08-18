import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/kinship.dart';

/// A three-generation family used across the tests:
///
///   abuelo + abuela          otroAbuelo
///        |                        |
///   padre  --- madre          tio + tia
///     |  \                      |
///   aria  kael               primo
///
/// plus `medio`, a child of padre with a different mother.
Kinship buildFamily() {
  return Kinship.fromLinks(
    familyLinks: [
      ('abuelo', 'padre'),
      ('abuela', 'padre'),
      ('abuelo', 'tio'),
      ('abuela', 'tio'),
      ('otroAbuelo', 'madre'),
      ('padre', 'aria'),
      ('madre', 'aria'),
      ('padre', 'kael'),
      ('madre', 'kael'),
      ('padre', 'medio'),
      ('otraMadre', 'medio'),
      ('tio', 'primo'),
      ('tia', 'primo'),
    ],
    partnerLinks: [
      ('padre', 'madre'),
      ('tio', 'tia'),
      ('abuelo', 'abuela'),
    ],
  );
}

void main() {
  late Kinship k;

  setUp(() => k = buildFamily());

  test('parents and children read both ways', () {
    expect(k.parents('aria'), {'padre', 'madre'});
    expect(k.children('padre'), {'aria', 'kael', 'medio'});
  });

  test('siblings include half siblings', () {
    expect(k.siblings('aria'), {'kael', 'medio'});
  });

  test('full and half siblings are told apart', () {
    // Aria and Kael share both parents; medio shares only the father.
    expect(k.fullSiblings('aria'), {'kael'});
    expect(k.halfSiblings('aria'), {'medio'});
    expect(k.fullSiblings('medio'), isEmpty);
    expect(k.halfSiblings('medio'), {'aria', 'kael'});
  });

  test('a person is never their own sibling', () {
    expect(k.siblings('aria'), isNot(contains('aria')));
  });

  test('grandparents come from both sides', () {
    expect(k.grandparents('aria'), {'abuelo', 'abuela', 'otroAbuelo'});
    expect(k.grandchildren('abuelo'), {'aria', 'kael', 'medio', 'primo'});
  });

  test('uncles include those by marriage but never the parents', () {
    final uncles = k.unclesAndAunts('aria');
    expect(uncles, contains('tio'));
    // Tía is only related through marriage to tío, and still counts.
    expect(uncles, contains('tia'));
    expect(uncles, isNot(contains('padre')));
    expect(uncles, isNot(contains('madre')));
  });

  test('cousins exclude siblings and self', () {
    expect(k.cousins('aria'), {'primo'});
    expect(k.cousins('aria'), isNot(contains('kael')));
    expect(k.cousins('aria'), isNot(contains('aria')));
  });

  test('nephews come from siblings, not from own children', () {
    expect(k.niblings('tio'), {'aria', 'kael', 'medio'});
    // Tío's own child is not his nephew.
    expect(k.niblings('tio'), isNot(contains('primo')));
  });

  test('ancestors and descendants walk the whole line', () {
    expect(k.ancestors('aria'),
        {'padre', 'madre', 'abuelo', 'abuela', 'otroAbuelo'});
    expect(k.descendants('abuelo'),
        {'padre', 'tio', 'aria', 'kael', 'medio', 'primo'});
  });

  test('partners are symmetric regardless of stored order', () {
    expect(k.partners('padre'), {'madre'});
    expect(k.partners('madre'), {'padre'});
  });

  test('generations place each person below their deepest parent', () {
    final everyone = [
      'abuelo', 'abuela', 'otroAbuelo', 'otraMadre',
      'padre', 'madre', 'tio', 'tia',
      'aria', 'kael', 'medio', 'primo',
    ];
    final gen = k.generations(everyone);

    expect(gen['abuelo'], 0);
    expect(gen['otroAbuelo'], 0);
    expect(gen['padre'], 1);
    expect(gen['madre'], 1);
    expect(gen['aria'], 2);
    expect(gen['primo'], 2);
    // Someone with no recorded parents sits at the top.
    expect(gen['otraMadre'], 0);
  });

  test('an unrelated person has no relatives rather than crashing', () {
    expect(k.siblings('desconocido'), isEmpty);
    expect(k.parents('desconocido'), isEmpty);
    expect(k.cousins('desconocido'), isEmpty);
    expect(k.ancestors('desconocido'), isEmpty);
  });

  test('a cycle in the data does not hang the calculation', () {
    // Bad data should degrade, not freeze the app.
    final cyclic = Kinship.fromLinks(familyLinks: [
      ('a', 'b'),
      ('b', 'c'),
      ('c', 'a'),
    ]);
    expect(cyclic.ancestors('a'), {'a', 'b', 'c'});
    final gen = cyclic.generations(['a', 'b', 'c']);
    expect(gen.length, 3);
  });
}
