/// Bold and italic held as a style per character, next to the text rather
/// than inside it.
///
/// This is what lets the editor behave like a word processor: the writer
/// turns bold on and types, and no markers ever appear on screen. What gets
/// stored is still ordinary Markdown — `**negrita**`, `*cursiva*` — so old
/// notes keep opening, backups stay readable and the previews elsewhere in
/// the app go on working unchanged.
library;

import 'package:flutter/material.dart';

import 'inline_markup.dart';

/// Styles that apply to whatever stretch of characters the writer picked.
const styleBold = 1;
const styleItalic = 2;

/// Styles that apply to a whole line at a time. A line has at most one of
/// them, and every character in the line carries it, which is what lets the
/// same remapping carry them across an edit.
const styleHeading = 4;
const styleQuote = 8;
const styleSceneBreak = 16;

const inlineStyles = styleBold | styleItalic;
const paragraphStyles = styleHeading | styleQuote | styleSceneBreak;

const _headingPrefix = '## ';
const _quotePrefix = '> ';
const _sceneBreakLine = '---';

/// Text and its per-character styles. [flags] always has one entry per code
/// unit of [text].
class StyledText {
  StyledText(this.text, List<int> flags)
      : flags = _fit(flags, text.length);

  StyledText.plain(this.text) : flags = List.filled(text.length, 0);

  final String text;
  final List<int> flags;

  static List<int> _fit(List<int> flags, int length) {
    if (flags.length == length) return List.of(flags);
    final fitted = List.filled(length, 0);
    for (var i = 0; i < length && i < flags.length; i++) {
      fitted[i] = flags[i];
    }
    return fitted;
  }

  /// The same text without its surrounding whitespace, styles included.
  StyledText trimmed() {
    var start = 0;
    var end = text.length;
    while (start < end && text[start].trim().isEmpty) {
      start++;
    }
    while (end > start && text[end - 1].trim().isEmpty) {
      end--;
    }
    return StyledText(text.substring(start, end), flags.sublist(start, end));
  }

