/// Word and character counts for prose written in the chapter editor.
///
/// The editor stores Markdown, so the markup itself must not be counted:
/// a scene break (`---`) is not a word, and `**palabra**` is one word, not
/// three tokens.
class TextStats {
  const TextStats({
    required this.words,
    required this.characters,
    required this.charactersNoSpaces,
    required this.paragraphs,
  });

  final int words;
  final int characters;
  final int charactersNoSpaces;
  final int paragraphs;

  static const empty = TextStats(
    words: 0,
    characters: 0,
    charactersNoSpaces: 0,
    paragraphs: 0,
  );

  /// Markdown constructs that carry no prose: horizontal rules, heading
  /// markers, list bullets, emphasis and code markers.
  static final _sceneBreak = RegExp(r'^\s*([-*_])\s*\1\s*\1[\s\1]*$',
      multiLine: true);
  static final _headingMarker = RegExp(r'^\s{0,3}#{1,6}\s+', multiLine: true);
  static final _quoteMarker = RegExp(r'^\s{0,3}>\s?', multiLine: true);
  static final _listMarker =
      RegExp(r'^\s{0,3}([-*+]|\d+\.)\s+', multiLine: true);
  static final _emphasis = RegExp(r'(\*{1,3}|_{1,3}|`+|~~)');
  static final _whitespace = RegExp(r'\s+');

  factory TextStats.of(String? raw) {
    final text = raw ?? '';
    if (text.trim().isEmpty) return empty;

    // Strip markup before counting words, but keep the original for the
    // character counts the writer actually sees on screen.
    final stripped = text
        .replaceAll(_sceneBreak, ' ')
        .replaceAll(_headingMarker, '')
        .replaceAll(_quoteMarker, '')
        .replaceAll(_listMarker, '')
        .replaceAll(_emphasis, '');

    final words = stripped
        .split(_whitespace)
        .where((token) => token.replaceAll(RegExp(r'[^\wÀ-ɏ]'), '').isNotEmpty)
        .length;

    final paragraphs = text
        .split(RegExp(r'\n\s*\n'))
        .where((p) => p.trim().isNotEmpty)
        .length;

    return TextStats(
      words: words,
      characters: text.length,
      charactersNoSpaces: text.replaceAll(_whitespace, '').length,
      paragraphs: paragraphs,
    );
  }
}
