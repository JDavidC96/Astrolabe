import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/daos/chapter_dao.dart';
import '../../providers/core_providers.dart';
import '../../services/text_stats.dart';
import '../../widgets/markup_text_field.dart';
import '../../widgets/styled_text_controller.dart';

/// Full-screen writing surface for one chapter.
///
/// Everything here serves one goal: let the writer keep typing. Saving is
/// automatic and quiet, the chrome can be hidden entirely, and the only
/// number on screen is the word count.
class ChapterEditorScreen extends ConsumerStatefulWidget {
  const ChapterEditorScreen({
    super.key,
    required this.projectId,
    required this.chapterId,
  });

  final String projectId;
  final String chapterId;

  @override
  ConsumerState<ChapterEditorScreen> createState() =>
      _ChapterEditorScreenState();
}

class _ChapterEditorScreenState extends ConsumerState<ChapterEditorScreen> {
  final _controller = StyledTextController.fromMarkdown('');
  final _focusNode = FocusNode();

  /// Held from the moment the screen opens, because the last write happens
  /// in [dispose] and `ref` is already gone by then.
  late final ChapterDao _dao;

  Timer? _saveTimer;
  bool _loading = true;
  bool _dirty = false;
  bool _saving = false;
  bool _focusMode = false;
  DateTime? _lastSaved;

  /// The most recent write, so [_flush] can wait for a save that is already
  /// in flight instead of returning while the text is still on its way to
  /// disk.
  Future<void> _queued = Future<void>.value();

  String _title = '';
  int? _wordGoal;

