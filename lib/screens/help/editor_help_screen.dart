import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../widgets/formatted_text.dart';

/// Explains the writing tools, in the reader's own language, from inside the
/// app rather than somewhere they would have to go looking for it.
class EditorHelpScreen extends StatelessWidget {
  const EditorHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l.helpEditorTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 48),
        children: [
          Text(l.helpIntro, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),

          _Section(l.helpStylesTitle, children: [
            Text(l.helpStylesIntro),
            const SizedBox(height: 16),
            _Step(
              icon: Icons.format_bold,
              title: l.helpWayMarkTitle,
              body: l.helpWayMarkBody,
            ),
            _Step(
              icon: Icons.keyboard_outlined,
              title: l.helpWayAheadTitle,
              body: l.helpWayAheadBody,
            ),
            _Note(title: l.helpOnTitle, body: l.helpOnBody),
            const SizedBox(height: 12),
            Text(l.helpCombineBody),
          ]),

          _Section(l.helpReachTitle, children: [
            _Step(
              icon: Icons.format_bold,
              title: l.helpReachBarTitle,
              body: l.helpReachBarBody,
            ),
            _Step(
              icon: Icons.keyboard_outlined,
              title: l.helpReachKeysTitle,
              body: l.helpReachKeysBody,
            ),
            _Step(
              icon: Icons.smartphone_outlined,
              title: l.helpReachPhoneTitle,
              body: l.helpReachPhoneBody,
            ),
          ]),

          _Section(l.helpWhereTitle, children: [
            Text(l.helpWhereBody),
            const SizedBox(height: 8),
            Text(
              l.helpWhereNote,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ]),

          _Section(l.helpChapterOnlyTitle, children: [
            Text(l.helpChapterOnlyIntro),
            const SizedBox(height: 16),
            _Step(
              icon: Icons.title,
              title: l.editorSubheading,
              body: l.helpSubheadingBody,
            ),
            _Step(
              icon: Icons.format_quote,
              title: l.markupQuote,
              body: l.helpQuoteBody,
            ),
            _Step(
              icon: Icons.horizontal_rule,
              title: l.editorSceneBreak,
              body: l.helpSceneBreakBody,
            ),
            _Note(body: l.helpChapterOnlyWarn),
          ]),

          _Section(l.helpStoredTitle, children: [
            Text(l.helpStoredBody),
            const SizedBox(height: 12),
            // The one sample drives both halves, so the guide can never
            // disagree with what the app actually does.
            _SamplePane(
              label: l.helpStoredSeeLabel,
              child: FormattedText(
                l.helpStoredSample,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
            _SamplePane(
              label: l.helpStoredSavedLabel,
              child: Text(
                l.helpStoredSample,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'monospace',
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(l.helpStoredWhy),
            const SizedBox(height: 8),
            Text(
              l.helpStoredAsterisk,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ]),

          _Section(l.helpHalfWordTitle, children: [
            Text(l.helpHalfWordBody),
            const SizedBox(height: 8),
            Text(
              l.helpHalfWordNote,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ]),

          _Section(l.helpMoreTitle, children: [
            _Step(
              icon: Icons.cloud_done_outlined,
              title: l.helpAutosaveTitle,
              body: l.helpAutosaveBody,
            ),
            _Step(
              icon: Icons.numbers,
              title: l.helpWordCountTitle,
              body: l.helpWordCountBody,
            ),
            _Step(
              icon: Icons.flag_outlined,
              title: l.helpGoalTitle,
              body: l.helpGoalBody,
            ),
            _Step(
              icon: Icons.open_in_full,
              title: l.helpFocusTitle,
              body: l.helpFocusBody,
            ),
          ]),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.title, {required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 40),
        Text(title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.icon, required this.title, required this.body});

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 14),
            child: Icon(icon, size: 20, color: theme.colorScheme.primary),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                const SizedBox(height: 2),
                Text(
                  body,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note({this.title, required this.body});

  final String? title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(top: 4),
      color: theme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Text(title!, style: theme.textTheme.titleSmall),
              const SizedBox(height: 4),
            ],
            Text(body, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _SamplePane extends StatelessWidget {
  const _SamplePane({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              letterSpacing: 1.1,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          child,
        ],
      ),
    );
  }
}
