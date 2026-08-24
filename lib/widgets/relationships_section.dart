import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/daos/relationship_dao.dart';
import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

/// Relationship kinds, stored by their Spanish key so existing data keeps
/// working, but shown through [relationshipLabel] in the reader's language.
const relationshipTypes = <String>[
  'Familiar',
  'Hermanos',
  'Amistad',
  'Rivalidad',
  'Enemistad',
  'Romance',
  'Mentor',
  'Aprendiz',
  'Aliados',
  'Pacto',
  'Otro',
];

String relationshipLabel(L l, String key) {
  switch (key) {
    case 'Familiar':
      return l.relKindFamily;
    case 'Hermanos':
      return l.relKindSiblings;
    case 'Amistad':
      return l.relKindFriendship;
    case 'Rivalidad':
      return l.relKindRivalry;
    case 'Enemistad':
      return l.relKindEnmity;
    case 'Romance':
      return l.relKindRomance;
    case 'Mentor':
      return l.relKindMentor;
    case 'Aprendiz':
      return l.relKindApprentice;
    case 'Aliados':
      return l.relKindAllies;
    case 'Pacto':
      return l.relKindPact;
    case 'Otro':
      return l.relKindOther;
  }
  // A custom kind the user typed themselves; show it verbatim.
  return key;
}

class RelationshipsSection extends ConsumerWidget {
  const RelationshipsSection({
    super.key,
    required this.projectId,
    required this.characterId,
  });

  final String projectId;
  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final relationshipsAsync =
        ref.watch(relationshipsForCharacterStreamProvider(characterId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l.relTitle, style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () => _showEditor(context, ref, null),
              icon: const Icon(Icons.add),
              label: Text(l.commonAdd),
            ),
          ],
        ),
        relationshipsAsync.when(
          data: (relationships) {
            if (relationships.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(l.relEmpty),
              );
            }
            return Column(
              children: [
                for (final r in relationships)
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(relationshipLabel(
                          l, r.relationship.relationshipType)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r.others.isEmpty
                              ? l.relNoOtherPeople
                              : r.others.map(_displayName).join(', ')),
                          if (r.relationship.description?.isNotEmpty == true)
                            Text(r.relationship.description!),
                        ],
                      ),
                      onTap: () => _showEditor(context, ref, r),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => ref
                            .read(relationshipDaoProvider)
                            .deleteRelationship(r.relationship.id),
                      ),
                    ),
                  ),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (e, st) => Text('Error: $e'),
        ),
      ],
    );
  }

  void _showEditor(
    BuildContext context,
    WidgetRef ref,
    RelationshipWithMembers? existing,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => _RelationshipDialog(
        projectId: projectId,
        characterId: characterId,
        existing: existing,
      ),
    );
  }
}

String _displayName(Character c) =>
    '${c.firstName} ${c.lastName ?? ''}'.trim();

class _RelationshipDialog extends ConsumerStatefulWidget {
  const _RelationshipDialog({
    required this.projectId,
    required this.characterId,
    this.existing,
  });

  final String projectId;
  final String characterId;
  final RelationshipWithMembers? existing;

  @override
  ConsumerState<_RelationshipDialog> createState() => _RelationshipDialogState();
}

class _RelationshipDialogState extends ConsumerState<_RelationshipDialog> {
  /// Members other than the character whose screen we're on; that character
  /// is always part of the relationship and can't be removed here.
  late Set<String> _selectedIds;
  late String _relationshipType;
  final _customTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    _selectedIds = existing?.others.map((c) => c.id).toSet() ?? {};
    final type = existing?.relationship.relationshipType;
    if (type != null && !relationshipTypes.contains(type)) {
      _relationshipType = 'Otro';
      _customTypeController.text = type;
    } else {
      _relationshipType = type ?? relationshipTypes.first;
    }
    _descriptionController.text = existing?.relationship.description ?? '';
  }

  @override
  void dispose() {
    _customTypeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final type = _relationshipType == 'Otro'
        ? (_customTypeController.text.trim().isEmpty
            ? 'Otro'
            : _customTypeController.text.trim())
        : _relationshipType;
    final description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();
    // The current character is always a member, plus everyone selected.
    final memberIds = {widget.characterId, ..._selectedIds}.toList();

    final dao = ref.read(relationshipDaoProvider);
    if (widget.existing == null) {
      await dao.createRelationship(
        projectId: widget.projectId,
        relationshipType: type,
        description: description,
        characterIds: memberIds,
      );
    } else {
      await dao.updateRelationship(
        id: widget.existing!.relationship.id,
        relationshipType: type,
        description: description,
        characterIds: memberIds,
      );
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));

    return AlertDialog(
      title: Text(widget.existing == null ? l.relNew : l.relEdit),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                initialValue: _relationshipType,
                decoration: InputDecoration(labelText: l.relType),
                items: [
                  for (final t in relationshipTypes)
                    DropdownMenuItem(
                        value: t, child: Text(relationshipLabel(l, t))),
                ],
                onChanged: (v) => setState(() => _relationshipType = v!),
              ),
              if (_relationshipType == 'Otro') ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _customTypeController,
                  decoration: InputDecoration(labelText: l.relTypeOther),
                ),
              ],
              const SizedBox(height: 16),
              Text(l.relPeople,
                  style: Theme.of(context).textTheme.labelLarge),
              Text(l.relPeopleHint,
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 4),
              charactersAsync.when(
                data: (characters) {
                  final options =
                      characters.where((c) => c.id != widget.characterId).toList();
                  if (options.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(l.relNoOthers),
                    );
                  }
                  return Column(
                    children: [
                      for (final c in options)
                        CheckboxListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(_displayName(c)),
                          value: _selectedIds.contains(c.id),
                          onChanged: (checked) => setState(() {
                            if (checked == true) {
                              _selectedIds.add(c.id);
                            } else {
                              _selectedIds.remove(c.id);
                            }
                          }),
                        ),
                    ],
                  );
                },
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: LinearProgressIndicator(),
                ),
                error: (e, st) => Text('Error: $e'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: l.relDescription),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.commonCancel),
        ),
        FilledButton(
          onPressed: _selectedIds.isEmpty ? null : _save,
          child: Text(l.commonSave),
        ),
      ],
    );
  }
}
