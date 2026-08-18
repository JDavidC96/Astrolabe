import 'dart:math';

/// Outcome of evaluating a dice expression.
class DiceResult {
  final String expression;
  final int total;
  final String detail;

  DiceResult({
    required this.expression,
    required this.total,
    required this.detail,
  });
}

class DiceFormatException implements Exception {
  DiceFormatException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Evaluates tabletop dice expressions such as `d20`, `2d6+3`, `4d8 - 1 + d4`.
///
/// Grammar: a sum of terms, where each term is either `NdM` (N optional,
/// defaults to 1) or a flat number, joined by `+`/`-`.
class DiceRoller {
  DiceRoller({Random? random}) : _random = random ?? Random();

  final Random _random;

  static const _maxDice = 100;
  static const _maxSides = 1000;

  static final _termPattern = RegExp(r'^(\d*)d(\d+)$', caseSensitive: false);

  DiceResult roll(String input, {int advantage = 0}) {
    final expression = input.trim();
    if (expression.isEmpty) {
      throw DiceFormatException('Escribe una tirada, por ejemplo 2d6+3.');
    }

    // Split into signed terms while keeping each term's sign.
    final normalized = expression.replaceAll(' ', '');
    final matches = RegExp(r'[+-]?[^+-]+').allMatches(normalized);
    if (matches.isEmpty) {
      throw DiceFormatException('No entendí "$expression".');
    }

    var total = 0;
    final parts = <String>[];

    for (final match in matches) {
      var term = match.group(0)!;
      var sign = 1;
      if (term.startsWith('-')) {
        sign = -1;
        term = term.substring(1);
      } else if (term.startsWith('+')) {
        term = term.substring(1);
      }
      if (term.isEmpty) {
        throw DiceFormatException('No entendí "$expression".');
      }

      final dice = _termPattern.firstMatch(term);
      if (dice != null) {
        final count = dice.group(1)!.isEmpty ? 1 : int.parse(dice.group(1)!);
        final sides = int.parse(dice.group(2)!);
        if (count < 1 || count > _maxDice) {
          throw DiceFormatException('Usa entre 1 y $_maxDice dados.');
        }
        if (sides < 2 || sides > _maxSides) {
          throw DiceFormatException('Los dados deben tener entre 2 y $_maxSides caras.');
        }

        final rolls = <int>[];
        for (var i = 0; i < count; i++) {
          rolls.add(_rollOne(sides, advantage: advantage, parts: parts));
        }
        final sum = rolls.reduce((a, b) => a + b);
        total += sign * sum;
        parts.add('${sign < 0 ? '-' : ''}${count}d$sides (${rolls.join(', ')})');
        continue;
      }

      final flat = int.tryParse(term);
      if (flat == null) {
        throw DiceFormatException('No entendí "$term" en "$expression".');
      }
      total += sign * flat;
      parts.add('${sign < 0 ? '-' : '+'}$flat');
    }

    return DiceResult(
      expression: expression,
      total: total,
      detail: parts.join(' '),
    );
  }

  /// Rolls one die, applying advantage (roll twice keep highest) or
  /// disadvantage (keep lowest) when requested.
  int _rollOne(int sides, {required int advantage, required List<String> parts}) {
    final first = _random.nextInt(sides) + 1;
    if (advantage == 0) return first;
    final second = _random.nextInt(sides) + 1;
    return advantage > 0 ? max(first, second) : min(first, second);
  }
}
