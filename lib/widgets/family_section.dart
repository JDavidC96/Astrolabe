import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/database.dart';
import '../providers/core_providers.dart';
import '../providers/data_providers.dart';
import 'searchable_pickers.dart';

/// Partnership kinds, stored by their Spanish key and shown translated.
const _partnerTypes = <String>[
  'Matrimonio',
  'Pareja',
  'Prometidos',
  'Amantes',
  'Otro',
];

String _partnerLabel(L l, String key) {
  switch (key) {
    case 'Matrimonio':
      return l.partnerMarriage;
    case 'Pareja':
      return l.partnerCouple;
    case 'Prometidos':
      return l.partnerEngaged;
    case 'Amantes':
      return l.partnerLovers;
    case 'Otro':
      return l.partnerOther;
  }
  return key;
}

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
    final l = L.of(context);
    final parentsAsync = ref.watch(parentsStreamProvider(characterId));
    final childrenAsync = ref.watch(childrenStreamProvider(characterId));
    final partnersAsync = ref.watch(partnersStreamProvider(characterId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l.familySection, style: Theme.of(context).textTheme.titleMedium),
            TextButton.icon(
              onPressed: () =>
                  context.push('/project/$projectId/family'),
              icon: const Icon(Icons.account_tree_outlined, size: 18),
              label: Text(l.familyViewTree),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: l.familyParents,
          async: parentsAsync,
          onAdd: () => _pickRelative(context, ref, _Relation.parent),
          onRemove: (other) => ref.read(familyDaoProvider).removeLink(
                parentId: other.id,
                childId: characterId,
              ),
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: l.familyChildren,
          async: childrenAsync,
          onAdd: () => _pickRelative(context, ref, _Relation.child),
          onRemove: (other) => ref.read(familyDaoProvider).removeLink(
                parentId: characterId,
                childId: other.id,
              ),
        ),
        const SizedBox(height: 8),
        _EditableList(
          label: l.familyPartner,
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
        SnackBar(content: Text(L.of(context).familyNoOthers)),
      );
      return;
    }

    final chosenId = await showDialog<String>(
      context: context,
      builder: (context) => SearchablePickDialog(
        title: relation.titleFor(L.of(context)),
        searchHint: L.of(context).charSearchHint,
        options: [
          for (final option in options)
            PickOption(
              id: option.id,
              label: '${option.firstName} ${option.lastName ?? ''}'.trim(),
              sublabel: option.race,
            ),
        ],
      ),
    );
    if (chosenId == null || !context.mounted) return;
    final chosen = options.firstWhere((c) => c.id == chosenId);

    if (relation == _Relation.partner) {
      final type = await showDialog<String>(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text(L.of(context).familyPartnerKind),
          children: [
            for (final t in _partnerTypes)
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(t),
                child: Text(_partnerLabel(L.of(context), t)),
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
        SnackBar(content: Text(L.of(context).locCycleWarning)),
      );
      return;
    }
    await dao.addLink(parentId: parentId, childId: childId);
  }
}

enum _Relation {
  parent,
  child,
  partner;

  String titleFor(L l) {
    switch (this) {
      case _Relation.parent:
        return l.familyPickParent;
      case _Relation.child:
        return l.familyPickChild;
      case _Relation.partner:
        return l.familyPickPartner;
    }
  }
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
              label: Text(L.of(context).commonAdd),
            ),
          ],
        ),
        async.when(
          data: (people) => people.isEmpty
              ? Text(L.of(context).familyNoneRecorded)
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
    final l = L.of(context);
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
          l.kinFullSiblings: kinship.fullSiblings(characterId),
          l.kinHalfSiblings: kinship.halfSiblings(characterId),
          l.kinGrandparents: kinship.grandparents(characterId),
          l.kinGrandchildren: kinship.grandchildren(characterId),
          l.kinUncles: kinship.unclesAndAunts(characterId),
          l.kinNiblings: kinship.niblings(characterId),
          l.kinCousins: kinship.cousins(characterId),
        }..removeWhere((_, ids) => ids.isEmpty);

        if (groups.isEmpty) {
          return Text(
            l.familyDerivedHint,
            style: Theme.of(context).textTheme.bodySmall,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.familyDerived,
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
