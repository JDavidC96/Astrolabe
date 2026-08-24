import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../data/daos/secret_dao.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/searchable_pickers.dart';

/// Tracks hidden information and exactly who is in on it — the continuity
/// trap of "wait, did she already know that in chapter 4?".
class SecretsScreen extends ConsumerWidget {
  const SecretsScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final secretsAsync = ref.watch(secretsStreamProvider(projectId));

    return Scaffold(
      appBar: AppBar(title: Text(l.secretsTitle)),
      body: secretsAsync.when(
        data: (secrets) {
          if (secrets.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_outline, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      l.secretsEmpty,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: secrets.length,
            itemBuilder: (context, index) {
              final entry = secrets[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ExpansionTile(
                  leading: const Icon(Icons.lock_outline),
                  title: Text(entry.secret.title),
                  subtitle: Text(
                    entry.knowers.isEmpty
                        ? l.secretNobodyKnows
                        : l.secretKnownBy(entry.knowers.map(_name).join(', ')),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (entry.owner != null)
                            Text(l.secretOwnedBy(_name(entry.owner!))),
                          if (entry.secret.description?.isNotEmpty == true) ...[
                            const SizedBox(height: 8),
                            Text(entry.secret.description!),
                          ],
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () =>
                                    _showEditor(context, ref, entry),
                                icon: const Icon(Icons.edit_outlined, size: 18),
                                label: Text(l.commonEdit),
                              ),
                              TextButton.icon(
                                onPressed: () => ref
                                    .read(secretDaoProvider)
                                    .deleteSecret(entry.secret.id),
                                icon: const Icon(Icons.delete_outline, size: 18),
                                label: Text(l.commonDelete),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showEditor(context, ref, null),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditor(
    BuildContext context,
    WidgetRef ref,
    SecretWithKnowers? existing,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) =>
          _SecretDialog(projectId: projectId, existing: existing),
    );
  }
}

String _name(Character c) => '${c.firstName} ${c.lastName ?? ''}'.trim();

class _SecretDialog extends ConsumerStatefulWidget {
  const _SecretDialog({required this.projectId, this.existing});

  final String projectId;
  final SecretWithKnowers? existing;

  @override
  ConsumerState<_SecretDialog> createState() => _SecretDialogState();
}

class _SecretDialogState extends ConsumerState<_SecretDialog> {
  late final _title =
      TextEditingController(text: widget.existing?.secret.title ?? '');
  late final _description =
      TextEditingController(text: widget.existing?.secret.description ?? '');

  String? _ownerId;
  late Set<String> _knowerIds;
  /// Per-knower "how they found out", keyed by character id.
  final _howControllers = <String, TextEditingController>{};

  @override
  void initState() {
    super.initState();
    _ownerId = widget.existing?.secret.ownerCharacterId;
    _knowerIds = widget.existing?.knowers.map((c) => c.id).toSet() ?? {};
    _loadHow();
  }

  Future<void> _loadHow() async {
    final existing = widget.existing;
    if (existing == null) return;
    final links =
        await ref.read(secretDaoProvider).getKnowerLinks(existing.secret.id);
    if (!mounted) return;
    setState(() {
      for (final link in links) {
        _howControllers[link.characterId] =
            TextEditingController(text: link.howTheyKnow ?? '');
      }
    });
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    for (final c in _howControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) return;
    final dao = ref.read(secretDaoProvider);

    var id = widget.existing?.secret.id;
    id ??= await dao.createSecret(projectId: widget.projectId, title: title);

    await dao.updateSecret(
      SecretsCompanion(
        id: Value(id),
        title: Value(title),
        description: Value(
          _description.text.trim().isEmpty ? null : _description.text.trim(),
        ),
        ownerCharacterId: Value(_ownerId),
        updatedAt: Value(DateTime.now()),
      ),
    );

    // Sync membership: add/refresh the selected, drop the deselected.
    final previous =
        widget.existing?.knowers.map((c) => c.id).toSet() ?? <String>{};
    for (final characterId in _knowerIds) {
      await dao.setKnower(
        secretId: id,
        characterId: characterId,
        howTheyKnow: _howControllers[characterId]?.text.trim().isEmpty ?? true
            ? null
            : _howControllers[characterId]!.text.trim(),
      );
    }
    for (final removed in previous.difference(_knowerIds)) {
      await dao.removeKnower(secretId: id, characterId: removed);
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));

    return AlertDialog(
      title: Text(widget.existing == null ? l.secretNew : l.secretEdit),
      content: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _title,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: l.secretLabel,
                  hintText: l.secretHint,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _description,
                decoration: InputDecoration(
                  labelText: l.secretDetails,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              charactersAsync.when(
                data: (characters) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String?>(
                      initialValue: _ownerId,
                      decoration:
                          InputDecoration(labelText: l.secretOwnerQuestion),
                      items: [
                        DropdownMenuItem(
                            value: null, child: Text(l.secretOwnerNobody)),
                        for (final c in characters)
                          DropdownMenuItem(value: c.id, child: Text(_name(c))),
                      ],
                      onChanged: (v) => setState(() => _ownerId = v),
                    ),
                    const SizedBox(height: 16),
                    Text(l.secretWhoKnows,
                        style: Theme.of(context).textTheme.labelLarge),

                    SearchableCheckboxList(
                      searchHint: l.charSearchHint,
                      emptyMessage: l.secretNoCharacters,
                      options: [
                        for (final c in characters)
                          PickOption(id: c.id, label: _name(c), sublabel: c.race),
                      ],
                      selected: _knowerIds,
                      onChanged: (id, isSelected) => setState(() {
                        if (isSelected) {
                          _knowerIds.add(id);
                          _howControllers.putIfAbsent(
                              id, () => TextEditingController());
                        } else {
                          _knowerIds.remove(id);
                        }
                      }),
                    ),
                    // The "how did they find out" boxes follow the list so
                    // they stay visible regardless of the search filter.
                    for (final c in characters)
                      if (_knowerIds.contains(c.id))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: TextField(
                            controller: _howControllers.putIfAbsent(
                                c.id, () => TextEditingController()),
                            decoration: InputDecoration(
                              labelText: l.secretHowFound(_name(c)),
                              isDense: true,
                            ),
                          ),
                        ),
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, st) => Text('Error: $e'),
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
        FilledButton(onPressed: _save, child: Text(l.commonSave)),
      ],
    );
  }
}
