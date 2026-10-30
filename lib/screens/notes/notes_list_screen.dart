import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/formatted_text.dart';
import '../../widgets/markup_text_field.dart';
import '../../widgets/styled_text_controller.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({super.key, required this.projectId});

  final String projectId;

  Future<void> _delete(BuildContext context, WidgetRef ref, Note note) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).noteDeleteTitle),
        content: Text(L.of(context).noteDeleteNamed(note.title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(noteDaoProvider).deleteNote(note.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(notesStreamProvider(projectId));

    return Scaffold(
      body: notesAsync.when(
        data: (notes) {
          if (notes.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  L.of(context).noteEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.sticky_note_2_outlined),
                  title: Text(note.title),
                  subtitle: note.content != null && note.content!.isNotEmpty
                      ? FormattedText(
                          note.content!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _delete(context, ref, note),
                  ),
                  onTap: () => _showEditor(context, ref, note),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEditor(context, ref, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditor(BuildContext context, WidgetRef ref, Note? note) {
    showDialog<void>(
      context: context,
      builder: (context) => _NoteDialog(projectId: projectId, note: note),
    );
  }
}

class _NoteDialog extends ConsumerStatefulWidget {
  const _NoteDialog({required this.projectId, this.note});

  final String projectId;
  final Note? note;

  @override
  ConsumerState<_NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends ConsumerState<_NoteDialog> {
  late final _title = TextEditingController(text: widget.note?.title ?? '');
  late final _content =
      StyledTextController.fromMarkdown(widget.note?.content ?? '');

  @override
  void dispose() {
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) return;
    final content =
        _content.text.trim().isEmpty ? null : _content.toMarkdown();
    final dao = ref.read(noteDaoProvider);

    var id = widget.note?.id;
    id ??= await dao.createNote(projectId: widget.projectId, title: title);

    await dao.updateNote(
      NotesCompanion(
        id: Value(id),
        title: Value(title),
        content: Value(content),
        updatedAt: Value(DateTime.now()),
      ),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Expanded(
            child: Text(widget.note == null
                ? L.of(context).noteNew
                : L.of(context).noteEdit),
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            tooltip: L.of(context).helpEditorButton,
            onPressed: () => context.push('/help/editor'),
          ),
        ],
      ),
      content: SizedBox(
        width: 480,
        // Scrolls so a phone with the keyboard up still fits the whole
        // editor, the way the other dialogs in the app do.
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _title,
                autofocus: true,
                decoration: InputDecoration(labelText: L.of(context).noteTitle),
              ),
              const SizedBox(height: 12),
              MarkupTextField(
                controller: _content,
                label: L.of(context).noteContent,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(L.of(context).commonCancel),
        ),
        FilledButton(onPressed: _save, child: Text(L.of(context).commonSave)),
      ],
    );
  }
}
