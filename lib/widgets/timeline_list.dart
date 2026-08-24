import 'package:flutter/material.dart';

import '../data/database.dart';

/// Vertical timeline of [TimelineEvent]s.
///
/// Drag-to-reorder is only offered when the list is in manual order; while
/// it is sorted by year the position is derived, so allowing a drag would
/// promise something the next rebuild would undo.
class TimelineList extends StatelessWidget {
  const TimelineList({
    super.key,
    required this.events,
    required this.locationNames,
    required this.onTap,
    required this.onDelete,
    required this.onReorder,
    this.reorderable = true,
  });

  final List<TimelineEvent> events;
  final Map<String, String> locationNames;
  final void Function(TimelineEvent event) onTap;
  final void Function(TimelineEvent event) onDelete;
  final void Function(int oldIndex, int newIndex) onReorder;
  final bool reorderable;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'No hay eventos todavía. Crea el primero con el botón +.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    const padding = EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    if (!reorderable) {
      return ListView.builder(
        padding: padding,
        itemCount: events.length,
        itemBuilder: (context, index) => _row(context, index),
      );
    }

    return ReorderableListView.builder(
      padding: padding,
      itemCount: events.length,
      onReorderItem: onReorder,
      itemBuilder: (context, index) => _row(context, index),
    );
  }

  Widget _row(BuildContext context, int index) {
    final color = Theme.of(context).colorScheme.primary;
    final event = events[index];
    final isLast = index == events.length - 1;
    final locationName =
        event.locationId != null ? locationNames[event.locationId] : null;
    final fromChapter = event.sourceChapterId != null;

    return Padding(
      key: ValueKey(event.id),
      padding: const EdgeInsets.only(bottom: 4),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 24,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 14,
                    height: 14,
                    decoration:
                        BoxDecoration(color: color, shape: BoxShape.circle),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: color.withValues(alpha: 0.3),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  onTap: () => onTap(event),
                  title: Row(
                    children: [
                      Expanded(child: Text(event.title)),
                      if (event.year != null)
                        Chip(
                          label: Text('Año ${event.year}'),
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (fromChapter)
                        Row(
                          children: [
                            const Icon(Icons.menu_book_outlined, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              'Desde un capítulo',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      if (event.fictionalDate != null &&
                          event.fictionalDate!.isNotEmpty)
                        Text(event.fictionalDate!),
                      if (locationName != null) Text('📍 $locationName'),
                      if (event.description != null &&
                          event.description!.isNotEmpty)
                        Text(
                          event.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => onDelete(event),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
