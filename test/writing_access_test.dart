import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:worldbuilder/providers/core_providers.dart';
import 'package:worldbuilder/router/app_router.dart';
import 'package:worldbuilder/screens/chapters/chapter_editor_screen.dart';
import 'package:worldbuilder/screens/projects/project_shell_screen.dart';

/// Puts the editor on top of another route, so popping it is possible the
/// way it is in the real app.
Widget harness(
  AppDatabase db,
  String projectId,
  String chapterId,
  GlobalKey<NavigatorState> navKey,
) {
  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(db)],
    child: MaterialApp(
      navigatorKey: navKey,
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      locale: const Locale('es'),
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => ChapterEditorScreen(
                  projectId: projectId,
                  chapterId: chapterId,
                ),
              ),
            ),
            child: const Text('abrir'),
          ),
        ),
      ),
    ),
  );
}

void main() {
  group('reaching the writing', () {
    test('every bottom-bar seat names a section that exists', () {
      // The bar looks its sections up by slug, so a typo here would throw
      // while building the project shell rather than just mislabel a tab.
      final slugs = projectSections.map((s) => s.slug).toSet();
      for (final slug in bottomBarSlugs) {
        expect(slugs, contains(slug), reason: '"$slug" has no section');
      }
    });

    test('writing has a permanent seat, first in the bar', () {
      // The regression this guards: chapters sat fifth in the section list
      // while the bar only showed the first four, so the one screen the app
      // exists for was reachable only through the drawer.
      expect(bottomBarSlugs.first, 'chapters');
      expect(projectSections.first.slug, 'chapters');
    });

    test('opening a project lands on the writing section', () {
      expect(projectLandingSection, bottomBarSlugs.first);
    });

    test('the bar stays at four seats, and the rest remain in the drawer', () {
      expect(bottomBarSlugs, hasLength(4));
      final drawerOnly = projectSections
          .map((s) => s.slug)
          .where((slug) => !bottomBarSlugs.contains(slug));
      // Timeline gave up its seat for writing; it must still be listed.
      expect(drawerOnly, contains('timeline'));
    });

    test('the landing section is routable inside the project shell', () {
      final paths = <String>[];
      void walk(RouteBase route) {
        if (route is GoRoute) paths.add(route.path);
        route.routes.forEach(walk);
      }

      appRouter.configuration.routes.forEach(walk);
      expect(paths, contains('/project/:projectId/$projectLandingSection'));
    });
  });

  group('continue writing', () {
    late AppDatabase db;
    late String projectId;

    setUp(() async {
      db = AppDatabase.forTesting(NativeDatabase.memory());
      projectId = await db.projectDao.createProject(name: 'Universo');
    });

    tearDown(() async => db.close());

    test('offers nothing while the project has no chapters', () async {
      expect(
        await db.chapterDao.watchLastEditedChapter(projectId).first,
        isNull,
      );
    });

    test('reopens the chapter last written in, not the first one', () async {
      final first = await db.chapterDao
          .createChapter(projectId: projectId, title: 'Uno');
      final third = await db.chapterDao
          .createChapter(projectId: projectId, title: 'Tres');
      final second = await db.chapterDao
          .createChapter(projectId: projectId, title: 'Dos');

      // Every row gets an explicit stamp: creation defaults to "now", which
      // would otherwise make whichever chapter was added last look like the
      // most recently written one.
      await db.chapterDao.updateChapter(
        ChaptersCompanion(
          id: Value(first),
          updatedAt: Value(DateTime(2026, 3, 1)),
        ),
      );
      await db.chapterDao.updateChapter(
        ChaptersCompanion(
          id: Value(second),
          updatedAt: Value(DateTime(2026, 3, 2)),
        ),
      );
      // Reading order says "Uno"; the writer was working on "Tres".
      await db.chapterDao.updateChapter(
        ChaptersCompanion(
          id: Value(third),
          content: const Value('Iba por aqui'),
          updatedAt: Value(DateTime(2026, 3, 3)),
        ),
      );

      final resumed =
          await db.chapterDao.watchLastEditedChapter(projectId).first;
      expect(resumed?.title, 'Tres');
    });

    test('never crosses into another project', () async {
      final other = await db.projectDao.createProject(name: 'Otro');
      await db.chapterDao.createChapter(projectId: other, title: 'Ajeno');

      expect(
        await db.chapterDao.watchLastEditedChapter(projectId).first,
        isNull,
      );
    });
  });

  group('creating a chapter straight into the editor', () {
    late AppDatabase db;
    late String projectId;
    late String chapterId;

    setUp(() async {
      db = AppDatabase.forTesting(NativeDatabase.memory());
      projectId = await db.projectDao.createProject(name: 'Universo');
      chapterId = await db.chapterDao
          .createChapter(projectId: projectId, title: 'Capitulo 1');
    });

    tearDown(() async => db.close());

    test('a deleted chapter reads back as absent instead of throwing',
        () async {
      // The list re-reads the row after the editor closes to decide whether
      // an untouched chapter should be dropped; by then the chapter may have
      // been deleted from its own detail screen.
      await db.chapterDao.deleteChapter(chapterId);
      expect(await db.chapterDao.getChapterOrNull(chapterId), isNull);
    });

    testWidgets('closing the editor writes the text before the screen goes',
        (tester) async {
      // The cleanup of untouched chapters depends on this: if the editor
      // left its last save in flight, the list would read an empty row and
      // delete a chapter that in fact had writing in it.
      final navKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(harness(db, projectId, chapterId, navKey));
      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField).first, 'La casa cayo');
      await tester.pump();

      // Straight back out, well inside the autosave delay.
      await navKey.currentState!.maybePop();
      await tester.pumpAndSettle();

      final saved = await db.chapterDao.getChapter(chapterId);
      expect(saved.content, contains('La casa cayo'));
    });

    testWidgets('an untouched chapter is still recognised as empty',
        (tester) async {
      final navKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(harness(db, projectId, chapterId, navKey));
      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();

      await navKey.currentState!.maybePop();
      await tester.pumpAndSettle();

      final saved = await db.chapterDao.getChapter(chapterId);
      expect(saved.content, anyOf(isNull, isEmpty));
    });
  });
}
