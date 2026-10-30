import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/inline_markup.dart';

/// Flattens the parsed spans into `text` + the styles that landed on it, so
/// a test can assert on what the reader actually sees.
List<(String, bool bold, bool italic)> pieces(String source) {
  return parseInlineMarkup(source, const TextStyle())
      .whereType<TextSpan>()
      .map((s) => (
            s.text ?? '',
            s.style?.fontWeight == FontWeight.bold,
            s.style?.fontStyle == FontStyle.italic,
          ))
      .toList();
}

void main() {
  group('reading the markers', () {
    test('a plain sentence comes back as one unstyled piece', () {
      expect(pieces('Aria cruzó el puente.'),
          [('Aria cruzó el puente.', false, false)]);
    });

    test('double asterisks are bold', () {
      expect(pieces('**La Casa Valdris**'),
          [('La Casa Valdris', true, false)]);
    });

    test('single asterisks are italic', () {
      expect(pieces('*el Norte*'), [('el Norte', false, true)]);
    });

    test('underscores do the same job', () {
      expect(pieces('__negrita__'), [('negrita', true, false)]);
      expect(pieces('_cursiva_'), [('cursiva', false, true)]);
    });

    test('triple markers give both at once', () {
      expect(pieces('***urgente***'), [('urgente', true, true)]);
    });

    test('marked words sit inside the surrounding sentence', () {
      expect(pieces('El **rey** ha muerto.'), [
        ('El ', false, false),
        ('rey', true, false),
        (' ha muerto.', false, false),
      ]);
    });

    test('italic nests inside bold', () {
      expect(pieces('**Casa *Valdris***'), [
        ('Casa ', true, false),
        ('Valdris', true, true),
      ]);
    });

    test('several marked stretches in one line', () {
      expect(pieces('**Uno** y *dos*'), [
        ('Uno', true, false),
        (' y ', false, false),
        ('dos', false, true),
      ]);
    });
  });

  group('leaving ordinary text alone', () {
    test('a marker that never closes stays visible', () {
      expect(pieces('**sin cerrar'), [('**sin cerrar', false, false)]);
    });

    test('asterisks used as multiplication are not formatting', () {
      expect(pieces('2 * 3 * 4'), [('2 * 3 * 4', false, false)]);
    });

    test('a marker cannot open on a space', () {
      expect(pieces('* no es cursiva *'),
          [('* no es cursiva *', false, false)]);
    });

    test('underscores inside a word belong to the word', () {
      expect(pieces('mapa_del_norte'), [('mapa_del_norte', false, false)]);
    });

    test('a row of asterisks is a divider, not markup', () {
      expect(pieces('****'), [('****', false, false)]);
      expect(pieces('*****separador*****'),
          [('*****separador*****', false, false)]);
    });

    test('empty markers have nothing to mark', () {
      expect(pieces('****'), [('****', false, false)]);
    });
  });

  group('stripping the markers', () {
    test('leaves only the words', () {
      expect(stripInlineMarkup('**La Casa *Valdris*** cayó'),
          'La Casa Valdris cayó');
    });

    test('keeps text that was never markup', () {
      expect(stripInlineMarkup('2 * 3'), '2 * 3');
    });
  });

  group('the bold and italic buttons', () {
    MarkupEdit press(String text, int start, int end, String marker) {
      return applyMarker(
        text,
        TextSelection(baseOffset: start, extentOffset: end),
        marker,
      );
    }

    test('wraps the selected words', () {
      final edit = press('La Casa Valdris', 3, 15, boldMarker);
      expect(edit.text, 'La **Casa Valdris**');
      // The selection still covers the same words, ready for a second style.
      expect(edit.text.substring(edit.selection.start, edit.selection.end),
          'Casa Valdris');
    });

    test('a second press takes the marking back off', () {
      final bold = press('La Casa Valdris', 3, 15, boldMarker);
      final plain = applyMarker(bold.text, bold.selection, boldMarker);
      expect(plain.text, 'La Casa Valdris');
    });

    test('unwraps even when the selection left the markers out', () {
      // The user selected the words, not the asterisks around them.
      final edit = press('**Casa Valdris**', 2, 14, boldMarker);
      expect(edit.text, 'Casa Valdris');
    });

    test('unwraps when the selection took the markers in', () {
      final edit = press('**Casa Valdris**', 0, 16, boldMarker);
      expect(edit.text, 'Casa Valdris');
    });

    test('italic over bold gives both, not a broken pair', () {
      final edit = press('**urgente**', 2, 9, italicMarker);
      expect(edit.text, '***urgente***');
      expect(pieces(edit.text), [('urgente', true, true)]);
    });

    test('removing one style from a doubly marked phrase keeps the other', () {
      final edit = press('***urgente***', 3, 10, boldMarker);
      expect(edit.text, '*urgente*');
      expect(pieces(edit.text), [('urgente', false, true)]);
    });

    test('with nothing selected it leaves a pair to type into', () {
      final edit = applyMarker(
        'Nota: ',
        const TextSelection.collapsed(offset: 6),
        boldMarker,
      );
      expect(edit.text, 'Nota: ****');
      expect(edit.selection.baseOffset, 8);
      expect(edit.selection.isCollapsed, isTrue);
    });

    test('an unfocused field gets the pair at the end', () {
      final edit = applyMarker('Nota', const TextSelection.collapsed(offset: -1),
          italicMarker);
      expect(edit.text, 'Nota**');
      expect(edit.selection.baseOffset, 5);
    });

    test('what the buttons write is what the parser reads back', () {
      final bold = press('Aria cruzó el puente', 0, 4, boldMarker);
      expect(bold.text, '**Aria** cruzó el puente');
      expect(pieces(bold.text), [
        ('Aria', true, false),
        (' cruzó el puente', false, false),
      ]);
    });
  });
}
