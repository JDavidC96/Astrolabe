import 'package:flutter/material.dart';

/// A visual identity for a universe.
///
/// A theme is three things working together, not just a colour swap:
/// the palette, the typography (the strongest signal of a genre), and the
/// geometry — sharp corners read as forged metal, round ones as living
/// things.
class AppTheme {
  const AppTheme({
    required this.id,
    required this.name,
    required this.description,
    required this.displayFont,
    required this.bodyFont,
    required this.cornerRadius,
    required this.light,
    required this.dark,
    this.letterSpacing = 0,
  });

  final String id;
  final String name;
  final String description;

  /// Font for titles and headings; carries most of the genre signal.
  final String? displayFont;

  /// Font for body copy; chosen for reading comfort within the genre.
  final String? bodyFont;

  final double cornerRadius;
  final ThemePalette light;
  final ThemePalette dark;

  /// Extra tracking on display text — wide tracking reads as engraved or
  /// technological depending on the face.
  final double letterSpacing;

  ColorScheme colorScheme(Brightness brightness) {
    final palette = brightness == Brightness.dark ? dark : light;
    // Seed first so Material 3 derives a harmonious full scheme, then pin
    // the roles that actually carry the genre.
    final base = ColorScheme.fromSeed(
      seedColor: palette.primary,
      brightness: brightness,
    );
    return base.copyWith(
      primary: palette.primary,
      onPrimary: palette.onPrimary,
      secondary: palette.secondary,
      tertiary: palette.tertiary,
      surface: palette.surface,
      onSurface: palette.onSurface,
      surfaceContainerHighest: palette.surfaceVariant,
      outline: palette.outline,
    );
  }

  ThemeData themeData(Brightness brightness) {
    final scheme = colorScheme(brightness);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(cornerRadius),
    );

    final base = ThemeData(colorScheme: scheme, useMaterial3: true);
    final textTheme = _buildTextTheme(base.textTheme);

    return base.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        shape: shape,
        elevation: cornerRadius <= 4 ? 0 : 1,
        // Sharp-cornered themes lean on borders instead of shadow.
        color: scheme.surfaceContainerLow,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius * 0.75),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius * 0.6),
        ),
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.4),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(shape: shape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(shape: shape),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius * 1.2),
        ),
      ),
      dialogTheme: DialogThemeData(shape: shape),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        labelTextStyle: WidgetStatePropertyAll(textTheme.labelSmall),
      ),
      listTileTheme: ListTileThemeData(shape: shape),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    );
  }

  TextTheme _buildTextTheme(TextTheme base) {
    TextStyle? display(TextStyle? style) => style?.copyWith(
          fontFamily: displayFont,
          letterSpacing: letterSpacing,
        );
    TextStyle? body(TextStyle? style) => style?.copyWith(fontFamily: bodyFont);

    return base.copyWith(
      displayLarge: display(base.displayLarge),
      displayMedium: display(base.displayMedium),
      displaySmall: display(base.displaySmall),
      headlineLarge: display(base.headlineLarge),
      headlineMedium: display(base.headlineMedium),
      headlineSmall: display(base.headlineSmall),
      titleLarge: display(base.titleLarge),
      titleMedium: display(base.titleMedium),
      titleSmall: display(base.titleSmall),
      bodyLarge: body(base.bodyLarge),
      bodyMedium: body(base.bodyMedium),
      bodySmall: body(base.bodySmall),
      labelLarge: body(base.labelLarge),
      labelMedium: body(base.labelMedium),
      labelSmall: body(base.labelSmall),
    );
  }
}

/// The handful of colours that define a theme; the rest are derived by
/// Material 3 from these.
class ThemePalette {
  const ThemePalette({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.tertiary,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.outline,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color tertiary;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color outline;
}

/// Fallback used when a project has no theme set, or an unknown id.
const defaultThemeId = 'classic';

const appThemes = <AppTheme>[
  AppTheme(
    id: 'classic',
    name: 'Clásico',
    description: 'Limpio y neutro. Deja que tu contenido hable.',
    displayFont: null,
    bodyFont: null,
    cornerRadius: 12,
    light: ThemePalette(
      primary: Color(0xFF6750A4),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF625B71),
      tertiary: Color(0xFF7D5260),
      surface: Color(0xFFFEF7FF),
      onSurface: Color(0xFF1D1B20),
      surfaceVariant: Color(0xFFE7E0EC),
      outline: Color(0xFF79747E),
    ),
    dark: ThemePalette(
      primary: Color(0xFFD0BCFF),
      onPrimary: Color(0xFF381E72),
      secondary: Color(0xFFCCC2DC),
      tertiary: Color(0xFFEFB8C8),
      surface: Color(0xFF141218),
      onSurface: Color(0xFFE6E0E9),
      surfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF938F99),
    ),
  ),

