import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/data/database.dart';
import 'package:worldbuilder/l10n/app_localizations.dart';
import 'package:worldbuilder/providers/core_providers.dart';
import 'package:worldbuilder/screens/chapters/chapter_editor_screen.dart';

Widget harness(AppDatabase db, String projectId, String chapterId) {
  return ProviderScope(
    overrides: [databaseProvider.overrideWithValue(db)],
    child: MaterialApp(
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
      locale: const Locale('es'),
      home: ChapterEditorScreen(projectId: projectId, chapterId: chapterId),
    ),
  );
}

/// Writes a phrase and puts its last two words in bold, the way a writer
/// would with the toolbar.
Future<void> writeAndBold(WidgetTester tester) async {
  await tester.enterText(find.byType(TextField).first, 'La Casa Valdris');
  await tester.pump();

  final controller = tester.widget<TextField>(find.byType(TextField).first).controller!;
  controller.selection = const TextSelection(baseOffset: 3, extentOffset: 15);
  await tester.pump();

  await tester.tap(find.byIcon(Icons.format_bold));
  await tester.pump();
}

void main() {
  late AppDatabase db;
  late String projectId;
  late String chapterId;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    projectId = await db.projectDao.createProject(name: 'Universo');
    chapterId =
        await db.chapterDao.createChapter(projectId: projectId, title: 'Uno');
  });

  tearDown(() async => db.close());

  mainLineStyles();

  testWidgets('the autosave keeps the styling', (tester) async {
    await tester.pumpWidget(harness(db, projectId, chapterId));
    await tester.pumpAndSettle();

    await writeAndBold(tester);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    final saved = await db.chapterDao.getChapter(chapterId);
    expect(saved.content, 'La **Casa Valdris**');
  });

  testWidgets('leaving the screen writes what the autosave had not',
      (tester) async {
    await tester.pumpWidget(harness(db, projectId, chapterId));
    await tester.pumpAndSettle();

    await writeAndBold(tester);

    // Straight out of the screen, before the autosave timer comes round.
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();

    final saved = await db.chapterDao.getChapter(chapterId);
    expect(saved.content, 'La **Casa Valdris**',
        reason: 'the last edits must survive closing the editor');
  });

  testWidgets('reopening shows the words styled, with no markers in sight',
      (tester) async {
    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(chapterId),
      content: const Value('La **Casa Valdris** cayo'),
    ));

    await tester.pumpWidget(harness(db, projectId, chapterId));
    await tester.pumpAndSettle();

    final controller =
        tester.widget<TextField>(find.byType(TextField).first).controller!;
    expect(controller.text, 'La Casa Valdris cayo');

    final span = controller.buildTextSpan(
      context: tester.element(find.byType(TextField).first),
      style: const TextStyle(),
      withComposing: false,
    );
    final bolded = <String>[];
    span.visitChildren((child) {
      if (child is TextSpan &&
          child.text != null &&
          child.style?.fontWeight == FontWeight.bold) {
        bolded.add(child.text!);
      }
      return true;
    });
    expect(bolded, ['Casa Valdris']);
  });
}

/// The line styles: a heading, a quotation, a scene break.
void mainLineStyles() {
  late AppDatabase db;
  late String projectId;
  late String chapterId;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    projectId = await db.projectDao.createProject(name: 'Universo');
    chapterId =
        await db.chapterDao.createChapter(projectId: projectId, title: 'Uno');
  });

  tearDown(() async => db.close());

  Future<TextEditingController> open(WidgetTester tester) async {
    await tester.pumpWidget(harness(db, projectId, chapterId));
    await tester.pumpAndSettle();
    return tester.widget<TextField>(find.byType(TextField).first).controller!;
  }

  testWidgets('a quotation is saved and shows without its marker',
      (tester) async {
    final controller = await open(tester);

    await tester.enterText(find.byType(TextField).first, 'Estos horrores');
    await tester.pump();
    controller.selection =
        const TextSelection(baseOffset: 0, extentOffset: 14);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.format_quote));
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Stored with its marker.
    final saved = await db.chapterDao.getChapter(chapterId);
    expect(saved.content, '> Estos horrores');
    // Shown without it.
    expect(controller.text, 'Estos horrores');
  });

  testWidgets('a heading is saved and shows without its marker',
      (tester) async {
    final controller = await open(tester);

    await tester.enterText(find.byType(TextField).first, 'Capitulo uno');
    await tester.pump();
    controller.selection = const TextSelection.collapsed(offset: 4);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.title));
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    final saved = await db.chapterDao.getChapter(chapterId);
    expect(saved.content, '## Capitulo uno');
    expect(controller.text, 'Capitulo uno');
  });

  testWidgets('the scene break button drops the mark on its own line',
      (tester) async {
    final controller = await open(tester);

    await tester.enterText(find.byType(TextField).first, 'Cayo la noche.');
    await tester.pump();
    controller.selection = const TextSelection.collapsed(offset: 14);
    await tester.pump();

    await tester.tap(find.byIcon(Icons.horizontal_rule));
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    final saved = await db.chapterDao.getChapter(chapterId);
    expect(saved.content, 'Cayo la noche.\n---');
  });

  testWidgets('a heading is painted larger while it is being written',
      (tester) async {
    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(chapterId),
      content: const Value('## Capitulo uno\nCayo la noche.'),
    ));

    final controller = await open(tester);
    final span = controller.buildTextSpan(
      context: tester.element(find.byType(TextField).first),
      style: const TextStyle(fontSize: 17),
      withComposing: false,
    );

    // The line break belongs to the line it closes, so it rides along in
    // the same run.
    final sizes = <String, double?>{};
    span.visitChildren((child) {
      if (child is TextSpan && child.text != null && child.text!.isNotEmpty) {
        sizes[child.text!.trim()] = child.style?.fontSize;
      }
      return true;
    });

    expect(sizes['Capitulo uno'], greaterThan(17));
    expect(sizes['Cayo la noche.'], 17);
  });

  testWidgets('the buttons light up on the line the caret is in',
      (tester) async {
    await db.chapterDao.updateChapter(ChaptersCompanion(
      id: Value(chapterId),
      content: const Value('## Titulo\nCuerpo.'),
    ));

    final controller = await open(tester);

    IconButton headingButton() => tester.widget<IconButton>(
          find.ancestor(
            of: find.byIcon(Icons.title),
            matching: find.byType(IconButton),
          ),
        );

    controller.selection = const TextSelection.collapsed(offset: 2);
    await tester.pump();
    expect(headingButton().isSelected, isTrue);

    controller.selection = const TextSelection.collapsed(offset: 10);
    await tester.pump();
    expect(headingButton().isSelected, isFalse);
  });
}
