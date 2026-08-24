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

/// Why an expression could not be rolled. The screen turns this into a
/// sentence in the reader's language; the enum keeps the roller itself
/// free of display text.
enum DiceError { empty, unparsable, tooManyDice, sideRange, unknownTerm }

class DiceFormatException implements Exception {
  DiceFormatException(this.error, {this.text, this.limit});

  final DiceError error;

  /// The offending expression or term, when there is one.
  final String? text;

  /// The bound that was exceeded, for the range errors.
  final int? limit;

  @override
  String toString() => 'DiceFormatException(\$error, \$text)';
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
      throw DiceFormatException(DiceError.empty);
    }

    // Split into signed terms while keeping each term's sign.
    final normalized = expression.replaceAll(' ', '');
    final matches = RegExp(r'[+-]?[^+-]+').allMatches(normalized);
    if (matches.isEmpty) {
      throw DiceFormatException(DiceError.unparsable, text: expression);
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
        throw DiceFormatException(DiceError.unparsable, text: expression);
      }

      final dice = _termPattern.firstMatch(term);
      if (dice != null) {
        final count = dice.group(1)!.isEmpty ? 1 : int.parse(dice.group(1)!);
        final sides = int.parse(dice.group(2)!);
        if (count < 1 || count > _maxDice) {
          throw DiceFormatException(DiceError.tooManyDice, limit: _maxDice);
        }
        if (sides < 2 || sides > _maxSides) {
          throw DiceFormatException(DiceError.sideRange, limit: _maxSides);
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
        throw DiceFormatException(DiceError.unknownTerm, text: term);
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
