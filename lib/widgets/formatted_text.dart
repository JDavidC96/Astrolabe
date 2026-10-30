import 'package:flutter/material.dart';

import '../services/styled_text.dart';

/// Shows stored text with its formatting applied instead of printed — the
/// same styles the editor paints, so a preview looks like what was written.
class FormattedText extends StatelessWidget {
  const FormattedText(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final base = style ?? DefaultTextStyle.of(context).style;
    final scheme = Theme.of(context).colorScheme;

    return Text.rich(
      TextSpan(
        children: styledSpans(
          styledFromMarkdown(text),
          base,
          StyleLook(
            // A preview is small, so a heading only grows a little.
            headingScale: 1.15,
            quoteColor: scheme.onSurfaceVariant,
            sceneBreakColor: scheme.primary,
          ),
        ),
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
