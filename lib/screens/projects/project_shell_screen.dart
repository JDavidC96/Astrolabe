import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/tables.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/data_providers.dart';
import '../../services/support_links.dart';

/// One entry in the project's section navigation.
///
/// Public so the navigation layout can be asserted in tests; a slug in
/// [bottomBarSlugs] with no matching entry here would throw on build.
///
/// Labels are resolved through [labelFor] at build time rather than stored,
/// so this list can stay `const` while the wording still follows the
/// chosen language.
class ProjectSection {
  const ProjectSection(this.slug, this.icon);
  final String slug;
  final IconData icon;

  /// Campaigns reuse the same data under different words: what a novelist
  /// calls a chapter, a table calls a session.
  String labelFor(L l, bool isCampaign) {
    switch (slug) {
      case 'characters':
        return l.sectionCharacters;
      case 'world':
        return l.sectionWorld;
      case 'factions':
        return l.sectionFactions;
      case 'timeline':
        return l.sectionTimeline;
      case 'chapters':
        // Named for the verb, not the container: this is where the writing
        // happens, and calling it "Chapters" is what buried it before.
        return isCampaign ? l.sectionSessions : l.sectionWrite;
      case 'notes':
        return l.sectionNotes;
      case 'items':
        return l.sectionItems;
      case 'magic':
        return l.sectionMagic;
    }
    return slug;
  }
}

const projectSections = <ProjectSection>[
  ProjectSection('chapters', Icons.edit_note),
  ProjectSection('characters', Icons.people_outline),
  ProjectSection('world', Icons.public_outlined),
  ProjectSection('factions', Icons.shield_outlined),
  ProjectSection('timeline', Icons.timeline_outlined),
  ProjectSection('notes', Icons.sticky_note_2_outlined),
  ProjectSection('items', Icons.auto_awesome_outlined),
  ProjectSection('magic', Icons.auto_fix_high_outlined),
];

/// Extra destinations that are not section lists.
class _Tool {
  const _Tool(this.path, this.icon, {this.dndOnly = false});
  final String path;
  final IconData icon;
  final bool dndOnly;

  String labelFor(L l) {
    switch (path) {
      case 'family':
        return l.toolFamilyTree;
      case 'secrets':
        return l.toolSecrets;
      case 'dice':
        return l.toolDice;
      case 'search':
        return l.commonSearch;
      case 'appearance':
        return l.toolAppearance;
      case 'backup':
        return l.toolBackup;
    }
    return path;
  }
}

const _tools = <_Tool>[
  _Tool('family', Icons.account_tree_outlined),
  _Tool('secrets', Icons.lock_outline),
  _Tool('dice', Icons.casino_outlined, dndOnly: true),
  _Tool('search', Icons.search),
  _Tool('appearance', Icons.palette_outlined),
  _Tool('backup', Icons.backup_outlined),
];

/// Sections that get a seat in the bottom bar; the rest live in the drawer
/// so the bar stays readable on a phone.
///
/// Spelled out rather than taken from the front of [projectSections]: which
/// sections deserve a permanent seat is a product decision, and letting it
/// follow drawer order silently is how writing ended up drawer-only.
const bottomBarSlugs = <String>[
  'chapters',
  'characters',
  'world',
  'factions',
];

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
    for (final section in projectSections) {
      if (location.endsWith('/${section.slug}')) return section.slug;
    }
    return projectSections.first.slug;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final projectAsync = ref.watch(projectStreamProvider(projectId));
    final isCampaign = projectAsync.valueOrNull?.kind == ProjectKind.dnd;
    final currentSlug = _currentSlug(context);
    final bottomSections = [
      for (final slug in bottomBarSlugs)
        projectSections.firstWhere((s) => s.slug == slug),
    ];
    final bottomIndex =
        bottomSections.indexWhere((s) => s.slug == currentSlug);

    return Scaffold(
      appBar: AppBar(
        title: Text(projectAsync.valueOrNull?.name ?? l.drawerUniverse),
        actions: [
          if (isCampaign)
            IconButton(
              icon: const Icon(Icons.casino_outlined),
              tooltip: l.toolDice,
              onPressed: () => context.push('/project/$projectId/dice'),
            ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: l.searchWholeUniverse,
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
              label: section.labelFor(l, isCampaign),
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
    final l = L.of(context);
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
                  projectName ?? l.drawerUniverse,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  isCampaign ? l.projectsKindCampaign : l.projectsKindNovel,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          for (final section in projectSections)
            ListTile(
              leading: Icon(section.icon),
              title: Text(section.labelFor(l, isCampaign)),
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
                title: Text(tool.labelFor(l)),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/project/$projectId/${tool.path}');
                },
              ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.coffee_outlined),
            title: Text(l.supportTitle),
            subtitle: Text(l.supportSubtitle),
            onTap: () {
              // Grab the navigator before closing the drawer: this tile's
              // own context is unmounted by the pop, so using it afterwards
              // would fail.
              final navigator = Navigator.of(context);
              navigator.pop();
              showSupportSheet(navigator.context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: Text(l.drawerMyUniverses),
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