  // Parchment and oxblood, with gold for anything precious. Roman capitals
  // in Cinzel echo inscriptions; corners stay sharp like cut stone.
  AppTheme(
    id: 'medieval',
    name: 'Medieval',
    description: 'Pergamino, vino y oro. Para reinos, espadas y linajes.',
    displayFont: 'Cinzel',
    bodyFont: 'EBGaramond',
    cornerRadius: 4,
    letterSpacing: 0.8,
    light: ThemePalette(
      primary: Color(0xFF7B2D26),
      onPrimary: Color(0xFFF7EFE0),
      secondary: Color(0xFFB8860B),
      tertiary: Color(0xFF4A5D3A),
      surface: Color(0xFFF4EADA),
      onSurface: Color(0xFF2B2119),
      surfaceVariant: Color(0xFFE3D5BC),
      outline: Color(0xFF9C8B72),
    ),
    dark: ThemePalette(
      primary: Color(0xFFD98C82),
      onPrimary: Color(0xFF3A1210),
      secondary: Color(0xFFE0B44C),
      tertiary: Color(0xFF9CB88A),
      surface: Color(0xFF1C1713),
      onSurface: Color(0xFFEDE0CC),
      surfaceVariant: Color(0xFF3B3229),
      outline: Color(0xFF8A7A64),
    ),
  ),

  // Brass and copper against cream, with verdigris as the accent that
  // reads as aged metal. Playfair's high contrast is Victorian print.
  AppTheme(
    id: 'steampunk',
    name: 'Steampunk',
    description: 'Latón, cobre y cardenillo. Engranajes y vapor.',
    displayFont: 'PlayfairDisplay',
    bodyFont: 'LibreBaskerville',
    cornerRadius: 8,
    letterSpacing: 0.3,
    light: ThemePalette(
      primary: Color(0xFF9C5A21),
      onPrimary: Color(0xFFFFF3E2),
      secondary: Color(0xFF2E7D6B),
      tertiary: Color(0xFF6B4A2F),
      surface: Color(0xFFF6EEE0),
      onSurface: Color(0xFF2E241A),
      surfaceVariant: Color(0xFFE5D6C0),
      outline: Color(0xFF9A8467),
    ),
    dark: ThemePalette(
      primary: Color(0xFFE3A46A),
      onPrimary: Color(0xFF3A2410),
      secondary: Color(0xFF6FC9B4),
      tertiary: Color(0xFFC7A176),
      surface: Color(0xFF1F1913),
      onSurface: Color(0xFFEEE0CE),
      surfaceVariant: Color(0xFF413528),
      outline: Color(0xFF917D63),
    ),
  ),

