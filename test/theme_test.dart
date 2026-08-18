import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/theme/app_themes.dart';

/// WCAG relative-luminance contrast ratio. Used to keep every theme
/// legible rather than merely atmospheric.
double _contrast(Color a, Color b) {
  double channel(double c) =>
      c <= 0.03928 ? c / 12.92 : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
  double luminance(Color c) =>
      0.2126 * channel(c.r) + 0.7152 * channel(c.g) + 0.0722 * channel(c.b);

  final la = luminance(a);
  final lb = luminance(b);
  final lighter = math.max(la, lb);
  final darker = math.min(la, lb);
  return (lighter + 0.05) / (darker + 0.05);
}

void main() {
  test('theme ids are unique and the default exists', () {
    final ids = appThemes.map((t) => t.id).toList();
    expect(ids.toSet().length, ids.length, reason: 'duplicate theme id');
    expect(ids, contains(defaultThemeId));
  });

  test('an unknown or null id falls back to the default', () {
    expect(themeById(null).id, defaultThemeId);
    expect(themeById('does-not-exist').id, defaultThemeId);
    // A real id still resolves to itself.
    expect(themeById('cyberpunk').id, 'cyberpunk');
  });

  test('every theme builds usable light and dark ThemeData', () {
    for (final theme in appThemes) {
      for (final brightness in Brightness.values) {
        final data = theme.themeData(brightness);
        expect(data.colorScheme.brightness, brightness, reason: theme.id);
        // The genre fonts must actually reach the text theme. A theme with
        // no font declared keeps the platform default, whatever it is.
        if (theme.displayFont != null) {
          expect(
            data.textTheme.titleLarge?.fontFamily,
            theme.displayFont,
            reason: '${theme.id} display font',
          );
        }
        if (theme.bodyFont != null) {
          expect(
            data.textTheme.bodyMedium?.fontFamily,
            theme.bodyFont,
            reason: '${theme.id} body font',
          );
        }
      }
    }
  });

  test('body text stays readable on its surface in both brightnesses', () {
    for (final theme in appThemes) {
      for (final brightness in Brightness.values) {
        final scheme = theme.colorScheme(brightness);
        final ratio = _contrast(scheme.onSurface, scheme.surface);
        // WCAG AA for body text is 4.5:1. Atmosphere is not an excuse for
        // text the user cannot read.
        expect(
          ratio,
          greaterThanOrEqualTo(4.5),
          reason: '${theme.id} ($brightness) text contrast is $ratio',
        );
      }
    }
  });

  test('primary colour is distinguishable from the surface behind it', () {
    for (final theme in appThemes) {
      for (final brightness in Brightness.values) {
        final scheme = theme.colorScheme(brightness);
        final ratio = _contrast(scheme.primary, scheme.surface);
        // 3:1 is the WCAG threshold for large text and UI components.
        expect(
          ratio,
          greaterThanOrEqualTo(3.0),
          reason: '${theme.id} ($brightness) primary contrast is $ratio',
        );
      }
    }
  });

  test('text on a primary-filled button is readable', () {
    for (final theme in appThemes) {
      for (final brightness in Brightness.values) {
        final scheme = theme.colorScheme(brightness);
        final ratio = _contrast(scheme.onPrimary, scheme.primary);
        expect(
          ratio,
          greaterThanOrEqualTo(4.5),
          reason: '${theme.id} ($brightness) onPrimary contrast is $ratio',
        );
      }
    }
  });

  test('every declared font file is actually bundled', () {
    final families = <String>{
      for (final theme in appThemes) ...[
        if (theme.displayFont != null) theme.displayFont!,
        if (theme.bodyFont != null) theme.bodyFont!,
      ],
    };

    final pubspec = File('pubspec.yaml').readAsStringSync();
    for (final family in families) {
      expect(
        pubspec,
        contains('family: $family'),
        reason: '$family is used by a theme but not declared in pubspec',
      );
    }

    // And the asset files themselves exist.
    final fontDir = Directory('assets/fonts');
    expect(fontDir.existsSync(), isTrue);
    final files = fontDir
        .listSync()
        .whereType<File>()
        .map((f) => f.uri.pathSegments.last)
        .toList();
    for (final family in families) {
      expect(
        files.any((f) => f.startsWith(family)),
        isTrue,
        reason: 'no font file found for $family in assets/fonts',
      );
    }
  });
}
