import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

/// User-defined "label: value" pairs on any entity, for anything the built-in
/// fields don't cover — a game system's stats, a language's phonology, notes
/// only this project cares about.
class CustomFieldsSection extends ConsumerWidget {
  const CustomFieldsSection({
    super.key,
    required this.projectId,
    required this.entityType,
    required this.entityId,
  });

  final String projectId;
  final String entityType;
  final String entityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldsAsync =
        ref.watch(customFieldsStreamProvider((entityType, entityId)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(L.of(context).customFieldsTitle,
                style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () => _showAddDialog(context, ref),
              icon: const Icon(Icons.add),
              label: Text(L.of(context).commonAdd),
            ),
          ],
        ),
        fieldsAsync.when(
          data: (fields) {
            if (fields.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  L.of(context).customFieldsEmpty,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              );
            }
            return Column(
              children: [
                for (final field in fields)
                  _CustomFieldRow(key: ValueKey(field.id), fieldId: field.id,
                      label: field.label, value: field.value),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final labelController = TextEditingController();
    final valueController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).customFieldNew),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: L.of(context).customFieldName,
                hintText: L.of(context).customFieldNameHint,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: L.of(context).customFieldValue),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            onPressed: () async {
              final label = labelController.text.trim();
              if (label.isEmpty) return;
              await ref.read(customFieldDaoProvider).addField(
                    projectId: projectId,
                    entityType: entityType,
                    entityId: entityId,
                    label: label,
                    value: valueController.text.trim().isEmpty
                        ? null
                        : valueController.text.trim(),
                  );
              if (context.mounted) Navigator.of(context).pop();
            },
            child: Text(L.of(context).commonAdd),
          ),
        ],
      ),
    );
  }
}

/// A single field row that writes its value back on edit.
class _CustomFieldRow extends ConsumerStatefulWidget {
  const _CustomFieldRow({
    super.key,
    required this.fieldId,
    required this.label,
    required this.value,
  });

  final String fieldId;
  final String label;
  final String? value;

  @override
  ConsumerState<_CustomFieldRow> createState() => _CustomFieldRowState();
}

class _CustomFieldRowState extends ConsumerState<_CustomFieldRow> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.value ?? '');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: widget.label,
                isDense: true,
              ),
              // Persist when the user leaves the field rather than on every
              // keystroke.
              onTapOutside: (_) => _persist(),
              onSubmitted: (_) => _persist(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: L.of(context).customFieldRemove,
            onPressed: () =>
                ref.read(customFieldDaoProvider).deleteField(widget.fieldId),
          ),
        ],
      ),
    );
  }

  void _persist() {
    final value = _controller.text.trim();
    ref.read(customFieldDaoProvider).updateField(
          id: widget.fieldId,
          value: value.isEmpty ? null : value,
        );
  }
}
