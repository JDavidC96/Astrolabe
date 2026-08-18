import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../providers/theme_providers.dart';
import '../../theme/app_themes.dart';

class AppearanceScreen extends ConsumerWidget {
  const AppearanceScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectStreamProvider(projectId));
    final currentThemeId = projectAsync.valueOrNull?.themeId ?? defaultThemeId;
    final mode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Apariencia')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Brillo', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                icon: Icon(Icons.light_mode_outlined),
                label: Text('Claro'),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                icon: Icon(Icons.brightness_auto_outlined),
                label: Text('Auto'),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                icon: Icon(Icons.dark_mode_outlined),
                label: Text('Oscuro'),
              ),
            ],
            selected: {mode},
            onSelectionChanged: (s) =>
                ref.read(themeModeProvider.notifier).set(s.first),
          ),
          const SizedBox(height: 8),
          Text(
            'Este ajuste vale para toda la app.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(height: 32),
          Text('Tema de este universo',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Cada universo guarda su propio tema, así que tu saga medieval y '
            'tu campaña cyberpunk no tienen que verse igual.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          for (final theme in appThemes)
            _ThemeCard(
              theme: theme,
              selected: theme.id == currentThemeId,
              onTap: () => ref.read(projectDaoProvider).updateProjectTheme(
                    id: projectId,
                    themeId: theme.id,
                  ),
            ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Renders each option in its own theme, so the choice is made by looking
/// at the thing itself rather than reading a colour name.
class _ThemeCard extends StatelessWidget {
  const _ThemeCard({
    required this.theme,
    required this.selected,
    required this.onTap,
  });

  final AppTheme theme;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final preview = theme.themeData(brightness);
    final scheme = preview.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Theme(
        data: preview,
        child: Material(
          color: scheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(theme.cornerRadius),
            side: BorderSide(
              color: selected ? scheme.primary : scheme.outlineVariant,
              width: selected ? 3 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          theme.name,
                          style: preview.textTheme.titleLarge
                              ?.copyWith(color: scheme.onSurface),
                        ),
                      ),
                      if (selected)
                        Icon(Icons.check_circle, color: scheme.primary),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    theme.description,
                    style: preview.textTheme.bodySmall
                        ?.copyWith(color: scheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 12),
                  // A miniature of the real UI: the parts a theme changes.
                  Row(
                    children: [
                      _swatch(scheme.primary),
                      _swatch(scheme.secondary),
                      _swatch(scheme.tertiary),
                      _swatch(scheme.surfaceContainerHighest),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      FilledButton(
                        onPressed: onTap,
                        child: const Text('Botón'),
                      ),
                      OutlinedButton(
                        onPressed: onTap,
                        child: const Text('Otro'),
                      ),
                      Chip(label: Text(theme.displayFont ?? 'Sistema')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _swatch(Color color) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(theme.cornerRadius * 0.5),
        border: Border.all(color: Colors.black.withValues(alpha: 0.15)),
      ),
    );
  }
}
