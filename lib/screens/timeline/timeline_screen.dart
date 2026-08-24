import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/timeline_list.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key, required this.projectId});

  final String projectId;

  Future<void> _delete(BuildContext context, WidgetRef ref, TimelineEvent event) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).eventDeleteTitle),
        content: Text(L.of(context).eventDeleteNamed(event.title)),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(L.of(context).commonCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(timelineDaoProvider).deleteEvent(event.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(timelineEventsStreamProvider(projectId));
    final locationsAsync = ref.watch(locationsStreamProvider(projectId));
    final locationNames = <String, String>{
      for (final l in locationsAsync.valueOrNull ?? const <Location>[]) l.id: l.name,
    };

    final project = ref.watch(projectStreamProvider(projectId)).valueOrNull;
    final sortByYear = project?.timelineSortByYear ?? false;
    final autoChapters = project?.autoChapterTimeline ?? false;

    return Scaffold(
      body: Column(
        children: [
          _TimelineOptions(
            projectId: projectId,
            sortByYear: sortByYear,
            autoChapters: autoChapters,
          ),
          Expanded(
            child: eventsAsync.when(
              data: (events) => TimelineList(
                events: events,
                locationNames: locationNames,
                // Manual drag order is meaningless while the list is sorted
                // chronologically, so it is disabled rather than silently
                // discarded.
                reorderable: !sortByYear,
                onTap: (event) =>
                    context.push('/project/$projectId/timeline/${event.id}'),
                onDelete: (event) => _delete(context, ref, event),
                onReorder: (oldIndex, newIndex) {
                  final reordered = [...events];
                  final moved = reordered.removeAt(oldIndex);
                  reordered.insert(newIndex, moved);
                  ref
                      .read(timelineDaoProvider)
                      .reorderEvents(reordered.map((e) => e.id).toList());
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/timeline/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// The two switches that change how the timeline is built and ordered.
class _TimelineOptions extends ConsumerWidget {
  const _TimelineOptions({
    required this.projectId,
    required this.sortByYear,
    required this.autoChapters,
  });

  final String projectId;
  final bool sortByYear;
  final bool autoChapters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Column(
        children: [
          SwitchListTile(
            dense: true,
            secondary: const Icon(Icons.sort),
            title: Text(l.timelineSortByYear),
            subtitle: Text(sortByYear
                ? l.timelineSortByYearOn
                : l.timelineSortByYearOff),
            value: sortByYear,
            onChanged: (value) =>
                ref.read(projectDaoProvider).setTimelineSortByYear(projectId, value),
          ),
          SwitchListTile(
            dense: true,
            secondary: const Icon(Icons.menu_book_outlined),
            title: Text(l.timelineAutoChapters),
            subtitle: Text(autoChapters
                ? l.timelineAutoChaptersOn
                : l.timelineAutoChaptersOff),
            value: autoChapters,
            onChanged: (value) async {
              await ref
                  .read(chapterTimelineSyncProvider)
                  .setAutoSync(projectId, value);
              if (context.mounted && !value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l.timelineAutoOffNotice)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
