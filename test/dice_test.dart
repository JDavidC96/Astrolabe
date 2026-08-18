import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/daos/sheet_dao.dart';
import 'package:worldbuilder/services/dice_roller.dart';

/// Deterministic Random so rolls can be asserted exactly.
class _FixedRandom implements Random {
  _FixedRandom(this.values);
  final List<int> values;
  int _index = 0;

  @override
  int nextInt(int max) {
    final value = values[_index % values.length];
    _index++;
    return value % max;
  }

  @override
  bool nextBool() => throw UnimplementedError();
  @override
  double nextDouble() => throw UnimplementedError();
}

void main() {
  group('dice expressions', () {
    test('a bare d20 rolls one die', () {
      // nextInt returns 13, so the die shows 14.
      final roller = DiceRoller(random: _FixedRandom([13]));
      final result = roller.roll('d20');
      expect(result.total, 14);
    });

    test('count, sides and a flat modifier all combine', () {
      final roller = DiceRoller(random: _FixedRandom([3, 5]));
      final result = roller.roll('2d6+3');
      // (4 + 6) + 3
      expect(result.total, 13);
      expect(result.detail, contains('2d6'));
      expect(result.detail, contains('+3'));
    });

    test('subtraction and several terms', () {
      final roller = DiceRoller(random: _FixedRandom([0]));
      final result = roller.roll('d4 - 1');
      expect(result.total, 0);
    });

    test('spaces are tolerated', () {
      final roller = DiceRoller(random: _FixedRandom([1]));
      expect(roller.roll(' 1d6 + 2 ').total, 4);
    });

    test('advantage keeps the higher of two rolls', () {
      final roller = DiceRoller(random: _FixedRandom([2, 17]));
      expect(roller.roll('d20', advantage: 1).total, 18);
    });

    test('disadvantage keeps the lower of two rolls', () {
      final roller = DiceRoller(random: _FixedRandom([2, 17]));
      expect(roller.roll('d20', advantage: -1).total, 3);
    });

    test('nonsense is rejected rather than silently rolling zero', () {
      final roller = DiceRoller(random: _FixedRandom([1]));
      expect(() => roller.roll('banana'), throwsA(isA<DiceFormatException>()));
      expect(() => roller.roll(''), throwsA(isA<DiceFormatException>()));
    });

    test('absurd dice counts are refused', () {
      final roller = DiceRoller(random: _FixedRandom([1]));
      expect(() => roller.roll('9999d6'), throwsA(isA<DiceFormatException>()));
      expect(() => roller.roll('1d99999'), throwsA(isA<DiceFormatException>()));
    });
  });

  group('5e maths', () {
    test('ability modifiers round down, including below 10', () {
      expect(abilityModifier(10), 0);
      expect(abilityModifier(11), 0);
      expect(abilityModifier(12), 1);
      expect(abilityModifier(18), 4);
      // The interesting case: 9 must be -1, not 0, which is what truncating
      // toward zero would produce.
      expect(abilityModifier(9), -1);
      expect(abilityModifier(8), -1);
      expect(abilityModifier(7), -2);
      expect(abilityModifier(1), -5);
    });

    test('proficiency bonus steps every four levels', () {
      expect(proficiencyBonusForLevel(1), 2);
      expect(proficiencyBonusForLevel(4), 2);
      expect(proficiencyBonusForLevel(5), 3);
      expect(proficiencyBonusForLevel(8), 3);
      expect(proficiencyBonusForLevel(9), 4);
      expect(proficiencyBonusForLevel(17), 6);
      expect(proficiencyBonusForLevel(20), 6);
    });
  });
}
