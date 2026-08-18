import 'package:flutter/material.dart';
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
        title: const Text('Eliminar evento'),
        content: Text('¿Eliminar "${event.title}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Eliminar'),
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

    return Scaffold(
      body: eventsAsync.when(
        data: (events) => TimelineList(
          events: events,
          locationNames: locationNames,
          onTap: (event) => context.push('/project/$projectId/timeline/${event.id}'),
          onDelete: (event) => _delete(context, ref, event),
          onReorder: (oldIndex, newIndex) {
            final reordered = [...events];
            final moved = reordered.removeAt(oldIndex);
            reordered.insert(newIndex, moved);
            ref.read(timelineDaoProvider).reorderEvents(reordered.map((e) => e.id).toList());
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/timeline/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