  /// How long to wait after the last keystroke before writing to disk.
  static const _autosaveDelay = Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
    _dao = ref.read(chapterDaoProvider);
    _load();
  }

  Future<void> _load() async {
    final chapter = await _dao.getChapter(widget.chapterId);
    _controller.setMarkdown(chapter.content ?? '');
    _title = chapter.title;
    _wordGoal = chapter.wordGoal;
    _controller.addListener(_onChanged);
    if (mounted) setState(() => _loading = false);
  }

  void _onChanged() {
    if (!_dirty) setState(() => _dirty = true);
    _saveTimer?.cancel();
    _saveTimer = Timer(_autosaveDelay, _save);
    // Keep the word count live even between saves.
    setState(() {});
  }

  Future<void> _save() async {
    if (!_dirty) return;
    // Cleared up front, and the text snapshotted with it: a keystroke that
    // lands while this write is in flight has to re-dirty the screen, or it
    // would sit unsaved until the next one.
    _dirty = false;
    final markdown =
        _controller.text.trim().isEmpty ? null : _controller.toMarkdown();
    if (mounted) setState(() => _saving = true);

    final write = _dao.updateChapter(
      ChaptersCompanion(
        id: Value(widget.chapterId),
        content: Value(markdown),
        updatedAt: Value(DateTime.now()),
      ),
    );
    _queued = write;
    await write;

    if (mounted) {
      setState(() {
        _saving = false;
        _lastSaved = DateTime.now();
      });
    }
  }

  /// Writes anything pending and only returns once it is on disk.
  ///
  /// Callers leaving the screen depend on this: the chapter list reads the
  /// row the moment the editor closes, and a fire-and-forget save would let
  /// it see an empty chapter that in fact has text in it.
  Future<void> _flush() async {
    _saveTimer?.cancel();
    await _save();
    await _queued;
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    // Flush pending edits; the widget is going away so this cannot setState.
    if (_dirty) {
      _dao.updateChapter(
            ChaptersCompanion(
              id: Value(widget.chapterId),
              content: Value(
                _controller.text.trim().isEmpty
                    ? null
                    : _controller.toMarkdown(),
              ),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Wraps the selection in [token], or inserts the pair at the caret.
  Future<void> _editGoal() async {
    final controller =
        TextEditingController(text: _wordGoal?.toString() ?? '');
    final result = await showDialog<int?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).editorGoalTitle),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: L.of(context).editorGoalLabel,
            hintText: 'ej. 2000',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(-1),
            child: Text(L.of(context).editorGoalRemove),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(
              int.tryParse(controller.text.trim()) ?? -1,
            ),
            child: Text(L.of(context).commonSave),
          ),
        ],
      ),
    );
    controller.dispose();
    if (result == null) return;

    final goal = result <= 0 ? null : result;
    setState(() => _wordGoal = goal);
    await ref.read(chapterDaoProvider).updateChapter(
          ChaptersCompanion(
            id: Value(widget.chapterId),
            wordGoal: Value(goal),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final stats = TextStats.of(_controller.text);
    final theme = Theme.of(context);
    final l = L.of(context);

    final scaffold = Scaffold(
      appBar: _focusMode
          ? null
          : AppBar(
              title: Text(_title, overflow: TextOverflow.ellipsis),
              actions: [
                _SaveIndicator(
                  saving: _saving,
                  dirty: _dirty,
                  lastSaved: _lastSaved,
                ),
                IconButton(
                  icon: const Icon(Icons.tune),
                  tooltip: l.chapDetails,
                  onPressed: _openDetails,
                ),
                IconButton(
                  icon: const Icon(Icons.center_focus_strong_outlined),
                  tooltip: l.editorFocusMode,
                  onPressed: () => setState(() => _focusMode = true),
                ),
              ],
            ),
      body: SafeArea(
        child: Column(
          children: [
            if (_focusMode)
              // A single unobtrusive way back out of focus mode.
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close_fullscreen),
                  tooltip: l.editorExitFocus,
                  onPressed: () => setState(() => _focusMode = false),
                ),
              ),
            Expanded(
              child: CallbackShortcuts(
                bindings: styleShortcuts(_controller),
                child: Center(
                child: ConstrainedBox(
                  // A comfortable measure; full-width prose on a wide screen
                  // is tiring to read.
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      contextMenuBuilder: (context, editableState) =>
                          styleSelectionMenu(_controller, editableState, l),
                      autofocus: true,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 17,
                        height: 1.6,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: false,
                        hintText: l.editorHint,
                      ),
                    ),
                  ),
                ),
              ),
              ),
            ),
            if (!_focusMode) _toolbar(context, stats),
          ],
        ),
      ),
    );

    return PopScope(
      // Nothing pending means the normal pop is fine; otherwise the text is
      // written first and the pop happens afterwards, so whoever opened the
      // editor reads a row that already has the writing in it.
      canPop: !_dirty && !_saving,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _flush();
        // `context` here is build's own parameter, so it is the one that has
        // to be checked rather than the State's `mounted`.
        if (context.mounted) Navigator.of(context).pop();
      },
      child: scaffold,
    );
  }

  /// Opens the chapter's own metadata (title, summary, status, year).
  ///
  /// The relationship used to run the other way, with the text buried inside
  /// the form; the writing is the destination now and the form is a detour
  /// off it.
  Future<void> _openDetails() async {
    // The detail screen shows a word count read from the stored row.
    await _flush();
    if (!mounted) return;
    await context.push(
      '/project/${widget.projectId}/chapters/${widget.chapterId}',
    );
    if (!mounted) return;

    final chapter = await _dao.getChapterOrNull(widget.chapterId);
    if (!mounted) return;
    if (chapter == null) {
      // Deleted from its own detail screen, so there is nothing to edit.
      context.pop();
      return;
    }
    setState(() {
      _title = chapter.title;
      _wordGoal = chapter.wordGoal;
    });
  }

  Widget _toolbar(BuildContext context, TextStats stats) {
    final theme = Theme.of(context);
    final l = L.of(context);
    final goal = _wordGoal;
    final progress = goal == null || goal == 0
        ? null
        : (stats.words / goal).clamp(0.0, 1.0);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (progress != null)
            LinearProgressIndicator(value: progress, minHeight: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                StyleButtons(controller: _controller),
                IconButton(
                  icon: const Icon(Icons.help_outline),
                  tooltip: l.helpEditorButton,
                  onPressed: () => context.push('/help/editor'),
                ),
                const Spacer(),
                InkWell(
                  onTap: _editGoal,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 6),
                    child: Text(
                      goal == null
                          ? l.chapWordCount(stats.words)
                          : '${stats.words} / $goal',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Quiet feedback that work is safe, without interrupting typing.
class _SaveIndicator extends StatelessWidget {
  const _SaveIndicator({
    required this.saving,
    required this.dirty,
    required this.lastSaved,
  });

  final bool saving;
  final bool dirty;
  final DateTime? lastSaved;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelSmall;

    if (saving) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 6),
            Text(L.of(context).editorSaving, style: style),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Text(
          dirty
              ? L.of(context).editorUnsaved
              : (lastSaved == null ? '' : L.of(context).editorSaved),
          style: style,
        ),
      ),
    );
  }
}
