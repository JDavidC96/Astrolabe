import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The languages the app ships translations for. Adding another is a matter
/// of dropping in `lib/l10n/app_<code>.arb` and listing it here.
const supportedLocales = <Locale>[
  Locale('es'),
  Locale('en'),
];

/// Chosen app language, or null to follow the device.
///
/// Persisted separately from the theme because it is a different kind of
/// preference: the theme belongs to a universe, the language to the reader.
final localeProvider =
    StateNotifierProvider<LocaleNotifier, Locale?>((ref) => LocaleNotifier());

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _load();
  }

  static const _key = 'app_locale';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored == null || stored.isEmpty) return;
    // Ignore a stored code we no longer ship, rather than showing English
    // strings under a Spanish label.
    if (supportedLocales.any((l) => l.languageCode == stored)) {
      state = Locale(stored);
    }
  }

  /// Passing null hands control back to the device setting.
  Future<void> set(Locale? locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_key);
    } else {
      await prefs.setString(_key, locale.languageCode);
    }
  }
}
