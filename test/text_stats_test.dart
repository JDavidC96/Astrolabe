import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/text_stats.dart';

void main() {
  test('empty and blank text count as nothing', () {
    expect(TextStats.of(null).words, 0);
    expect(TextStats.of('').words, 0);
    expect(TextStats.of('   \n\n  ').words, 0);
  });

  test('counts plain words', () {
    final stats = TextStats.of('Aria cruzó el puente roto');
    expect(stats.words, 5);
  });

  test('accented and ñ words count as one word each', () {
    // A naive \w+ matcher would split "cruzó" or drop "ñ" entirely.
    final stats = TextStats.of('El niño caminó despacio hacia la montaña');
    expect(stats.words, 7);
  });

  test('markdown emphasis does not inflate the count', () {
    expect(TextStats.of('**Aria** corrió').words, 2);
    expect(TextStats.of('_Aria_ corrió').words, 2);
    expect(TextStats.of('***Aria*** corrió').words, 2);
  });

  test('a scene break is not a word', () {
    final stats = TextStats.of('Primera escena.\n\n---\n\nSegunda escena.');
    expect(stats.words, 4);
  });

  test('heading and list markers are not words', () {
    expect(TextStats.of('# Capítulo uno').words, 2);
    expect(TextStats.of('- pan\n- sal').words, 2);
    expect(TextStats.of('> dijo ella').words, 2);
  });

  test('punctuation alone is not a word', () {
    // Dialogue dashes and stray marks are common in Spanish prose.
    final stats = TextStats.of('—¿Quién anda ahí? — preguntó');
    expect(stats.words, 4);
  });

  test('counts paragraphs separated by blank lines', () {
    final stats = TextStats.of('Uno.\n\nDos.\n\n\nTres.');
    expect(stats.paragraphs, 3);
    // A single line break inside a paragraph does not split it.
    expect(TextStats.of('Uno.\nsigue igual').paragraphs, 1);
  });

  test('character counts reflect what the writer typed', () {
    final stats = TextStats.of('ab cd');
    expect(stats.characters, 5);
    expect(stats.charactersNoSpaces, 4);
  });
}
