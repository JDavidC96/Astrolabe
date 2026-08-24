import 'dart:typed_data';

import 'package:go_router/go_router.dart';

import '../screens/projects/projects_list_screen.dart';
import '../screens/projects/project_shell_screen.dart';
import '../screens/characters/characters_list_screen.dart';
import '../screens/characters/character_detail_screen.dart';
import '../screens/world/world_tree_screen.dart';
import '../screens/world/location_detail_screen.dart';
import '../screens/world/map_view_screen.dart';
import '../screens/factions/factions_list_screen.dart';
import '../screens/factions/faction_detail_screen.dart';
import '../screens/timeline/timeline_screen.dart';
import '../screens/timeline/timeline_event_detail_screen.dart';
import '../screens/chapters/chapters_list_screen.dart';
import '../screens/chapters/chapter_detail_screen.dart';
import '../screens/chapters/chapter_editor_screen.dart';
import '../screens/notes/notes_list_screen.dart';
import '../screens/items/items_list_screen.dart';
import '../screens/items/item_detail_screen.dart';
import '../screens/magic/magic_list_screen.dart';
import '../screens/magic/magic_detail_screen.dart';
import '../screens/search/global_search_screen.dart';
import '../screens/backup/backup_screen.dart';
import '../screens/appearance/appearance_screen.dart';
import '../screens/family/family_tree_screen.dart';
import '../screens/secrets/secrets_screen.dart';
import '../screens/dice/dice_screen.dart';
import '../screens/settings/language_screen.dart';
import '../screens/settings/security_settings_screen.dart';
import '../screens/drawing/drawing_screen.dart';

typedef DrawingSaveCallback = void Function(Uint8List pngBytes);

/// Detail/edit screens are deliberately declared *outside* the [ShellRoute]:
/// they carry their own app bar and save/delete actions, so inheriting the
/// project shell would stack a second app bar and show the section navigation
/// on top of a form the user is editing.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProjectsListScreen(),
    ),
    GoRoute(
      path: '/settings/security',
      builder: (context, state) => const SecuritySettingsScreen(),
    ),
    GoRoute(
      path: '/settings/language',
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: '/drawing',
      builder: (context, state) => DrawingScreen(
        onSave: state.extra as DrawingSaveCallback,
      ),
    ),
    GoRoute(
      path: '/project/:projectId',
      redirect: (context, state) =>
          '/project/${state.pathParameters['projectId']}/characters',
    ),

    // --- Full-screen detail routes (declared before the shell) ---
    GoRoute(
      path: '/project/:projectId/characters/new',
      builder: (context, state) => CharacterDetailScreen(
        projectId: state.pathParameters['projectId']!,
        characterId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/characters/:characterId',
      builder: (context, state) => CharacterDetailScreen(
        projectId: state.pathParameters['projectId']!,
        characterId: state.pathParameters['characterId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/world/new',
      builder: (context, state) => LocationDetailScreen(
        projectId: state.pathParameters['projectId']!,
        locationId: null,
        parentLocationId: state.uri.queryParameters['parentId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/map/:locationId',
      builder: (context, state) => MapViewScreen(
        projectId: state.pathParameters['projectId']!,
        locationId: state.pathParameters['locationId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/world/:locationId',
      builder: (context, state) => LocationDetailScreen(
        projectId: state.pathParameters['projectId']!,
        locationId: state.pathParameters['locationId'],
        parentLocationId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/factions/new',
      builder: (context, state) => FactionDetailScreen(
        projectId: state.pathParameters['projectId']!,
        factionId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/factions/:factionId',
      builder: (context, state) => FactionDetailScreen(
        projectId: state.pathParameters['projectId']!,
        factionId: state.pathParameters['factionId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/timeline/new',
      builder: (context, state) => TimelineEventDetailScreen(
        projectId: state.pathParameters['projectId']!,
        eventId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/timeline/:eventId',
      builder: (context, state) => TimelineEventDetailScreen(
        projectId: state.pathParameters['projectId']!,
        eventId: state.pathParameters['eventId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/chapters/new',
      builder: (context, state) => ChapterDetailScreen(
        projectId: state.pathParameters['projectId']!,
        chapterId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/write/:chapterId',
      builder: (context, state) => ChapterEditorScreen(
        projectId: state.pathParameters['projectId']!,
        chapterId: state.pathParameters['chapterId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/chapters/:chapterId',
      builder: (context, state) => ChapterDetailScreen(
        projectId: state.pathParameters['projectId']!,
        chapterId: state.pathParameters['chapterId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/items/new',
      builder: (context, state) => ItemDetailScreen(
        projectId: state.pathParameters['projectId']!,
        itemId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/items/:itemId',
      builder: (context, state) => ItemDetailScreen(
        projectId: state.pathParameters['projectId']!,
        itemId: state.pathParameters['itemId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/magic/new',
      builder: (context, state) => MagicDetailScreen(
        projectId: state.pathParameters['projectId']!,
        magicId: null,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/magic/:magicId',
      builder: (context, state) => MagicDetailScreen(
        projectId: state.pathParameters['projectId']!,
        magicId: state.pathParameters['magicId'],
      ),
    ),
    GoRoute(
      path: '/project/:projectId/search',
      builder: (context, state) => GlobalSearchScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/backup',
      builder: (context, state) => BackupScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/family',
      builder: (context, state) => FamilyTreeScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/secrets',
      builder: (context, state) => SecretsScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/dice',
      builder: (context, state) => DiceScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),
    GoRoute(
      path: '/project/:projectId/appearance',
      builder: (context, state) => AppearanceScreen(
        projectId: state.pathParameters['projectId']!,
      ),
    ),

    // --- Section lists, wrapped in the project shell ---
    ShellRoute(
      builder: (context, state, child) {
        final projectId = state.pathParameters['projectId']!;
        return ProjectShellScreen(projectId: projectId, child: child);
      },
      routes: [
        GoRoute(
          path: '/project/:projectId/characters',
          builder: (context, state) => CharactersListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/world',
          builder: (context, state) => WorldTreeScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/factions',
          builder: (context, state) => FactionsListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/timeline',
          builder: (context, state) => TimelineScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/chapters',
          builder: (context, state) => ChaptersListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/notes',
          builder: (context, state) => NotesListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/items',
          builder: (context, state) => ItemsListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
        GoRoute(
          path: '/project/:projectId/magic',
          builder: (context, state) => MagicListScreen(
            projectId: state.pathParameters['projectId']!,
          ),
        ),
      ],
    ),
  ],
);
