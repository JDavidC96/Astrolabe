import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/styled_text.dart';

/// Builds a document from a picture: `b` bold, `i` italic, `B` both, `.`
/// plain. Keeps the tests readable.
StyledText doc(String text, String picture) {
  return StyledText(text, [
    for (final mark in picture.split(''))
      switch (mark) {
        'b' => styleBold,
        'i' => styleItalic,
        'B' => styleBold | styleItalic,
        _ => 0,
      }
  ]);
}

void main() {
  group('reading stored notes', () {
    test('plain text carries no styles', () {
      expect(styledFromMarkdown('Aria'), doc('Aria', '....'));
    });

    test('bold markers become bold characters', () {
      expect(styledFromMarkdown('**Aria** fue'), doc('Aria fue', 'bbbb....'));
    });

    test('italic markers become italic characters', () {
      expect(styledFromMarkdown('el *Norte*'), doc('el Norte', '...iiiii'));
    });

    test('both at once', () {
      expect(styledFromMarkdown('***ya***'), doc('ya', 'BB'));
    });

    test('markers the writer escaped stay as text', () {
      expect(styledFromMarkdown(r'2 \* 3'), doc('2 * 3', '.....'));
    });
  });

  group('writing notes back out', () {
    test('a plain note is stored as it was typed', () {
      expect(styledToMarkdown(doc('Aria', '....')), 'Aria');
    });

    test('bold is stored with its markers', () {
      expect(styledToMarkdown(doc('Aria fue', 'bbbb....')), '**Aria** fue');
    });

    test('a run is opened once, not once per word', () {
      expect(styledToMarkdown(doc('Aria fue', 'bbbbbbbb')), '**Aria fue**');
    });

    test('an asterisk the writer typed is protected', () {
      expect(styledToMarkdown(doc('2 * 3', '.....')), r'2 \* 3');
    });

    test('bold and italic together nest rather than collide', () {
      final markdown = styledToMarkdown(doc('ya', 'BB'));
      expect(styledFromMarkdown(markdown), doc('ya', 'BB'));
    });
  });

  group('the round trip holds', () {
    /// Exactly, for styles that begin and end between words.
    void roundTrips(String text, String picture) {
      final original = doc(text, picture);
      final stored = styledToMarkdown(original);
      expect(styledFromMarkdown(stored), original,
          reason: 'stored as "$stored"');
    }

    /// The promise that holds whatever the writer types, including text
    /// that is itself full of asterisks: the words come back untouched.
    /// Styling is written as faithfully as Markdown allows, and is never
    /// traded against the words.
    void keepsTheWords(String text, String picture) {
      final original = doc(text, picture);
      final stored = styledToMarkdown(original);
      final reread = styledFromMarkdown(stored);

      expect(reread.text, original.text, reason: 'stored as "$stored"');
    }

    test('styles that start and end on word edges', () {
      roundTrips('La Casa Valdris cayo', '...bbbbbbbbbbb......');
    });

    test('styles that meet each other', () {
      roundTrips('negrita cursiva', 'bbbbbbb.iiiiiii');
    });

    test('italic inside bold', () {
      roundTrips('Casa Valdris', 'bbbbbBBBBBBB');
    });

    test('a style that covers everything', () {
      roundTrips('todo junto', 'BBBBBBBBBB');
    });

    test('text that is nothing but markers', () {
      roundTrips('***', '...');
      roundTrips('___', '...');
      roundTrips(r'a\b', '...');
    });

    test('every arrangement of styles over four words', () {
      // Every shape a writer produces by selecting words and pressing the
      // buttons. All 256 come back exactly.
      const marks = ['.', 'b', 'i', 'B'];
      var checked = 0;
      for (final a in marks) {
        for (final b in marks) {
          for (final c in marks) {
            for (final d in marks) {
              roundTrips(
                'casa mesa lago vino',
                '$a$a$a$a.$b$b$b$b.$c$c$c$c.$d$d$d$d',
              );
              checked++;
            }
          }
        }
      }
      expect(checked, 256);
    });

    test('a style that stops inside a word widens to the whole word', () {
      // Markdown has no way to say "half of this word is bold", so rather
      // than store something that reads back wrong, the word takes it all.
      final half = doc('casa', 'bb..');
      final stored = styledToMarkdown(half);
      final reread = styledFromMarkdown(stored);

      expect(reread.text, 'casa');
      expect(reread == half || reread == snapStylesToWords(half), isTrue);
    });

    test('every arrangement of styles over a single word', () {
      const marks = ['.', 'b', 'i', 'B'];
      for (final a in marks) {
        for (final b in marks) {
          for (final c in marks) {
            for (final d in marks) {
              keepsTheWords('casa', '$a$b$c$d');
            }
          }
        }
      }
    });

    test('random prose with random styling', () {
      final random = Random(20260824);
      const alphabet = 'abcde ,.*_áñ';
      const marks = ['.', 'b', 'i', 'B'];

      for (var round = 0; round < 400; round++) {
        final length = 1 + random.nextInt(14);
        final text = [
          for (var i = 0; i < length; i++)
            alphabet[random.nextInt(alphabet.length)]
        ].join();
        final picture = [
          for (var i = 0; i < length; i++) marks[random.nextInt(marks.length)]
        ].join();
        keepsTheWords(text, picture);
      }
    });
  });

  group('carrying styles across an edit', () {
    test('typing after bold text stays bold', () {
      final flags = remapFlags('Aria', [1, 1, 1, 1], 'Arian', null);
      expect(flags, [1, 1, 1, 1, 1]);
    });

    test('typing after plain text stays plain', () {
      final flags = remapFlags('Aria ', [1, 1, 1, 1, 0], 'Aria f', null);
      expect(flags, [1, 1, 1, 1, 0, 0]);
    });

    test('a pending style wins over what came before', () {
      final flags = remapFlags('Aria ', [0, 0, 0, 0, 0], 'Aria f', styleBold);
      expect(flags, [0, 0, 0, 0, 0, 1]);
    });

    test('deleting takes the right styles with it', () {
      final flags = remapFlags('abc', [1, 2, 3], 'ac', null);
      expect(flags, [1, 3]);
    });

    test('replacing a stretch inherits from its left', () {
      final flags = remapFlags('abc', [1, 2, 3], 'aXYc', null);
      expect(flags, [1, 1, 1, 3]);
    });

    test('pasting into an empty field leaves it plain', () {
      final flags = remapFlags('', [], 'hola', null);
      expect(flags, [0, 0, 0, 0]);
    });

    test('clearing the field clears the styles', () {
      expect(remapFlags('abc', [1, 1, 1], '', null), <int>[]);
    });
  });

  group('the toolbar buttons', () {
    test('a press turns the style on across the selection', () {
      expect(toggleFlags([0, 0, 0, 0], 1, 3, styleBold), [0, 1, 1, 0]);
    });

    test('a second press turns it off again', () {
      expect(toggleFlags([0, 1, 1, 0], 1, 3, styleBold), [0, 0, 0, 0]);
    });

    test('a partly bold selection becomes fully bold first', () {
      expect(toggleFlags([0, 1, 0, 0], 1, 3, styleBold), [0, 1, 1, 0]);
    });

    test('italic leaves bold alone', () {
      expect(toggleFlags([1, 1], 0, 2, styleItalic), [3, 3]);
    });

    test('the button knows when it is already on', () {
      expect(flagsCover([1, 1, 0], 0, 2, styleBold), isTrue);
      expect(flagsCover([1, 0, 0], 0, 2, styleBold), isFalse);
      expect(flagsCover([1, 1], 1, 1, styleBold), isFalse);
    });
  });

  mainParagraphs();

  group('painting the field', () {
    test('one span per stretch of identical styling', () {
      final spans = styledSpans(doc('Aria fue', 'bbbb....'), const TextStyle())
          .whereType<TextSpan>()
          .toList();

      expect(spans.length, 2);
      expect(spans[0].text, 'Aria');
      expect(spans[0].style?.fontWeight, FontWeight.bold);
      expect(spans[1].text, ' fue');
      expect(spans[1].style?.fontWeight, isNot(FontWeight.bold));
    });

    test('the spans always add back up to the text', () {
      final spans = styledSpans(doc('Aria fue', 'b.i.B.b.'), const TextStyle());
      final rebuilt =
          spans.whereType<TextSpan>().map((s) => s.text).join();
      expect(rebuilt, 'Aria fue');
    });
  });
}

