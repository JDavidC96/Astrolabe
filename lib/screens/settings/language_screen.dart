import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/locale_providers.dart';

/// Language picker.
///
/// Each option is written in its own language, so someone who opened the app
/// in a language they don't read can still find their way out.
class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final current = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l.languageTitle)),
      body: RadioGroup<Locale?>(
        groupValue: current,
        onChanged: (value) => ref.read(localeProvider.notifier).set(value),
        child: ListView(
        children: [
          RadioListTile<Locale?>(
            title: Text(l.languageSystem),
            value: null,
          ),
          const Divider(),
          const RadioListTile<Locale?>(
            title: Text('Español'),
            value: Locale('es'),
          ),
          const RadioListTile<Locale?>(
            title: Text('English'),
            value: Locale('en'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l.languageNote,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
