import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/daos/relationship_dao.dart';
import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

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
    final relationshipsAsync =
        ref.watch(relationshipsForCharacterStreamProvider(characterId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Relaciones', style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () => _showEditor(context, ref, null),
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
            ),
          ],
        ),
        relationshipsAsync.when(
          data: (relationships) {
            if (relationships.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text('Sin relaciones registradas todavía.'),
              );
            }
            return Column(
              children: [
                for (final r in relationships)
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(r.relationship.relationshipType),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r.others.isEmpty
                              ? 'Sin otros personajes'
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
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));

    return AlertDialog(
      title: Text(widget.existing == null ? 'Nueva relación' : 'Editar relación'),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                initialValue: _relationshipType,
                decoration: const InputDecoration(labelText: 'Tipo de relación'),
                items: [
                  for (final t in relationshipTypes)
                    DropdownMenuItem(value: t, child: Text(t)),
                ],
                onChanged: (v) => setState(() => _relationshipType = v!),
              ),
              if (_relationshipType == 'Otro') ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _customTypeController,
                  decoration: const InputDecoration(labelText: 'Especifica el tipo'),
                ),
              ],
              const SizedBox(height: 16),
              Text(
                'Personajes en esta relación',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                'Puedes marcar varios: sirve para tríos de hermanos, '
                'alianzas o grupos.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              charactersAsync.when(
                data: (characters) {
                  final options =
                      characters.where((c) => c.id != widget.characterId).toList();
                  if (options.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('No hay otros personajes en este proyecto.'),
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
                decoration:
                    const InputDecoration(labelText: 'Descripción (opcional)'),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _selectedIds.isEmpty ? null : _save,
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