/// Line styles: a heading, a quotation, a scene break.
void mainParagraphs() {
  group('reading line styles', () {
    test('a heading line', () {
      final read = styledFromMarkdown('## Los Valdris');
      expect(read.text, 'Los Valdris');
      expect(read.flags.every((f) => f & styleHeading != 0), isTrue);
    });

    test('a quoted line', () {
      final read = styledFromMarkdown('> Estos horrores no existian.');
      expect(read.text, 'Estos horrores no existian.');
      expect(read.flags.every((f) => f & styleQuote != 0), isTrue);
    });

    test('a scene break', () {
      final read = styledFromMarkdown('---');
      expect(read.text, '---');
      expect(read.flags.every((f) => f & styleSceneBreak != 0), isTrue);
    });

    test('line styles mix with bold and italic', () {
      final read = styledFromMarkdown('> Un **comentario** de Haller');
      expect(read.text, 'Un comentario de Haller');
      expect(read.flags.every((f) => f & styleQuote != 0), isTrue);
      expect(read.flags[3] & styleBold, styleBold);
      expect(read.flags[0] & styleBold, 0);
    });

    test('only the marked line takes the style', () {
      final read = styledFromMarkdown('## Titulo\nCuerpo normal.');
      final lines = lineRanges(read.text);
      expect(read.flags[lines[0].start] & styleHeading, styleHeading);
      expect(read.flags[lines[1].start] & styleHeading, 0);
    });
  });

  group('writing line styles back out', () {
    StyledText lined(String text, int paragraph) =>
        StyledText(text, List.filled(text.length, paragraph));

    test('a heading keeps its prefix', () {
      expect(styledToMarkdown(lined('Los Valdris', styleHeading)),
          '## Los Valdris');
    });

    test('a quote keeps its prefix', () {
      expect(styledToMarkdown(lined('Estos horrores', styleQuote)),
          '> Estos horrores');
    });

    test('a scene break is written as the mark itself', () {
      expect(styledToMarkdown(lined('---', styleSceneBreak)), '---');
    });

    test('a plain line that looks like a marked one is protected', () {
      final plain = StyledText.plain('## no es titulo');
      final stored = styledToMarkdown(plain);
      expect(styledFromMarkdown(stored), plain);
      expect(styledFromMarkdown(stored).text, '## no es titulo');
    });

    test('a whole passage of quotation round trips', () {
      const passage =
          'Estos horrores eran realmente inexistentes.\n'
          'El hombre del medievo aborreceria nuestra vida.';
      // Built the way the editor builds it, line breaks included.
      final doc = StyledText(
        passage,
        normalizeParagraphs(
          passage,
          List.filled(passage.length, styleQuote | styleItalic),
        ),
      );
      expect(styledFromMarkdown(styledToMarkdown(doc)), doc);
    });

    test('a page of mixed styles round trips', () {
      const text = 'Capitulo uno\nLa casa cayo.\n---\nUn comentario.';
      final flags = <int>[];
      for (final line in lineRanges(text)) {
        final paragraph = switch (line.start) {
          0 => styleHeading,
          _ => text.substring(line.start, line.end) == '---'
              ? styleSceneBreak
              : 0,
        };
        for (var i = line.start; i <= line.end; i++) {
          if (flags.length < text.length) flags.add(paragraph);
        }
      }
      final doc = StyledText(text, normalizeParagraphs(text, flags));
      expect(styledFromMarkdown(styledToMarkdown(doc)), doc);
    });
  });

  group('the line style buttons', () {
    test('a press marks every line the selection touches', () {
      const text = 'uno\ndos\ntres';
      final flags = List.filled(text.length, 0);
      final next = toggleParagraphFlags(text, flags, 1, 6, styleQuote);

      expect(next[0] & styleQuote, styleQuote, reason: 'first line');
      expect(next[4] & styleQuote, styleQuote, reason: 'second line');
      expect(next[8] & styleQuote, 0, reason: 'third line untouched');
    });

    test('a second press clears it', () {
      const text = 'uno';
      final on = toggleParagraphFlags(text, List.filled(3, 0), 0, 3, styleQuote);
      final off = toggleParagraphFlags(text, on, 0, 3, styleQuote);
      expect(off.every((f) => f & paragraphStyles == 0), isTrue);
    });

    test('a line has one style at a time', () {
      const text = 'uno';
      final quoted =
          toggleParagraphFlags(text, List.filled(3, 0), 0, 3, styleQuote);
      final heading = toggleParagraphFlags(text, quoted, 0, 3, styleHeading);

      expect(heading.every((f) => f & styleHeading != 0), isTrue);
      expect(heading.every((f) => f & styleQuote == 0), isTrue);
    });

    test('bold survives becoming a heading', () {
      const text = 'uno';
      final bold = List.filled(3, styleBold);
      final heading = toggleParagraphFlags(text, bold, 0, 3, styleHeading);
      expect(heading.every((f) => f & styleBold != 0), isTrue);
    });
  });

  group('typing after a line style', () {
    test('Enter after a heading starts ordinary text', () {
      const before = '## x';
      final doc = styledFromMarkdown(before);
      final flags = remapFlags(doc.text, doc.flags, '${doc.text}\na', null);

      // The break closes the heading; what comes after is plain.
      expect(flags.last & styleHeading, 0);
    });

    test('Enter inside a quote keeps quoting', () {
      final doc = styledFromMarkdown('> x');
      final flags = remapFlags(doc.text, doc.flags, '${doc.text}\na', null);
      expect(flags.last & styleQuote, styleQuote);
    });

    test('typing along a heading stays in the heading', () {
      final doc = styledFromMarkdown('## Los');
      final flags = remapFlags(doc.text, doc.flags, 'Losa', null);
      expect(flags.every((f) => f & styleHeading != 0), isTrue);
    });
  });
}
