import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../services/text_stats.dart';

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
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  Timer? _saveTimer;
  bool _loading = true;
  bool _dirty = false;
  bool _saving = false;
  bool _focusMode = false;
  DateTime? _lastSaved;

  String _title = '';
  int? _wordGoal;

  /// How long to wait after the last keystroke before writing to disk.
  static const _autosaveDelay = Duration(milliseconds: 1200);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final chapter =
        await ref.read(chapterDaoProvider).getChapter(widget.chapterId);
    _controller.text = chapter.content ?? '';
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
    if (!_dirty || _saving) return;
    setState(() => _saving = true);
    await ref.read(chapterDaoProvider).updateChapter(
          ChaptersCompanion(
            id: Value(widget.chapterId),
            content: Value(
              _controller.text.trim().isEmpty ? null : _controller.text,
            ),
            updatedAt: Value(DateTime.now()),
          ),
        );
    if (mounted) {
      setState(() {
        _saving = false;
        _dirty = false;
        _lastSaved = DateTime.now();
      });
    }
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    // Flush pending edits; the widget is going away so this cannot setState.
    if (_dirty) {
      ref.read(chapterDaoProvider).updateChapter(
            ChaptersCompanion(
              id: Value(widget.chapterId),
              content: Value(
                _controller.text.trim().isEmpty ? null : _controller.text,
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
  void _wrapSelection(String token) {
    final value = _controller.value;
    final selection = value.selection;
    if (!selection.isValid) return;

    final selected = selection.textInside(value.text);
    final replacement = '$token$selected$token';
    final newText = value.text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
    _controller.value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(
        // Leave the caret inside the markers when there was no selection,
        // so the writer can just keep typing.
        offset: selection.start + token.length + selected.length,
      ),
    );
  }

  void _insertBlock(String block) {
    final value = _controller.value;
    final offset = value.selection.isValid
        ? value.selection.start
        : value.text.length;
    final needsLeadingBreak = offset > 0 && !value.text.substring(0, offset).endsWith('\n');
    final insertion = '${needsLeadingBreak ? '\n' : ''}$block\n';
    final newText = value.text.replaceRange(offset, offset, insertion);
    _controller.value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: offset + insertion.length),
    );
  }

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

    return Scaffold(
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
            if (!_focusMode) _toolbar(context, stats),
          ],
        ),
      ),
    );
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
                IconButton(
                  icon: const Icon(Icons.format_bold),
                  tooltip: l.editorBold,
                  onPressed: () => _wrapSelection('**'),
                ),
                IconButton(
                  icon: const Icon(Icons.format_italic),
                  tooltip: l.editorItalic,
                  onPressed: () => _wrapSelection('_'),
                ),
                IconButton(
                  icon: const Icon(Icons.title),
                  tooltip: l.editorSubheading,
                  onPressed: () => _insertBlock('## '),
                ),
                IconButton(
                  icon: const Icon(Icons.horizontal_rule),
                  tooltip: l.editorSceneBreak,
                  onPressed: () => _insertBlock('---'),
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
