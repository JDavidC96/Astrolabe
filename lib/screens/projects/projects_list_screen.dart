import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/tables.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../services/support_links.dart';
import '../../theme/app_themes.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/stored_image.dart';

class ProjectsListScreen extends ConsumerWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final projectsAsync = ref.watch(projectsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.projectsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.coffee_outlined),
            tooltip: l.supportTitle,
            onPressed: () => showSupportSheet(context),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: l.languageTitle,
            onPressed: () => context.push('/settings/language'),
          ),
          IconButton(
            icon: const Icon(Icons.lock_outline),
            tooltip: l.settingsSecurity,
            onPressed: () => context.push('/settings/security'),
          ),
        ],
      ),
      body: projectsAsync.when(
        data: (projects) {
          if (projects.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Todavía no has creado ningún libro/universo.\n'
                  'Toca + para empezar.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: StoredImage(
                      relativePath: project.coverImagePath,
                      width: 56,
                      height: 56,
                      placeholderIcon: project.kind == ProjectKind.dnd
                          ? Icons.casino_outlined
                          : Icons.auto_stories_outlined,
                    ),
                  ),
                  title: Text(project.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.kind == ProjectKind.dnd
                            ? l.projectsKindCampaign
                            : l.projectsKindNovel,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      if (project.description != null &&
                          project.description!.isNotEmpty)
                        Text(
                          project.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'rename') {
                        _showEditDialog(context, ref, project.id, project.name, project.description);
                      } else if (value == 'delete') {
                        _confirmDelete(context, ref, project.id, project.name);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: 'rename', child: Text(l.commonEdit)),
                      PopupMenuItem(value: 'delete', child: Text(l.commonDelete)),
                    ],
                  ),
                  onTap: () => context.push('/project/${project.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEditDialog(context, ref, null, '', null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    String? projectId,
    String initialName,
    String? initialDescription,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => _ProjectDialog(
        projectId: projectId,
        initialName: initialName,
        initialDescription: initialDescription,
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String projectId, String name) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar universo'),
        content: Text(
          '¿Seguro que quieres eliminar "$name"? Se borrarán todos sus personajes, '
          'lugares, facciones y eventos. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () async {
              await ref.read(projectDaoProvider).deleteProject(projectId);
              await ref.read(imageStorageServiceProvider).deleteProjectImages(projectId);
              if (context.mounted) Navigator.of(context).pop();
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

class _ProjectDialog extends ConsumerStatefulWidget {
  const _ProjectDialog({
    required this.projectId,
    required this.initialName,
    required this.initialDescription,
  });

  final String? projectId;
  final String initialName;
  final String? initialDescription;

  @override
  ConsumerState<_ProjectDialog> createState() => _ProjectDialogState();
}

class _ProjectDialogState extends ConsumerState<_ProjectDialog> {
  late final TextEditingController _name =
      TextEditingController(text: widget.initialName);
  late final TextEditingController _description =
      TextEditingController(text: widget.initialDescription ?? '');

  String? _projectId;
  String? _coverPath;
  String _kind = ProjectKind.novel;
  String _themeId = defaultThemeId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _projectId = widget.projectId;
    _load();
  }

  Future<void> _load() async {
    if (widget.projectId != null) {
      final project = await ref.read(projectDaoProvider).getProject(widget.projectId!);
      _coverPath = project.coverImagePath;
      _kind = project.kind;
      _themeId = project.themeId;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _name.text.trim();
    if (name.isEmpty) return;
    final description =
        _description.text.trim().isEmpty ? null : _description.text.trim();
    final dao = ref.read(projectDaoProvider);

    if (_projectId == null) {
      final id = await dao.createProject(
        name: name,
        description: description,
        kind: _kind,
      );
      await dao.updateProjectTheme(id: id, themeId: _themeId);
    } else {
      await dao.updateProject(
        id: _projectId!,
        name: name,
        description: description,
        coverImagePath: _coverPath,
      );
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_projectId == null ? 'Nuevo universo' : 'Editar universo'),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _name,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 16),
              Text('¿Para qué es?',
                  style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              // The kind drives which sections appear, so it is only chosen
              // at creation — switching later would strand existing data.
              if (_projectId == null)
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: ProjectKind.novel,
                      icon: Icon(Icons.auto_stories_outlined),
                      label: Text('Libro'),
                    ),
                    ButtonSegment(
                      value: ProjectKind.dnd,
                      icon: Icon(Icons.casino_outlined),
                      label: Text('Campaña'),
                    ),
                  ],
                  selected: {_kind},
                  onSelectionChanged: (s) => setState(() => _kind = s.first),
                )
              else
                Row(
                  children: [
                    Icon(_kind == ProjectKind.dnd
                        ? Icons.casino_outlined
                        : Icons.auto_stories_outlined),
                    const SizedBox(width: 8),
                    Text(_kind == ProjectKind.dnd
                        ? 'Campaña de rol'
                        : 'Libro / novela'),
                  ],
                ),
              const SizedBox(height: 4),
              Text(
                _kind == ProjectKind.dnd
                    ? 'Agrega fichas de personaje, sesiones y dados.'
                    : 'Agrega capítulos y notas de escritura.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Text('Estética', style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              SizedBox(
                height: 84,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: appThemes.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final theme = appThemes[index];
                    return _ThemeChip(
                      theme: theme,
                      selected: theme.id == _themeId,
                      onTap: () {
                        setState(() => _themeId = theme.id);
                        // Editing an existing universe applies immediately,
                        // so the change is visible while the dialog is open.
                        if (_projectId != null) {
                          ref.read(projectDaoProvider).updateProjectTheme(
                                id: _projectId!,
                                themeId: theme.id,
                              );
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _description,
                decoration: const InputDecoration(labelText: 'Descripción (opcional)'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              if (_loading)
                const Center(child: CircularProgressIndicator())
              else if (_projectId != null)
                Center(
                  child: ImageOrDrawingPicker(
                    projectId: _projectId!,
                    imagePath: _coverPath,
                    label: 'Portada',
                    onChanged: (path) {
                      setState(() => _coverPath = path);
                      ref.read(projectDaoProvider).updateProjectCover(
                            id: _projectId!,
                            coverImagePath: path,
                          );
                    },
                  ),
                )
              else
                const Text(
                  'Guarda el universo para poder elegir o dibujar su portada.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _save, child: const Text('Guardar')),
      ],
    );
  }
}

/// Compact theme swatch for the create/edit dialog, painted in its own
/// colours so the choice is visual rather than a list of names.
class _ThemeChip extends StatelessWidget {
  const _ThemeChip({
    required this.theme,
    required this.selected,
    required this.onTap,
  });

  final AppTheme theme;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme(Theme.of(context).brightness);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(theme.cornerRadius),
      child: Container(
        width: 92,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(theme.cornerRadius),
          border: Border.all(
            color: selected ? scheme.primary : scheme.outlineVariant,
            width: selected ? 3 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _dot(scheme.primary),
                _dot(scheme.secondary),
                _dot(scheme.tertiary),
              ],
            ),
            Text(
              theme.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: scheme.onSurface,
                fontFamily: theme.displayFont,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 16,
        height: 16,
        margin: const EdgeInsets.only(right: 4),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );
}
