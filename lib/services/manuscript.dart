/// Turns what is stored into the shape a page wants: chapters made of
/// paragraphs, and paragraphs made of runs that each carry one style.
///
/// This is the part with no PDF in it, so it can be read and tested on its
/// own.
library;

import 'styled_text.dart';

/// What a paragraph is, which decides how it sits on the page.
enum Block { body, heading, quote, sceneBreak }

/// A stretch of characters sharing one style.
class Run {
  const Run(this.text, this.bold, this.italic);

  final String text;
  final bool bold;
  final bool italic;

  @override
  bool operator ==(Object other) =>
      other is Run &&
      other.text == text &&
      other.bold == bold &&
      other.italic == italic;

  @override
  int get hashCode => Object.hash(text, bold, italic);

  @override
  String toString() => 'Run("$text"${bold ? ' b' : ''}${italic ? ' i' : ''})';
}

class Paragraph {
  const Paragraph(this.block, this.runs);

  final Block block;
  final List<Run> runs;

  String get text => runs.map((r) => r.text).join();

  bool get isEmpty => text.trim().isEmpty;
}

class Chapter {
  const Chapter(this.title, this.paragraphs);

  final String title;
  final List<Paragraph> paragraphs;
}

class Manuscript {
  const Manuscript(this.title, this.chapters);

  final String title;
  final List<Chapter> chapters;

  int get wordCount => chapters
      .expand((c) => c.paragraphs)
      .map((p) => p.text.trim())
      .where((t) => t.isNotEmpty)
      .fold(0, (sum, t) => sum + t.split(RegExp(r'\s+')).length);
}

/// Reads stored chapter text into paragraphs.
List<Paragraph> paragraphsOf(String markdown) {
  final document = styledFromMarkdown(markdown);
  final paragraphs = <Paragraph>[];

  for (final line in lineRanges(document.text)) {
    final flags = line.start < document.flags.length
        ? document.flags[line.start]
        : 0;

    final block = switch (flags & paragraphStyles) {
      styleHeading => Block.heading,
      styleQuote => Block.quote,
      styleSceneBreak => Block.sceneBreak,
      _ => Block.body,
    };

    paragraphs.add(Paragraph(block, _runsIn(document, line.start, line.end)));
  }

  return paragraphs;
}

List<Run> _runsIn(StyledText document, int from, int to) {
  final runs = <Run>[];
  var i = from;

  while (i < to) {
    final inline = document.flags[i] & inlineStyles;
    var j = i + 1;
    while (j < to && document.flags[j] & inlineStyles == inline) {
      j++;
    }
    runs.add(Run(
      document.text.substring(i, j),
      inline & styleBold != 0,
      inline & styleItalic != 0,
    ));
    i = j;
  }

  return runs;
}
