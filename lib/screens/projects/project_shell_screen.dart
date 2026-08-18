import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/tables.dart';
import '../../providers/data_providers.dart';
import '../../services/support_links.dart';

/// One entry in the project's section navigation.
class _Section {
  const _Section(this.slug, this.label, this.icon, {this.dndLabel});
  final String slug;
  final String label;
  final IconData icon;

  /// Alternative wording for campaigns, where the same data means something
  /// slightly different ("chapters" are "sessions").
  final String? dndLabel;

  String labelFor(bool isCampaign) =>
      isCampaign && dndLabel != null ? dndLabel! : label;
}

const _sections = <_Section>[
  _Section('characters', 'Personajes', Icons.people_outline),
  _Section('world', 'Mundo', Icons.public_outlined),
  _Section('factions', 'Facciones', Icons.shield_outlined),
  _Section('timeline', 'Línea de tiempo', Icons.timeline_outlined),
  _Section('chapters', 'Capítulos', Icons.menu_book_outlined,
      dndLabel: 'Sesiones'),
  _Section('notes', 'Notas', Icons.sticky_note_2_outlined),
  _Section('items', 'Objetos', Icons.auto_awesome_outlined),
  _Section('magic', 'Magia', Icons.auto_fix_high_outlined),
];

/// Extra destinations that are not section lists.
class _Tool {
  const _Tool(this.path, this.label, this.icon, {this.dndOnly = false});
  final String path;
  final String label;
  final IconData icon;
  final bool dndOnly;
}

const _tools = <_Tool>[
  _Tool('family', 'Árbol genealógico', Icons.account_tree_outlined),
  _Tool('secrets', 'Secretos', Icons.lock_outline),
  _Tool('dice', 'Dados', Icons.casino_outlined, dndOnly: true),
  _Tool('search', 'Buscar', Icons.search),
  _Tool('appearance', 'Apariencia', Icons.palette_outlined),
  _Tool('backup', 'Exportar / respaldar', Icons.backup_outlined),
];

/// Number of sections shown in the bottom bar; the rest live in the drawer
/// so the bar stays readable on a phone.
const _bottomBarCount = 4;

/// Wraps every section list inside a project with a shared app bar, a drawer
/// listing all sections, and a bottom bar for the most-used ones.
class ProjectShellScreen extends ConsumerWidget {
  const ProjectShellScreen({
    super.key,
    required this.projectId,
    required this.child,
  });

  final String projectId;
  final Widget child;

  String _currentSlug(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    for (final section in _sections) {
      if (location.endsWith('/${section.slug}')) return section.slug;
    }
    return _sections.first.slug;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectAsync = ref.watch(projectStreamProvider(projectId));
    final isCampaign = projectAsync.valueOrNull?.kind == ProjectKind.dnd;
    final currentSlug = _currentSlug(context);
    final bottomSections = _sections.take(_bottomBarCount).toList();
    final bottomIndex =
        bottomSections.indexWhere((s) => s.slug == currentSlug);

    return Scaffold(
      appBar: AppBar(
        title: Text(projectAsync.valueOrNull?.name ?? 'Universo'),
        actions: [
          if (isCampaign)
            IconButton(
              icon: const Icon(Icons.casino_outlined),
              tooltip: 'Dados',
              onPressed: () => context.push('/project/$projectId/dice'),
            ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar en todo el universo',
            onPressed: () => context.push('/project/$projectId/search'),
          ),
        ],
      ),
      drawer: _SectionDrawer(
        projectId: projectId,
        projectName: projectAsync.valueOrNull?.name,
        currentSlug: currentSlug,
        isCampaign: isCampaign,
      ),
      body: child,
      bottomNavigationBar: NavigationBar(
        // A section that lives only in the drawer leaves the bar unselected.
        selectedIndex: bottomIndex < 0 ? 0 : bottomIndex,
        onDestinationSelected: (index) =>
            context.go('/project/$projectId/${bottomSections[index].slug}'),
        destinations: [
          for (final section in bottomSections)
            NavigationDestination(
              icon: Icon(section.icon),
              label: section.labelFor(isCampaign),
            ),
        ],
      ),
    );
  }
}

class _SectionDrawer extends StatelessWidget {
  const _SectionDrawer({
    required this.projectId,
    required this.projectName,
    required this.currentSlug,
    required this.isCampaign,
  });

  final String projectId;
  final String? projectName;
  final String currentSlug;
  final bool isCampaign;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  projectName ?? 'Universo',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  isCampaign ? 'Campaña de rol' : 'Libro / novela',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          for (final section in _sections)
            ListTile(
              leading: Icon(section.icon),
              title: Text(section.labelFor(isCampaign)),
              selected: section.slug == currentSlug,
              onTap: () {
                Navigator.of(context).pop();
                context.go('/project/$projectId/${section.slug}');
              },
            ),
          const Divider(),
          for (final tool in _tools)
            if (!tool.dndOnly || isCampaign)
              ListTile(
                leading: Icon(tool.icon),
                title: Text(tool.label),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/project/$projectId/${tool.path}');
                },
              ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.coffee_outlined),
            title: const Text('Invítame un café'),
            subtitle: const Text('Si la app te sirve y quieres apoyarla'),
            onTap: () {
              Navigator.of(context).pop();
              openSupportLink();
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text('Mis universos'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/');
            },
          ),
        ],
      ),
    );
  }
}