  @override
  bool operator ==(Object other) {
    if (other is! StyledText) return false;
    if (other.text != text || other.flags.length != flags.length) return false;
    for (var i = 0; i < flags.length; i++) {
      if (other.flags[i] != flags[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(text, Object.hashAll(flags));
}

/// Reads stored Markdown into text plus styles. Reuses the same reader the
/// previews use, so the two can never disagree about what a note says.
StyledText styledFromMarkdown(String markdown) {
  final buffer = StringBuffer();
  final flags = <int>[];
  final lines = markdown.split('\n');

  for (var i = 0; i < lines.length; i++) {
    if (i > 0) {
      // The break itself ends the line above and carries its style, so a
      // quote that runs on stays a quote.
      buffer.write('\n');
      flags.add(flags.isEmpty ? 0 : flags.last & paragraphStyles);
    }

    var line = lines[i];
    var paragraph = 0;

    if (line.startsWith(_headingPrefix)) {
      paragraph = styleHeading;
      line = line.substring(_headingPrefix.length);
    } else if (line.startsWith(_quotePrefix)) {
      paragraph = styleQuote;
      line = line.substring(_quotePrefix.length);
    } else if (line.trimRight() == _sceneBreakLine) {
      paragraph = styleSceneBreak;
    }

    for (final span in parseInlineMarkup(line, const TextStyle())) {
      if (span is! TextSpan) continue;
      final piece = span.text ?? '';
      if (piece.isEmpty) continue;

      var flag = paragraph;
      if (span.style?.fontWeight == FontWeight.bold) flag |= styleBold;
      if (span.style?.fontStyle == FontStyle.italic) flag |= styleItalic;

      buffer.write(piece);
      flags.addAll(List.filled(piece.length, flag));
    }
  }

  return StyledText(buffer.toString(), flags);
}

/// Where each line of [text] starts and ends, breaks excluded.
List<({int start, int end})> lineRanges(String text) {
  final ranges = <({int start, int end})>[];
  var start = 0;

  for (var i = 0; i <= text.length; i++) {
    if (i == text.length || text[i] == '\n') {
      ranges.add((start: start, end: i));
      start = i + 1;
    }
  }
  return ranges;
}

/// Makes the line styles consistent: every character of a line carries the
/// style of the line's first character, and a line is a scene break exactly
/// when that is all it says.
List<int> normalizeParagraphs(String text, List<int> flags) {
  final fixed = StyledText(text, flags).flags;

  for (final line in lineRanges(text)) {
    var paragraph =
        line.start < fixed.length ? fixed[line.start] & paragraphStyles : 0;

    // A scene break is the mark, so the mark is what decides.
    final body = text.substring(line.start, line.end);
    if (body.trimRight() == _sceneBreakLine) {
      paragraph = styleSceneBreak;
    } else if (paragraph == styleSceneBreak) {
      paragraph = 0;
    }

    for (var i = line.start; i < line.end && i < fixed.length; i++) {
      fixed[i] = (fixed[i] & ~paragraphStyles) | paragraph;
    }
    // The break belongs to the line it closes, and carries nothing else —
    // it has no glyph to wear a style on.
    if (line.end < fixed.length && text[line.end] == '\n') {
      fixed[line.end] = paragraph;
    }
  }

  return fixed;
}

/// Turns a line style on across every line the selection touches, or off
/// again when they all already have it. Only one line style at a time.
List<int> toggleParagraphFlags(
  String text,
  List<int> flags,
  int start,
  int end,
  int bit,
) {
  final touched = lineRanges(text)
      .where((line) => line.start <= end && line.end >= start)
      .toList();
  if (touched.isEmpty) return List.of(flags);

  final already = touched.every((line) =>
      line.start < flags.length && flags[line.start] & bit != 0);

  final next = List.of(flags);
  for (final line in touched) {
    for (var i = line.start; i <= line.end && i < next.length; i++) {
      next[i] = already
          ? next[i] & ~paragraphStyles
          : (next[i] & ~paragraphStyles) | bit;
    }
  }

  return normalizeParagraphs(text, next);
}

/// How one attempt at writing the styles out spells them.
///
/// Markdown has more than one way to say the same thing, and which way works
/// depends on where the styles start and stop. A style that begins in the
/// middle of a word needs asterisks; a style that ends while another carries
/// on reads better with underscores, which cannot run together with the
/// asterisks around them.
class _Spelling {
  const _Spelling(this.italic, this.boldOutside, this.escapeEverything);

  final String italic;
  final bool boldOutside;
  final bool escapeEverything;
}

/// Pick the italic marker per stretch: an underscore next to asterisks so
/// the two never run together, an asterisk in the middle of a word where an
/// underscore would be read as part of the word.
const _italicAuto = 'auto';

const _spellings = [
  _Spelling(_italicAuto, true, false),
  _Spelling(italicMarker, true, false),
  _Spelling('_', true, false),
  _Spelling(_italicAuto, false, false),
  _Spelling(italicMarker, false, false),
  _Spelling('_', false, false),
  _Spelling(_italicAuto, true, true),
  _Spelling(italicMarker, true, true),
];

/// Writes the styles back out as Markdown.
///
/// Tries each spelling in turn and keeps the first that reads back as what
/// it was given, so what gets stored is always what the writer sees.
///
/// A style that starts or stops in the middle of a word is the one thing
/// Markdown cannot write down; in that case the style is widened to the
/// whole word rather than stored as something that would read back wrong.
String styledToMarkdown(StyledText doc) {
  final exact = _write(doc);
  if (exact != null) return exact;

  // Second best: the same words with each style widened to whole words.
  final snapped = snapStylesToWords(doc);
  final widened = _write(snapped);
  if (widened != null) return widened;

  // Past that the styling cannot be written down as it stands. Words matter
  // more than styling, so keep only attempts that give the words back
  // untouched, and among those take the one that strays least. Dropping the
  // styling entirely is always on that list, so there is always an answer.
  String? best;
  var bestCost = 0;

  for (final candidate in [doc, snapped, StyledText.plain(doc.text)]) {
    for (final spelling in _spellings) {
      final written = _emit(candidate, spelling);
      final reread = styledFromMarkdown(written);
      if (reread.text != doc.text) continue;

      final cost = _distance(doc, reread);
      if (best == null || cost < bestCost) {
        best = written;
        bestCost = cost;
      }
    }
  }

  return best ?? _emit(StyledText.plain(doc.text), _spellings.last);
}

/// How many characters would come back wearing the wrong style.
int _distance(StyledText wanted, StyledText got) {
  var cost = 0;
  for (var i = 0; i < wanted.flags.length && i < got.flags.length; i++) {
    if (wanted.flags[i] != got.flags[i]) cost++;
  }
  return cost;
}

String? _write(StyledText doc) {
  for (final spelling in _spellings) {
    final written = _emit(doc, spelling);
    if (styledFromMarkdown(written) == doc) return written;
  }
  return null;
}

/// Widens every style to cover whole words. This is the one adjustment
/// storing as Markdown can force, and it only happens when a style starts
/// or stops inside a word.
StyledText snapStylesToWords(StyledText doc) {
  final flags = List.of(doc.flags);
  var i = 0;

  while (i < doc.text.length) {
    if (!isWordChar(doc.text[i])) {
      i++;
      continue;
    }
    var end = i;
    while (end < doc.text.length && isWordChar(doc.text[end])) {
      end++;
    }
    var merged = 0;
    for (var k = i; k < end; k++) {
      merged |= flags[k];
    }
    for (var k = i; k < end; k++) {
      flags[k] = merged;
    }
    i = end;
  }

  return StyledText(doc.text, flags);
}

final _wordChar = RegExp(r'[\wÀ-ɏ]');

bool isWordChar(String char) => _wordChar.hasMatch(char);

/// Writes the whole document: each line gets its own prefix, and the
/// character styles are spelled out inside it.
String _emit(StyledText doc, _Spelling spelling) {
  final out = StringBuffer();
  final lines = lineRanges(doc.text);

  for (var i = 0; i < lines.length; i++) {
    if (i > 0) out.write('\n');

    final line = lines[i];
    final paragraph = line.start < doc.flags.length
        ? doc.flags[line.start] & paragraphStyles
        : 0;

    final body = StyledText(
      doc.text.substring(line.start, line.end),
      doc.flags.sublist(line.start, line.end).map((f) => f & inlineStyles).toList(),
    );

    if (paragraph == styleHeading) {
      out.write(_headingPrefix);
    } else if (paragraph == styleQuote) {
      out.write(_quotePrefix);
    }

    final written = _emitLine(body, spelling);

    // A plain line that opens like a marked one has to say it is not.
    if (paragraph == 0 &&
        (written.startsWith('#') ||
            written.startsWith('>') ||
            written.trimRight() == _sceneBreakLine)) {
      out.write(escapeChar);
    }
    out.write(written);
  }

  return out.toString();
}

String _emitLine(StyledText doc, _Spelling spelling) {
  final buffer = StringBuffer();
  // What is open, and which marker each one was opened with, since a style
  // has to close with the same characters it opened with.
  final open = <int>[];
  final marks = <String>[];
  final order = spelling.boldOutside
      ? const [styleBold, styleItalic]
      : const [styleItalic, styleBold];

  String italicMarkFor(String written) {
    if (spelling.italic != _italicAuto) return spelling.italic;
    if (written.isEmpty) return '_';
    final last = written[written.length - 1];
    // Next to asterisks an underscore keeps the runs apart; in the middle of
    // a word only an asterisk is read as a marker at all.
    if (last == '*') return '_';
    return isWordChar(last) ? italicMarker : '_';
  }

  for (var i = 0; i < doc.text.length; i++) {
    final flag = doc.flags[i];

    // Close whatever no longer applies, innermost first.
    var keep = open.length;
    for (var k = 0; k < open.length; k++) {
      if (flag & open[k] == 0) {
        keep = k;
        break;
      }
    }
    while (open.length > keep) {
      open.removeLast();
      buffer.write(marks.removeLast());
    }

    for (final bit in order) {
      if (flag & bit != 0 && !open.contains(bit)) {
        final mark = bit == styleBold
            ? boldMarker
            : italicMarkFor(buffer.toString());
        open.add(bit);
        marks.add(mark);
        buffer.write(mark);
      }
    }

    buffer.write(_escape(doc.text[i], spelling.escapeEverything));
  }

  while (open.isNotEmpty) {
    open.removeLast();
    buffer.write(marks.removeLast());
  }
  return buffer.toString();
}

String _escape(String char, bool escapeEverything) {
  if (char != '*' && char != '_' && char != '\\') return char;
  // A marker the writer typed themselves has to survive as itself.
  if (!escapeEverything && char == '\\') return char;
  return '\\$char';
}

/// Carries the styles across an edit. [oldText] and [newText] differ by one
/// stretch being replaced, which is what a text field ever does.
///
/// Characters that arrive take [pending] when the writer has just turned a
/// style on, and otherwise inherit from the character to their left — the
/// same way typing after a bold word stays bold.
List<int> remapFlags(
  String oldText,
  List<int> oldFlags,
  String newText,
  int? pending,
) {
  final flags = StyledText(oldText, oldFlags).flags;

  final shortest = oldText.length < newText.length ? oldText.length : newText.length;
  var prefix = 0;
  while (prefix < shortest &&
      oldText.codeUnitAt(prefix) == newText.codeUnitAt(prefix)) {
    prefix++;
  }

  var suffix = 0;
  while (suffix < shortest - prefix &&
      oldText.codeUnitAt(oldText.length - 1 - suffix) ==
          newText.codeUnitAt(newText.length - 1 - suffix)) {
    suffix++;
  }

  final added = newText.length - prefix - suffix;
  var carried = pending ?? (prefix > 0 ? flags[prefix - 1] : 0);

  // A heading is one line; pressing Enter starts ordinary text again. A
  // quote keeps going, because quotes run over several paragraphs.
  if (prefix > 0 && oldText[prefix - 1] == '\n') {
    carried &= ~(styleHeading | styleSceneBreak);
  }

  final arriving = <int>[];
  for (var k = 0; k < added; k++) {
    arriving.add(carried);
    if (newText[prefix + k] == '\n') {
      carried &= ~(styleHeading | styleSceneBreak);
    }
  }

  return normalizeParagraphs(newText, [
    ...flags.take(prefix),
    ...arriving,
    ...flags.skip(oldText.length - suffix),
  ]);
}

/// True when every character in the range already carries [bit] — which is
/// what tells a toolbar button to show itself as on, and what makes a second
/// press turn the style off.
bool flagsCover(List<int> flags, int start, int end, int bit) {
  if (start >= end) return false;
  for (var i = start; i < end && i < flags.length; i++) {
    if (flags[i] & bit == 0) return false;
  }
  return true;
}

/// Turns [bit] on across the range, or off again if it was already on
/// throughout.
List<int> toggleFlags(List<int> flags, int start, int end, int bit) {
  final on = !flagsCover(flags, start, end, bit);
  final next = List.of(flags);
  for (var i = start; i < end && i < next.length; i++) {
    next[i] = on ? next[i] | bit : next[i] & ~bit;
  }
  return next;
}

/// The spans a text field paints: one per stretch of identical styling.
/// The colours the line styles are painted in. They come from the theme, so
/// the model itself stays free of any particular look.
class StyleLook {
  const StyleLook({
    this.headingScale = 1.3,
    this.quoteColor,
    this.quoteBackground,
    this.sceneBreakColor,
  });

  final double headingScale;
  final Color? quoteColor;
  final Color? quoteBackground;
  final Color? sceneBreakColor;
}

List<InlineSpan> styledSpans(
  StyledText doc,
  TextStyle base, [
  StyleLook look = const StyleLook(),
]) {
  final spans = <InlineSpan>[];
  var i = 0;

  while (i < doc.text.length) {
    final flag = doc.flags[i];
    var j = i + 1;
    while (j < doc.text.length && doc.flags[j] == flag) {
      j++;
    }
    spans.add(TextSpan(
      text: doc.text.substring(i, j),
      style: styleFor(flag, base, look),
    ));
    i = j;
  }

  return spans;
}

TextStyle styleFor(
  int flag,
  TextStyle base, [
  StyleLook look = const StyleLook(),
]) {
  var style = base.copyWith(
    fontWeight: flag & styleBold != 0 ? FontWeight.bold : null,
    fontStyle: flag & styleItalic != 0 ? FontStyle.italic : null,
  );

  if (flag & styleHeading != 0) {
    style = style.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: (base.fontSize ?? 16) * look.headingScale,
      height: 1.35,
    );
  }

  if (flag & styleQuote != 0) {
    style = style.copyWith(
      fontStyle: FontStyle.italic,
      color: look.quoteColor ?? style.color,
      backgroundColor: look.quoteBackground,
    );
  }

  if (flag & styleSceneBreak != 0) {
    style = style.copyWith(
      color: look.sceneBreakColor ?? style.color,
      letterSpacing: 6,
    );
  }

  return style;
}
