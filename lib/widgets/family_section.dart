import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/database.dart';
import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

const _partnerTypes = <String>[
  'Matrimonio',
  'Pareja',
  'Prometidos',
  'Amantes',
  'Otro',
];

/// Direct family for one character, plus every relationship that follows
/// from it.
///
/// Only parents, children and partners are recorded; siblings, grandparents,
/// uncles and cousins are derived, so they can never disagree with the links
/// the user actually entered.
class FamilySection extends ConsumerWidget {
  const FamilySection({
    super.key,
    required this.projectId,
    required this.characterId,
  });

  final String projectId;
  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentsAsync = ref.watch(parentsStreamProvider(characterId));
    final childrenAsync = ref.watch(childrenStreamProvider(characterId));
    final partnersAsync = ref.watch(partnersStreamProvider(characterId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Familia', style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () =>
                  context.push('/project/$projectId/family'),
              icon: const Icon(Icons.account_tree_outlined, size: 18),
              label: const Text('Ver árbol'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: 'Padres / madres',
          async: parentsAsync,
          onAdd: () => _pickRelative(context, ref, _Relation.parent),
          onRemove: (other) => ref.read(familyDaoProvider).removeLink(
                parentId: other.id,
                childId: characterId,
              ),
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: 'Hijos / hijas',
          async: childrenAsync,
          onAdd: () => _pickRelative(context, ref, _Relation.child),
          onRemove: (other) => ref.read(familyDaoProvider).removeLink(
                parentId: characterId,
                childId: other.id,
              ),
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: 'Pareja',
          async: partnersAsync,
          onAdd: () => _pickRelative(context, ref, _Relation.partner),
          onRemove: (other) => ref
              .read(partnerDaoProvider)
              .unlink(aId: characterId, bId: other.id),
        ),
        const SizedBox(height: 16),
        _DerivedKin(projectId: projectId, characterId: characterId),
      ],
    );
  }

  Future<void> _pickRelative(
    BuildContext context,
    WidgetRef ref,
    _Relation relation,
  ) async {
    final characters =
        await ref.read(charactersStreamProvider(projectId).future);
    final options = characters.where((c) => c.id != characterId).toList();
    if (!context.mounted) return;

    if (options.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No hay otros personajes todavía.')),
      );
      return;
    }

    final chosen = await showDialog<Character>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(relation.dialogTitle),
        children: [
          for (final option in options)
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(option),
              child: Text(
                '${option.firstName} ${option.lastName ?? ''}'.trim(),
              ),
            ),
        ],
      ),
    );
    if (chosen == null || !context.mounted) return;

    if (relation == _Relation.partner) {
      final type = await showDialog<String>(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Text('¿Qué tipo de vínculo?'),
          children: [
            for (final t in _partnerTypes)
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(t),
                child: Text(t),
              ),
          ],
        ),
      );
      if (type == null) return;
      await ref
          .read(partnerDaoProvider)
          .link(aId: characterId, bId: chosen.id, type: type);
      return;
    }

    final parentId = relation == _Relation.parent ? chosen.id : characterId;
    final childId = relation == _Relation.parent ? characterId : chosen.id;

    final dao = ref.read(familyDaoProvider);
    // Refuse links that would make someone their own ancestor.
    if (await dao.wouldCreateCycle(parentId, childId)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ese vínculo crearía un bucle en el árbol.'),
        ),
      );
      return;
    }
    await dao.addLink(parentId: parentId, childId: childId);
  }
}

enum _Relation {
  parent('Elegir padre/madre'),
  child('Elegir hijo/hija'),
  partner('Elegir pareja');

  const _Relation(this.dialogTitle);
  final String dialogTitle;
}

class _EditableList extends StatelessWidget {
  const _EditableList({
    required this.label,
    required this.async,
    required this.onAdd,
    required this.onRemove,
  });

  final String label;
  final AsyncValue<List<Character>> async;
  final VoidCallback onAdd;
  final void Function(Character) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            TextButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Agregar'),
            ),
          ],
        ),
        async.when(
          data: (people) => people.isEmpty
              ? const Text('Ninguno registrado.')
              : Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final person in people)
                      Chip(
                        label: Text(
                          '${person.firstName} ${person.lastName ?? ''}'.trim(),
                        ),
                        onDeleted: () => onRemove(person),
                      ),
                  ],
                ),
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ],
    );
  }
}

/// Relationships the app works out on its own.
class _DerivedKin extends ConsumerWidget {
  const _DerivedKin({required this.projectId, required this.characterId});

  final String projectId;
  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kinshipAsync = ref.watch(kinshipProvider(projectId));
    final charactersAsync = ref.watch(charactersStreamProvider(projectId));

    return kinshipAsync.when(
      data: (kinship) {
        final characters = charactersAsync.valueOrNull ?? const <Character>[];
        final byId = {for (final c in characters) c.id: c};

        String nameOf(String id) {
          final c = byId[id];
          if (c == null) return '?';
          return '${c.firstName} ${c.lastName ?? ''}'.trim();
        }

        final groups = <String, Set<String>>{
          'Hermanos (mismos padres)': kinship.fullSiblings(characterId),
          'Medios hermanos': kinship.halfSiblings(characterId),
          'Abuelos': kinship.grandparents(characterId),
          'Nietos': kinship.grandchildren(characterId),
          'Tíos': kinship.unclesAndAunts(characterId),
          'Sobrinos': kinship.niblings(characterId),
          'Primos': kinship.cousins(characterId),
        }..removeWhere((_, ids) => ids.isEmpty);

        if (groups.isEmpty) {
          return Text(
            'Al registrar padres e hijos, aquí aparecerán solos los hermanos, '
            'abuelos, tíos y primos.',
            style: Theme.of(context).textTheme.bodySmall,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Parentescos deducidos',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 4),
            for (final entry in groups.entries)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text('${entry.key}: ',
                        style: Theme.of(context).textTheme.labelMedium),
                    for (final id in entry.value)
                      ActionChip(
                        visualDensity: VisualDensity.compact,
                        label: Text(nameOf(id)),
                        onPressed: () => context
                            .push('/project/$projectId/characters/$id'),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }
}
