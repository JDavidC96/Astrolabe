import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/daos/search_dao.dart';
import '../../data/daos/tag_dao.dart';
import '../../providers/data_providers.dart';
import '../../widgets/stored_image.dart';

/// Human-facing label and icon for each searchable entity kind.
const _entityLabels = <String, (String, IconData)>{
  TagEntity.character: ('Personaje', Icons.person_outline),
  TagEntity.location: ('Lugar', Icons.place_outlined),
  TagEntity.faction: ('Facción', Icons.shield_outlined),
  TagEntity.event: ('Evento', Icons.timeline_outlined),
  TagEntity.item: ('Objeto', Icons.auto_awesome_outlined),
  TagEntity.magic: ('Magia', Icons.auto_fix_high_outlined),
  TagEntity.chapter: ('Capítulo', Icons.menu_book_outlined),
  TagEntity.note: ('Nota', Icons.sticky_note_2_outlined),
};

/// Route each result kind back to its own detail screen.
const _entityRoutes = <String, String>{
  TagEntity.character: 'characters',
  TagEntity.location: 'world',
  TagEntity.faction: 'factions',
  TagEntity.event: 'timeline',
  TagEntity.item: 'items',
  TagEntity.magic: 'magic',
  TagEntity.chapter: 'chapters',
};

class GlobalSearchScreen extends ConsumerStatefulWidget {
  const GlobalSearchScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<GlobalSearchScreen> createState() => _GlobalSearchScreenState();
}

class _GlobalSearchScreenState extends ConsumerState<GlobalSearchScreen> {
  final _controller = TextEditingController();
  String _query = '';
  String? _typeFilter;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _open(SearchResult result) {
    final section = _entityRoutes[result.entityType];
    if (section == null) {
      // Notes are edited in a dialog on their own list screen, so there is
      // no detail route to push — send the user to the list instead.
      context.push('/project/${widget.projectId}/notes');
      return;
    }
    context.push('/project/${widget.projectId}/$section/${result.entityId}');
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync =
        ref.watch(searchResultsProvider((widget.projectId, _query)));

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar en el universo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Buscar personajes, lugares, objetos, capítulos...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: _query.trim().isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Escribe para buscar en todo el universo a la vez.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                : resultsAsync.when(
                    data: (results) {
                      if (results.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Text('Sin resultados.'),
                          ),
                        );
                      }

                      final kinds = results
                          .map((r) => r.entityType)
                          .toSet()
                          .toList()
                        ..sort();
                      final filtered = _typeFilter == null
                          ? results
                          : results
                              .where((r) => r.entityType == _typeFilter)
                              .toList();

                      return Column(
                        children: [
                          SizedBox(
                            height: 44,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ChoiceChip(
                                    label: Text('Todo (${results.length})'),
                                    selected: _typeFilter == null,
                                    onSelected: (_) =>
                                        setState(() => _typeFilter = null),
                                  ),
                                ),
                                for (final kind in kinds)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ChoiceChip(
                                      label: Text(
                                        '${_entityLabels[kind]?.$1 ?? kind} '
                                        '(${results.where((r) => r.entityType == kind).length})',
                                      ),
                                      selected: _typeFilter == kind,
                                      onSelected: (_) => setState(
                                        () => _typeFilter =
                                            _typeFilter == kind ? null : kind,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(12),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final result = filtered[index];
                                final label = _entityLabels[result.entityType];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: ListTile(
                                    leading: result.imagePath != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: StoredImage(
                                              relativePath: result.imagePath,
                                              width: 44,
                                              height: 44,
                                            ),
                                          )
                                        : CircleAvatar(
                                            child: Icon(
                                              label?.$2 ?? Icons.help_outline,
                                            ),
                                          ),
                                    title: Text(result.title),
                                    subtitle: result.subtitle != null &&
                                            result.subtitle!.isNotEmpty
                                        ? Text(
                                            result.subtitle!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : null,
                                    trailing: Chip(
                                      label: Text(label?.$1 ?? result.entityType),
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    onTap: () => _open(result),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) => Center(child: Text('Error: $e')),
                  ),
          ),
        ],
      ),
    );
  }
}
