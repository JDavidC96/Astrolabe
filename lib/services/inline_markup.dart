/// Lightweight inline formatting for free-text fields, written in the same
/// notation writers already know:
///
///     **negrita**      un subtítulo, o algo que importa
///     *cursiva*        énfasis
///     ***ambas***      las dos a la vez
///
/// Los guiones bajos hacen lo mismo (`__negrita__`, `_cursiva_`).
///
/// A marker that never closes is left exactly as it was typed, so an
/// asterisk in the middle of a sentence stays an asterisk. Underscores are
/// ignored inside a word, so `nombre_del_archivo` survives intact.
library;

import 'package:flutter/material.dart';

/// What the toolbar buttons insert.
const boldMarker = '**';
const italicMarker = '*';

/// Renders [text] as spans, applying [base] throughout and layering bold
/// and italic over the marked stretches.
List<InlineSpan> parseInlineMarkup(String text, TextStyle base) {
  return _parse(text, base);
}

/// The same text with its markers removed, for the places that show a plain
/// preview and cannot render spans.
String stripInlineMarkup(String text) {
  final buffer = StringBuffer();
  for (final span in _parse(text, const TextStyle())) {
    if (span is TextSpan) buffer.write(span.text ?? '');
  }
  return buffer.toString();
}

List<InlineSpan> _parse(String text, TextStyle style) {
  return _build(text, 0, text.length, _match(text), style);
}

/// One stretch of marked text: where its markers sit ([extentStart] to
/// [extentEnd]) and what they wrap ([contentStart] to [contentEnd]).
class _Region {
  _Region(this.extentStart, this.extentEnd, this.contentStart, this.contentEnd,
      this.strength);

  final int extentStart;
  final int extentEnd;
  final int contentStart;
  final int contentEnd;

  /// 1 for italic, 2 for bold. Both at once is a bold region nested inside
  /// an italic one, which is how `***así***` ends up meaning both.
  final int strength;
}

/// A run of consecutive `*` or `_`, and what it is allowed to do.
class _Run {
  _Run(this.start, this.char, this.length, this.canOpen, this.canClose)
      : originalLength = length,
        openEdge = start + length,
        closeEdge = start;

  final int start;
  final String char;
  final bool canOpen;
  final bool canClose;

  /// How many markers the run had before any were spent, which is what the
  /// rule below counts.
  final int originalLength;

  /// Markers not yet spent on a pairing.
  int length;

  /// Openers are spent right to left, closers left to right, so the pairs
  /// closest to the content match first and the regions come out nested.
  int openEdge;
  int closeEdge;

  bool active = true;
}

/// Pairs up the markers, nearest first, the way Markdown does.
List<_Region> _match(String text) {
  final runs = _scan(text);
  final regions = <_Region>[];

  for (var ci = 0; ci < runs.length; ci++) {
    final closer = runs[ci];
    if (!closer.canClose) continue;

    while (closer.length > 0) {
      var oi = ci - 1;
      _Run? opener;
      for (; oi >= 0; oi--) {
        final run = runs[oi];
        if (!run.active || run.length == 0) continue;
        if (run.char != closer.char || !run.canOpen) continue;
        if (!_mayPair(run, closer)) continue;
        opener = run;
        break;
      }
      if (opener == null) break;

      // Two markers make bold, one makes italic; take two whenever both
      // sides can spare them.
      final use = opener.length >= 2 && closer.length >= 2 ? 2 : 1;

      final contentStart = opener.openEdge;
      opener.openEdge -= use;
      opener.length -= use;

      final contentEnd = closer.closeEdge;
      closer.closeEdge += use;
      closer.length -= use;

      regions.add(_Region(
        opener.openEdge,
        closer.closeEdge,
        contentStart,
        contentEnd,
        use,
      ));

      // Markers caught inside the new region can no longer reach out of it.
      for (var k = oi + 1; k < ci; k++) {
        runs[k].active = false;
      }
    }
  }

  // Outermost first, so building the tree can take them in order.
  regions.sort((a, b) => a.extentStart != b.extentStart
      ? a.extentStart - b.extentStart
      : b.extentEnd - a.extentEnd);
  return regions;
}

/// Markdown's rule of three. When a run could serve as either end of a pair,
/// `**bold *and* italic***` is ambiguous unless the run lengths are kept from
/// adding up to a multiple of three, which is what stops a `**` from being
/// split in half by the `*` that follows it.
bool _mayPair(_Run opener, _Run closer) {
  final ambiguous = (opener.canOpen && opener.canClose) ||
      (closer.canOpen && closer.canClose);
  if (!ambiguous) return true;

  final sum = opener.originalLength + closer.originalLength;
  if (sum % 3 != 0) return true;
  return opener.originalLength % 3 == 0 && closer.originalLength % 3 == 0;
}

