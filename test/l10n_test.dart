import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:worldbuilder/providers/locale_providers.dart';

Map<String, dynamic> readArb(String code) {
  final raw = File('lib/l10n/app_$code.arb').readAsStringSync();
  return jsonDecode(raw) as Map<String, dynamic>;
}

/// Message keys only — entries starting with @ are metadata, not strings.
Set<String> messageKeys(Map<String, dynamic> arb) =>
    arb.keys.where((k) => !k.startsWith('@')).toSet();

void main() {
  final es = readArb('es');
  final en = readArb('en');

  test('every Spanish string has an English counterpart', () {
    final missing = messageKeys(es).difference(messageKeys(en));
    expect(
      missing,
      isEmpty,
      reason: 'untranslated keys would silently fall back to Spanish '
          'inside an English UI: $missing',
    );
  });

  test('English has no strings the source language lacks', () {
    // An extra key means a rename went half-done and the Spanish build
    // would crash looking for it.
    final extra = messageKeys(en).difference(messageKeys(es));
    expect(extra, isEmpty, reason: 'orphaned keys: $extra');
  });

  test('no translation was left identical to the Spanish by accident', () {
    // A handful legitimately match: proper nouns, and words that happen to
    // be spelled the same in both languages. Each was checked by hand.
    const allowedIdentical = {
      'appTitle', // brand name
      'languageSpanish', // shown in its own language on purpose
      'languageEnglish',
      'supportKeyLabel', // "Bre-B" is a Colombian product name
      'commonError', // "Error" is the same word in both
      'appearanceAuto', // so is "Auto"
    };

    final suspicious = <String>[];
    for (final key in messageKeys(es)) {
      if (allowedIdentical.contains(key)) continue;
      if (es[key] == en[key]) suspicious.add(key);
    }
    expect(suspicious, isEmpty,
        reason: 'these look copy-pasted rather than translated: $suspicious');
  });

  test('placeholders match between languages', () {
    // A missing {name} would render a literal brace to the reader.
    final placeholder = RegExp(r'\{(\w+)\}');
    for (final key in messageKeys(es)) {
      final esVars =
          placeholder.allMatches(es[key] as String).map((m) => m[1]).toSet();
      final enVars =
          placeholder.allMatches(en[key] as String).map((m) => m[1]).toSet();
      expect(enVars, esVars, reason: 'placeholder mismatch in "$key"');
    }
  });

  testWidgets('the app resolves strings in both languages', (tester) async {
    for (final locale in supportedLocales) {
      await tester.pumpWidget(MaterialApp(
        locale: locale,
        localizationsDelegates: L.localizationsDelegates,
        supportedLocales: L.supportedLocales,
        home: Builder(
          builder: (context) => Text(L.of(context).projectsTitle),
        ),
      ));
      await tester.pump();
      expect(find.byType(Text), findsOneWidget);
    }
  });

  testWidgets('Spanish and English actually differ at runtime',
      (tester) async {
    // Guard against the delegate silently serving one language for both.
    await tester.pumpWidget(MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      home: Builder(
        builder: (context) => Text(L.of(context).projectsTitle),
      ),
    ));
    await tester.pump();
    expect(find.text('Mis universos'), findsOneWidget);

    await tester.pumpWidget(MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      home: Builder(
        builder: (context) => Text(L.of(context).projectsTitle),
      ),
    ));
    await tester.pump();
    expect(find.text('My universes'), findsOneWidget);

  });
}
