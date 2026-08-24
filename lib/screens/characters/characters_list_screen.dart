import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/data_providers.dart';
import '../../widgets/stored_image.dart';

class CharactersListScreen extends ConsumerStatefulWidget {
  const CharactersListScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends ConsumerState<CharactersListScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  String? _factionFilter;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));
    final factionsAsync = ref.watch(factionsStreamProvider(widget.projectId));
    final factionNames = {
      for (final f in factionsAsync.valueOrNull ?? const <Faction>[]) f.id: f.name,
    };

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l.charSearchHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _query = v.toLowerCase()),
            ),
          ),
          if ((factionsAsync.valueOrNull ?? const <Faction>[]).isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(l.charFilterAll),
                        selected: _factionFilter == null,
                        onSelected: (_) => setState(() => _factionFilter = null),
                      ),
                    ),
                    for (final f in factionsAsync.valueOrNull ?? const <Faction>[])
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(f.name),
                          selected: _factionFilter == f.id,
                          onSelected: (_) => setState(
                            () => _factionFilter = _factionFilter == f.id ? null : f.id,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: charactersAsync.when(
              data: (characters) {
                final filtered = characters.where((c) {
                  final matchesQuery = _query.isEmpty ||
                      c.firstName.toLowerCase().contains(_query) ||
                      (c.lastName ?? '').toLowerCase().contains(_query) ||
                      (c.aliasNickname ?? '').toLowerCase().contains(_query);
                  final matchesFaction =
                      _factionFilter == null || c.factionId == _factionFilter;
                  return matchesQuery && matchesFaction;
                }).toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        characters.isEmpty ? l.charEmpty : l.charNoMatch,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final character = filtered[index];
                    final subtitleParts = [
                      if (character.race != null && character.race!.isNotEmpty)
                        character.race!,
                      if (character.occupation != null && character.occupation!.isNotEmpty)
                        character.occupation!,
                      if (character.factionId != null &&
                          factionNames[character.factionId] != null)
                        factionNames[character.factionId]!,
                    ];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: ClipOval(
                          child: StoredImage(
                            relativePath: character.portraitImagePath,
                            width: 48,
                            height: 48,
                            placeholderIcon: Icons.person_outline,
                          ),
                        ),
                        title: Text(
                          '${character.firstName} ${character.lastName ?? ''}'.trim() +
                              (character.aliasNickname != null &&
                                      character.aliasNickname!.isNotEmpty
                                  ? ' "${character.aliasNickname}"'
                                  : ''),
                        ),
                        subtitle: subtitleParts.isNotEmpty ? Text(subtitleParts.join(' · ')) : null,
                        trailing: character.status != null && character.status!.isNotEmpty
                            ? Chip(label: Text(character.status!), visualDensity: VisualDensity.compact)
                            : null,
                        onTap: () => context.push(
                          '/project/${widget.projectId}/characters/${character.id}',
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/${widget.projectId}/characters/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
