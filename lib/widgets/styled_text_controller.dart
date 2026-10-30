import 'package:flutter/material.dart';

import '../services/styled_text.dart';

/// A text field controller that remembers bold and italic per character, so
/// the field can paint them while the writer types and no markers ever have
/// to appear on screen.
///
/// It reads and writes ordinary Markdown at the edges — [fromMarkdown] on the
/// way in, [toMarkdown] on the way out — so what lands in the database is the
/// same thing it always was.
class StyledTextController extends TextEditingController {
  StyledTextController.fromMarkdown(String markdown)
      : this._(styledFromMarkdown(markdown));

  StyledTextController._(StyledText document)
      : _flags = List.of(document.flags),
        super(text: document.text);

  List<int> _flags;

  /// A style turned on with nothing selected, waiting for the next thing
  /// typed. Forgotten as soon as the caret moves somewhere else.
  int? _pending;

  StyledText get document => StyledText(text, _flags);

  String toMarkdown() => styledToMarkdown(document.trimmed());

  /// Replaces everything with what [markdown] says, for a field that is
  /// filled in after it is built.
  void setMarkdown(String markdown) {
    final document = styledFromMarkdown(markdown);
    _flags = List.of(document.flags);
    _pending = null;
    // Straight past our own setter: the styles are already the right ones
    // and must not be remapped as though the writer had typed them.
    super.value = TextEditingValue(
      text: document.text,
      selection: const TextSelection.collapsed(offset: -1),
    );
  }

  /// True when the whole selection already carries [bit] — what lights the
  /// toolbar button up, and what makes the next press turn it off.
  bool isOn(int bit) {
    final where = selection;
    if (!where.isValid) return false;

    // A line style is on when every line the selection touches has it.
    if (bit & paragraphStyles != 0) {
      final touched = lineRanges(text)
          .where((line) => line.start <= where.end && line.end >= where.start);
      if (touched.isEmpty) return false;
      return touched.every((line) =>
          line.start < _flags.length && _flags[line.start] & bit != 0);
    }

    if (where.isCollapsed) {
      return ((_pending ?? _flagBefore(where.start)) & bit) != 0;
    }
    return flagsCover(_flags, where.start, where.end, bit);
  }

  void toggle(int bit) {
    final where = selection;
    if (!where.isValid) return;

    // A line style takes the whole line, however little of it is selected.
    if (bit & paragraphStyles != 0) {
      _flags =
          toggleParagraphFlags(text, _flags, where.start, where.end, bit);
      notifyListeners();
      return;
    }

    if (where.isCollapsed) {
      _pending = (_pending ?? _flagBefore(where.start)) ^ bit;
    } else {
      _flags = toggleFlags(_flags, where.start, where.end, bit);
    }
    notifyListeners();
  }

  /// Drops a scene break on its own line below the caret.
  void insertSceneBreak() {
    final at = selection.isValid ? selection.end : text.length;
    final needsBreakBefore = at > 0 && text[at - 1] != '\n';
    final insertion = '${needsBreakBefore ? '\n' : ''}---\n';

    value = TextEditingValue(
      text: text.replaceRange(at, at, insertion),
      selection:
          TextSelection.collapsed(offset: at + insertion.length),
    );
  }

  /// Typing continues the style of what is to the left, the way it does in
  /// any word processor.
  int _flagBefore(int offset) {
    if (offset > 0 && offset - 1 < _flags.length) return _flags[offset - 1];
    return 0;
  }

  @override
  set value(TextEditingValue newValue) {
    final previous = super.value;

    if (newValue.text != previous.text) {
      _flags = remapFlags(previous.text, _flags, newValue.text, _pending);
      _pending = null;
    } else if (newValue.selection != previous.selection) {
      _pending = null;
    }

    super.value = newValue;
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final base = style ?? const TextStyle();
    final scheme = Theme.of(context).colorScheme;

    return TextSpan(
      style: base,
      children: styledSpans(
        document,
        base,
        StyleLook(
          quoteColor: scheme.onSurfaceVariant,
          // A tint behind the words is how a quotation can be set apart
          // inside a text field, which cannot indent one paragraph alone.
          quoteBackground: scheme.surfaceContainerHighest,
          sceneBreakColor: scheme.primary,
        ),
      ),
    );
  }
}
