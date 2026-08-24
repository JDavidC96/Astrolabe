import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/daos/tag_dao.dart';
import '../../data/tables.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../services/text_stats.dart';
import '../../widgets/searchable_pickers.dart';
import '../../widgets/tags_field.dart';

class ChapterDetailScreen extends ConsumerStatefulWidget {
  const ChapterDetailScreen({
    super.key,
    required this.projectId,
    required this.chapterId,
  });

  final String projectId;
  final String? chapterId;

  @override
  ConsumerState<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends ConsumerState<ChapterDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _summary = TextEditingController();
  final _status = TextEditingController();
  final _storyYear = TextEditingController();

  Set<String> _characterIds = {};
  Set<String> _locationIds = {};
  String? _chapterId;
  DateTime? _sessionDate;
  int? _wordGoal;
  TextStats _contentStats = TextStats.empty;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _chapterId = widget.chapterId;
    _load();
  }

  Future<void> _load() async {
    if (widget.chapterId != null) {
      final dao = ref.read(chapterDaoProvider);
      final chapter = await dao.getChapter(widget.chapterId!);
      _title.text = chapter.title;
      _summary.text = chapter.summary ?? '';
      _status.text = chapter.status ?? '';
      _storyYear.text = chapter.storyYear?.toString() ?? '';
      _sessionDate = chapter.sessionDate;
      _wordGoal = chapter.wordGoal;
      _contentStats = TextStats.of(chapter.content);
      _characterIds =
          (await dao.watchChapterCharacters(widget.chapterId!).first)
              .map((c) => c.id)
              .toSet();
      _locationIds = (await dao.watchChapterLocations(widget.chapterId!).first)
          .map((l) => l.id)
          .toSet();
    }
    if (mounted) setState(() => _loading = false);
  }

  /// Re-reads just the word count after returning from the editor.
  Future<void> _reloadContentStats() async {
    if (_chapterId == null) return;
    final chapter = await ref.read(chapterDaoProvider).getChapter(_chapterId!);
    if (mounted) {
      setState(() {
        _contentStats = TextStats.of(chapter.content);
        _wordGoal = chapter.wordGoal;
      });
    }
  }

  @override
  void dispose() {
    for (final c in [_title, _summary, _status, _storyYear]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(chapterDaoProvider);

    if (_chapterId == null) {
      final id = await dao.createChapter(
        projectId: widget.projectId,
        title: _title.text.trim(),
      );
      setState(() => _chapterId = id);
    }

    await dao.updateChapter(
      ChaptersCompanion(
        id: Value(_chapterId!),
        title: Value(_title.text.trim()),
        summary: Value(_nullIfEmpty(_summary.text)),
        // `content` is deliberately absent: the editor owns it, and writing
        // a stale copy from here would silently discard the user's prose.
        status: Value(_nullIfEmpty(_status.text)),
        storyYear: Value(int.tryParse(_storyYear.text.trim())),
        sessionDate: Value(_sessionDate),
        updatedAt: Value(DateTime.now()),
      ),
    );
    await dao.setChapterCharacters(_chapterId!, _characterIds.toList());
    await dao.setChapterLocations(_chapterId!, _locationIds.toList());
    // Keeps the mirrored timeline event in step; a no-op when the project
    // has auto-sync switched off.
    await ref.read(chapterTimelineSyncProvider).syncChapter(_chapterId!);

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Capítulo guardado')));
    }
  }

  Future<void> _delete() async {
    if (_chapterId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar capítulo'),
        content: const Text('¿Eliminar este capítulo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(chapterDaoProvider).deleteChapter(_chapterId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));
    final locationsAsync = ref.watch(locationsStreamProvider(widget.projectId));
    final projectAsync = ref.watch(projectStreamProvider(widget.projectId));
    final isCampaign = projectAsync.valueOrNull?.kind == ProjectKind.dnd;
    final noun = isCampaign ? 'sesión' : 'capítulo';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _chapterId == null ? 'Nueva $noun' : 'Editar $noun',
        ),
        actions: [
          if (_chapterId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Guardar',
            onPressed: _save,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(labelText: 'Título *'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _status,
              decoration: InputDecoration(
                labelText: 'Estado (opcional)',
                hintText: isCampaign
                    ? 'Jugada, pendiente, cancelada...'
                    : 'Borrador, revisado, terminado...',
              ),
            ),
            if (isCampaign) ...[
              const SizedBox(height: 12),
              // Real-world play date, distinct from the in-world timeline.
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.event_outlined),
                title: const Text('Fecha en que se jugó'),
                subtitle: Text(
                  _sessionDate == null
                      ? 'Sin fecha'
                      : '${_sessionDate!.day}/${_sessionDate!.month}/${_sessionDate!.year}',
                ),
                trailing: _sessionDate == null
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _sessionDate = null),
                      ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _sessionDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _sessionDate = picked);
                },
              ),
            ],
            const SizedBox(height: 12),
            TextFormField(
              controller: _storyYear,
              decoration: const InputDecoration(
                labelText: 'Año en la historia (opcional)',
                helperText: 'Para ubicarlo en la línea de tiempo.',
                hintText: '298',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _summary,
              decoration: const InputDecoration(
                labelText: 'Resumen (opcional)',
                helperText: 'Si activas la opción, aparece en la línea de tiempo.',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            // The text itself lives in the full-screen editor, which is the
            // single writer of `content`; editing it here too would let the
            // two screens overwrite each other.
            Card(
              child: ListTile(
                leading: const Icon(Icons.edit_note),
                title: const Text('Contenido'),
                subtitle: Text(
                  _chapterId == null
                      ? 'Guarda primero (✓ arriba) para empezar a escribir.'
                      : _contentStats.words == 0
                          ? 'Vacío. Toca para escribir.'
                          : '${_contentStats.words} palabras'
                              '${_wordGoal != null ? ' de $_wordGoal' : ''}',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: _chapterId == null
                    ? null
                    : () async {
                        await context.push(
                          '/project/${widget.projectId}/write/$_chapterId',
                        );
                        // The editor owns the text; refresh the summary line.
                        await _reloadContentStats();
                      },
              ),
            ),
            if (_chapterId != null) ...[
              const SizedBox(height: 8),
              // Manual, one-off copy. Independent of the auto-sync switch,
              // for people who want to place only some chapters by hand.
              OutlinedButton.icon(
                onPressed: () async {
                  await ref
                      .read(chapterTimelineSyncProvider)
                      .addChapterOnce(_chapterId!);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Agregado a la línea de tiempo. Puedes editarlo '
                          'ahí libremente.',
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.timeline_outlined, size: 18),
                label: const Text('Agregar a la línea de tiempo'),
              ),
            ],
            const SizedBox(height: 16),
            Text(isCampaign ? 'Quiénes asistieron' : 'Personajes que aparecen',
                style: Theme.of(context).textTheme.titleMedium),
            charactersAsync.when(
              data: (characters) => SearchableCheckboxList(
                emptyMessage: 'No hay personajes en este universo todavía.',
                searchHint: 'Buscar personaje...',
                options: [
                  for (final c in characters)
                    PickOption(
                      id: c.id,
                      label: '${c.firstName} ${c.lastName ?? ''}'.trim(),
                      sublabel: c.race,
                    ),
                ],
                selected: _characterIds,
                onChanged: (id, isSelected) => setState(() {
                  if (isSelected) {
                    _characterIds.add(id);
                  } else {
                    _characterIds.remove(id);
                  }
                }),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 16),
            Text('Lugares donde ocurre',
                style: Theme.of(context).textTheme.titleMedium),
            locationsAsync.when(
              data: (locations) => SearchableCheckboxList(
                emptyMessage: 'No hay lugares en este universo todavía.',
                searchHint: 'Buscar lugar...',
                options: [
                  for (final l in locations)
                    PickOption(id: l.id, label: l.name, sublabel: l.type),
                ],
                selected: _locationIds,
                onChanged: (id, isSelected) => setState(() {
                  if (isSelected) {
                    _locationIds.add(id);
                  } else {
                    _locationIds.remove(id);
                  }
                }),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            if (_chapterId != null) ...[
              const SizedBox(height: 16),
              TagsField(
                projectId: widget.projectId,
                entityType: TagEntity.chapter,
                entityId: _chapterId!,
              ),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
