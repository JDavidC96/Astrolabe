import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

/// Free-form tags for any entity. Typing a new tag creates it on the fly and
/// attaches it; existing tags in the project are offered as suggestions so
/// the same label doesn't get spelled three different ways.
class TagsField extends ConsumerStatefulWidget {
  const TagsField({
    super.key,
    required this.projectId,
    required this.entityType,
    required this.entityId,
  });

  final String projectId;
  final String entityType;
  final String entityId;

  @override
  ConsumerState<TagsField> createState() => _TagsFieldState();
}

class _TagsFieldState extends ConsumerState<TagsField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _addTag(String name) async {
    if (name.trim().isEmpty) return;
    final dao = ref.read(tagDaoProvider);
    final tag = await dao.ensureTag(projectId: widget.projectId, name: name);
    await dao.attachTag(
      tagId: tag.id,
      entityType: widget.entityType,
      entityId: widget.entityId,
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final attachedAsync = ref.watch(
      tagsForEntityStreamProvider((widget.entityType, widget.entityId)),
    );
    final allTagsAsync = ref.watch(tagsStreamProvider(widget.projectId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(L.of(context).tagsTitle, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        attachedAsync.when(
          data: (attached) => Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final tag in attached)
                Chip(
                  label: Text(tag.name),
                  onDeleted: () => ref.read(tagDaoProvider).detachTag(
                        tagId: tag.id,
                        entityType: widget.entityType,
                        entityId: widget.entityId,
                      ),
                ),
              if (attached.isEmpty) Text(L.of(context).tagsNone),
            ],
          ),
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: L.of(context).tagsNew,
                  hintText: L.of(context).tagsHint,
                  isDense: true,
                ),
                onSubmitted: _addTag,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _addTag(_controller.text),
            ),
          ],
        ),
        allTagsAsync.when(
          data: (all) {
            final attached = attachedAsync.valueOrNull ?? const [];
            final attachedIds = attached.map((t) => t.id).toSet();
            final suggestions =
                all.where((t) => !attachedIds.contains(t.id)).toList();
            if (suggestions.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final tag in suggestions)
                    ActionChip(
                      label: Text(tag.name),
                      avatar: const Icon(Icons.add, size: 16),
                      onPressed: () => ref.read(tagDaoProvider).attachTag(
                            tagId: tag.id,
                            entityType: widget.entityType,
                            entityId: widget.entityId,
                          ),
                    ),
                ],
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (e, st) => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