List<_Run> _scan(String text) {
  final runs = <_Run>[];
  var i = 0;
  while (i < text.length) {
    final char = text[i];
    // A backslash hands the next character through as itself, which is how a
    // marker the writer typed on purpose survives.
    if (char == escapeChar && i + 1 < text.length && _escapable(text[i + 1])) {
      i += 2;
      continue;
    }
    if (char != '*' && char != '_') {
      i++;
      continue;
    }

    final length = _runLength(text, i, char);
    final before = i > 0 ? text[i - 1] : null;
    final after = i + length < text.length ? text[i + length] : null;

    // A marker opens onto something and closes onto something; neither side
    // may be a space, which is what keeps `2 * 3` arithmetic.
    var canOpen = after != null && !_isSpace(after);
    var canClose = before != null && !_isSpace(before);

    // Underscores inside a word belong to the word: `mapa_del_norte`.
    if (char == '_') {
      if (before != null && _isWordChar(before)) canOpen = false;
      if (after != null && _isWordChar(after)) canClose = false;
    }

    // One, two or three. A longer row is a divider the writer drew.
    if (length > 3) {
      canOpen = false;
      canClose = false;
    }

    runs.add(_Run(i, char, length, canOpen, canClose));
    i += length;
  }
  return runs;
}

List<InlineSpan> _build(
  String text,
  int from,
  int to,
  List<_Region> regions,
  TextStyle style,
) {
  final spans = <InlineSpan>[];
  var i = from;

  while (i < to) {
    _Region? region;
    for (final candidate in regions) {
      if (candidate.extentStart < i || candidate.extentEnd > to) continue;
      region = candidate;
      break;
    }

    if (region == null) {
      spans.add(TextSpan(text: _unescape(text.substring(i, to)), style: style));
      break;
    }

    if (region.extentStart > i) {
      spans.add(TextSpan(
        text: _unescape(text.substring(i, region.extentStart)),
        style: style,
      ));
    }
    spans.addAll(_build(
      text,
      region.contentStart,
      region.contentEnd,
      regions,
      _styleFor(region.strength, style),
    ));
    i = region.extentEnd;
  }

  return spans;
}

TextStyle _styleFor(int strength, TextStyle style) {
  return strength >= 2
      ? style.copyWith(fontWeight: FontWeight.bold)
      : style.copyWith(fontStyle: FontStyle.italic);
}

int _runLength(String text, int from, String char) {
  var n = 0;
  while (from + n < text.length && text[from + n] == char) {
    n++;
  }
  return n;
}

/// The backslash, written by code point so no editing tool can eat it.
const escapeChar = '\u005C';

/// A backslash also protects the characters that open a line style, so a
/// paragraph that genuinely begins with `#` or `>` stays ordinary text.
bool _escapable(String char) =>
    char == '*' ||
    char == '_' ||
    char == '#' ||
    char == '>' ||
    char == '-' ||
    char == escapeChar;

String _unescape(String text) {
  if (!text.contains(escapeChar)) return text;
  final buffer = StringBuffer();
  for (var i = 0; i < text.length; i++) {
    if (text[i] == escapeChar &&
        i + 1 < text.length &&
        _escapable(text[i + 1])) {
      buffer.write(text[i + 1]);
      i++;
      continue;
    }
    buffer.write(text[i]);
  }
  return buffer.toString();
}

bool _isSpace(String char) => char.trim().isEmpty;

bool _isWordChar(String char) => RegExp(r'[\wÀ-ɏ]').hasMatch(char);

/// The text a formatting button produces, plus where the cursor or the
/// selection ends up afterwards.
class MarkupEdit {
  const MarkupEdit(this.text, this.selection);

  final String text;
  final TextSelection selection;
}

/// Applies [marker] to [selection] the way a bold or italic button should:
/// wraps the selected words, and unwraps them again on a second press.
///
/// Bold and italic compose, so marking a bold phrase as italic gives
/// `***así***` rather than a broken pair.
MarkupEdit applyMarker(String text, TextSelection selection, String marker) {
  if (!selection.isValid) {
    // The field was never focused; leave the pair at the end, ready to type
    // into.
    return MarkupEdit(
      '$text$marker$marker',
      TextSelection.collapsed(offset: text.length + marker.length),
    );
  }

  if (selection.isCollapsed) {
    final at = selection.start;
    return MarkupEdit(
      text.replaceRange(at, at, '$marker$marker'),
      TextSelection.collapsed(offset: at + marker.length),
    );
  }

  // Markers hugging the selection count as part of it, so pressing the
  // button again takes back exactly what the first press added — whether or
  // not the user's selection happened to include them.
  final char = marker[0];
  var start = selection.start;
  var end = selection.end;
  while (start > 0 && text[start - 1] == char) {
    start--;
  }
  while (end < text.length && text[end] == char) {
    end++;
  }

  final region = text.substring(start, end);
  final lead = _runLength(region, 0, char);
  final tail = _runLength(region.split('').reversed.join(), 0, char);
  final bare = region.substring(lead, region.length - tail);

  // Already marked with this style, on its own or combined with the other
  // one: take this style's markers off and leave the rest alone.
  if (bare.isNotEmpty &&
      lead == tail &&
      (lead == marker.length || lead == 3)) {
    final keep = char * (lead - marker.length);
    return MarkupEdit(
      text.replaceRange(start, end, '$keep$bare$keep'),
      TextSelection(
        baseOffset: start + keep.length,
        extentOffset: start + keep.length + bare.length,
      ),
    );
  }

  return MarkupEdit(
    text.replaceRange(start, end, '$marker$region$marker'),
    TextSelection(
      baseOffset: start + marker.length,
      extentOffset: start + marker.length + region.length,
    ),
  );
}
