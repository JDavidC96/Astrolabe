import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/tables.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';

/// The list of chapters, and the way into the writing itself.
///
/// Tapping a chapter opens the editor rather than the metadata form: the
/// text is what gets worked on every day, while the title, summary and year
/// are set once and then left alone.
class ChaptersListScreen extends ConsumerWidget {
  const ChaptersListScreen({super.key, required this.projectId});

  final String projectId;

  /// Below this many chapters the shortcut only repeats what the list right
  /// underneath it already shows.
  static const _resumeThreshold = 2;

  void _write(BuildContext context, String chapterId) {
    context.push('/project/$projectId/write/$chapterId');
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, Chapter chapter) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).chapDeleteTitle),
        content: Text(L.of(context).chapDeleteNamed(chapter.title)),
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
    await ref.read(chapterDaoProvider).deleteChapter(chapter.id);
  }

  /// Creates a chapter and drops straight into the editor.
  ///
  /// The old flow opened an empty form and refused to let anyone write until
  /// it had been saved once, which put a filing step in front of the only
  /// thing the button is for.
  Future<void> _createAndWrite(
    BuildContext context,
    WidgetRef ref,
    int existingCount,
    bool isCampaign,
  ) async {
    final l = L.of(context);
    final defaultTitle = isCampaign
        ? l.chapDefaultSessionTitle(existingCount + 1)
        : l.chapDefaultChapterTitle(existingCount + 1);

    final dao = ref.read(chapterDaoProvider);
    final id = await dao.createChapter(
      projectId: projectId,
      title: defaultTitle,
    );
    if (!context.mounted) return;
    await context.push('/project/$projectId/write/$id');

    // A mistaken tap on + should not leave an empty chapter behind, so the
    // row goes away again unless something was actually entered. The editor
    // flushes its autosave before it closes, so what is read back here is
    // the final state rather than a half-finished write.
    final saved = await dao.getChapterOrNull(id);
    if (saved == null) return;
    final untouched = (saved.content == null || saved.content!.trim().isEmpty) &&
        saved.title == defaultTitle &&
        (saved.summary == null || saved.summary!.isEmpty);
    if (untouched) await dao.deleteChapter(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final chaptersAsync = ref.watch(chaptersStreamProvider(projectId));
    final isCampaign = ref.watch(projectStreamProvider(projectId)).valueOrNull?.kind ==
        ProjectKind.dnd;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 44,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: l.pdfButton,
            onPressed: () => context.push('/project/$projectId/export/pdf'),
          ),
        ],
      ),
      body: chaptersAsync.when(
        data: (chapters) {
          if (chapters.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l.chapEmptyChapters,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return Column(
            children: [
              if (chapters.length >= _resumeThreshold)
                _ResumeCard(projectId: projectId, onWrite: _write),
              Expanded(
                child: ReorderableListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: chapters.length,
                  onReorderItem: (oldIndex, newIndex) {
                    final reordered = [...chapters];
                    final moved = reordered.removeAt(oldIndex);
                    reordered.insert(newIndex, moved);
                    ref
                        .read(chapterDaoProvider)
                        .reorderChapters(reordered.map((c) => c.id).toList());
                  },
                  itemBuilder: (context, index) {
                    final chapter = chapters[index];
                    return Card(
                      key: ValueKey(chapter.id),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(chapter.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (chapter.summary != null &&
                                chapter.summary!.isNotEmpty)
                              Text(
                                chapter.summary!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            if (chapter.status != null &&
                                chapter.status!.isNotEmpty)
                              Text(chapter.status!),
                          ],
                        ),
                        // Delete used to sit here as a bare icon, one slip
                        // away from the row people tap all day.
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'details') {
                              context.push(
                                '/project/$projectId/chapters/${chapter.id}',
                              );
                            } else if (value == 'delete') {
                              _delete(context, ref, chapter);
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'details',
                              child: Text(l.chapDetails),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text(l.commonDelete),
                            ),
                          ],
                        ),
                        onTap: () => _write(context, chapter.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createAndWrite(
          context,
          ref,
          chaptersAsync.valueOrNull?.length ?? 0,
          isCampaign,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Reopens whatever was last being written, without hunting for it in a list
/// that is forty chapters long by the end of a book.
class _ResumeCard extends ConsumerWidget {
  const _ResumeCard({required this.projectId, required this.onWrite});

  final String projectId;
  final void Function(BuildContext, String) onWrite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapter = ref.watch(lastEditedChapterProvider(projectId)).valueOrNull;
    if (chapter == null) return const SizedBox.shrink();

    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Card(
        color: scheme.primaryContainer,
        margin: EdgeInsets.zero,
        child: ListTile(
          leading: Icon(Icons.edit_note, color: scheme.onPrimaryContainer),
          title: Text(
            L.of(context).chapResume,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: scheme.onPrimaryContainer,
                ),
          ),
          subtitle: Text(
            chapter.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: scheme.onPrimaryContainer),
          ),
          trailing: Icon(Icons.chevron_right, color: scheme.onPrimaryContainer),
          onTap: () => onWrite(context, chapter.id),
        ),
      ),
    );
  }
}