  // Near-black with electric cyan and magenta — the classic neon-on-night
  // pairing. Zero radius and a mono body face read as terminal UI.
  AppTheme(
    id: 'cyberpunk',
    name: 'Cyberpunk',
    description: 'Neón sobre negro. Circuitos, datos y lluvia ácida.',
    displayFont: 'Orbitron',
    bodyFont: 'ShareTechMono',
    cornerRadius: 0,
    letterSpacing: 1.4,
    light: ThemePalette(
      // Deeper than the neon used in dark mode: white lettering on the
      // brighter cyan fell below the readable contrast threshold.
      primary: Color(0xFF00707C),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFD6006E),
      tertiary: Color(0xFF7A5AF8),
      surface: Color(0xFFF0F2F5),
      onSurface: Color(0xFF10131A),
      surfaceVariant: Color(0xFFDCE1E8),
      outline: Color(0xFF6C7480),
    ),
    dark: ThemePalette(
      primary: Color(0xFF00F0FF),
      onPrimary: Color(0xFF00201F),
      secondary: Color(0xFFFF2E97),
      tertiary: Color(0xFFB39DFF),
      surface: Color(0xFF08090F),
      onSurface: Color(0xFFD8E4EA),
      surfaceVariant: Color(0xFF1B2029),
      outline: Color(0xFF4A5766),
    ),
  ),

  // Living greens and sun gold on warm off-white, with generous rounding —
  // nothing in this world is machined.
  AppTheme(
    id: 'solarpunk',
    name: 'Solarpunk',
    description: 'Verde, sol y aire limpio. Futuros que dan ganas de vivir.',
    displayFont: 'Comfortaa',
    bodyFont: 'Nunito',
    cornerRadius: 20,
    light: ThemePalette(
      primary: Color(0xFF2F7D32),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFE0A21B),
      tertiary: Color(0xFF00897B),
      surface: Color(0xFFFAF8EF),
      onSurface: Color(0xFF1E2419),
      surfaceVariant: Color(0xFFDDE7D2),
      outline: Color(0xFF74836B),
    ),
    dark: ThemePalette(
      primary: Color(0xFF8CD98F),
      onPrimary: Color(0xFF10300F),
      secondary: Color(0xFFF3C868),
      tertiary: Color(0xFF6FD8C8),
      surface: Color(0xFF12170F),
      onSurface: Color(0xFFE0EAD8),
      surfaceVariant: Color(0xFF2C3527),
      outline: Color(0xFF74836B),
    ),
  ),

  // Deep space violet with starlight cyan; rounded like orbits.
  AppTheme(
    id: 'cosmic',
    name: 'Cósmico',
    description: 'Nebulosas y luz de estrellas. Naves, imperios y vacío.',
    displayFont: 'Orbitron',
    bodyFont: 'Nunito',
    cornerRadius: 16,
    letterSpacing: 0.6,
    light: ThemePalette(
      primary: Color(0xFF4A3B9E),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF0E7C9E),
      tertiary: Color(0xFFB0487F),
      surface: Color(0xFFF5F3FC),
      onSurface: Color(0xFF16142A),
      surfaceVariant: Color(0xFFDFDBF0),
      outline: Color(0xFF706B8C),
    ),
    dark: ThemePalette(
      primary: Color(0xFFAFA0FF),
      onPrimary: Color(0xFF221A5C),
      secondary: Color(0xFF6FD9F5),
      tertiary: Color(0xFFF29ACB),
      surface: Color(0xFF0B0A18),
      onSurface: Color(0xFFE2DEF5),
      surfaceVariant: Color(0xFF272444),
      outline: Color(0xFF625C85),
    ),
  ),

  // Charcoal and blood, with the same engraved face as Medieval but a
  // palette that turns it funereal instead of regal.
  AppTheme(
    id: 'gothic',
    name: 'Gótico',
    description: 'Carmesí y ceniza. Vampiros, ruinas y secretos.',
    displayFont: 'Cinzel',
    bodyFont: 'EBGaramond',
    cornerRadius: 2,
    letterSpacing: 1.0,
    light: ThemePalette(
      primary: Color(0xFF8E1B2E),
      onPrimary: Color(0xFFFFF0F1),
      secondary: Color(0xFF4A4458),
      tertiary: Color(0xFF6D5B2E),
      surface: Color(0xFFF2EFF0),
      onSurface: Color(0xFF1A1618),
      surfaceVariant: Color(0xFFDED8DA),
      outline: Color(0xFF7C7276),
    ),
    dark: ThemePalette(
      primary: Color(0xFFE05E72),
      onPrimary: Color(0xFF3F0713),
      secondary: Color(0xFFC9C0D8),
      tertiary: Color(0xFFD6BC7E),
      surface: Color(0xFF121013),
      onSurface: Color(0xFFE6E0E2),
      surfaceVariant: Color(0xFF2C2629),
      outline: Color(0xFF6E656A),
    ),
  ),
];

AppTheme themeById(String? id) {
  return appThemes.firstWhere(
    (t) => t.id == id,
    orElse: () => appThemes.firstWhere((t) => t.id == defaultThemeId),
  );
}
