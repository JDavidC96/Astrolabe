import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';

class ChaptersListScreen extends ConsumerWidget {
  const ChaptersListScreen({super.key, required this.projectId});

  final String projectId;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(chaptersStreamProvider(projectId));

    return Scaffold(
      body: chaptersAsync.when(
        data: (chapters) {
          if (chapters.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  L.of(context).chapEmptyChapters,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ReorderableListView.builder(
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
                      if (chapter.summary != null && chapter.summary!.isNotEmpty)
                        Text(
                          chapter.summary!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (chapter.status != null && chapter.status!.isNotEmpty)
                        Text(chapter.status!),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _delete(context, ref, chapter),
                  ),
                  onTap: () =>
                      context.push('/project/$projectId/chapters/${chapter.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/chapters/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
