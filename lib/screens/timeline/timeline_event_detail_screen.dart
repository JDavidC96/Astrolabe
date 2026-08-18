import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';

class TimelineEventDetailScreen extends ConsumerStatefulWidget {
  const TimelineEventDetailScreen({super.key, required this.projectId, required this.eventId});

  final String projectId;
  final String? eventId;

  @override
  ConsumerState<TimelineEventDetailScreen> createState() => _TimelineEventDetailScreenState();
}

class _TimelineEventDetailScreenState extends ConsumerState<TimelineEventDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _fictionalDate = TextEditingController();
  final _description = TextEditingController();

  String? _locationId;
  String? _eventId;
  Set<String> _selectedCharacterIds = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _eventId = widget.eventId;
    _load();
  }

  Future<void> _load() async {
    if (widget.eventId != null) {
      final event = await ref.read(timelineDaoProvider).getEvent(widget.eventId!);
      _title.text = event.title;
      _fictionalDate.text = event.fictionalDate ?? '';
      _description.text = event.description ?? '';
      _locationId = event.locationId;
      final involved = await ref.read(timelineDaoProvider).watchEventCharacters(widget.eventId!).first;
      _selectedCharacterIds = involved.map((c) => c.id).toSet();
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _title.dispose();
    _fictionalDate.dispose();
    _description.dispose();
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(timelineDaoProvider);

    if (_eventId == null) {
      final id = await dao.createEvent(projectId: widget.projectId, title: _title.text.trim());
      setState(() => _eventId = id);
    }

    await dao.updateEvent(
      TimelineEventsCompanion(
        id: Value(_eventId!),
        title: Value(_title.text.trim()),
        fictionalDate: Value(_nullIfEmpty(_fictionalDate.text)),
        description: Value(_nullIfEmpty(_description.text)),
        locationId: Value(_locationId),
      ),
    );
    await dao.setEventCharacters(_eventId!, _selectedCharacterIds.toList());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Evento guardado')));
    }
  }

  Future<void> _delete() async {
    if (_eventId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar evento'),
        content: const Text('¿Eliminar este evento de la línea de tiempo?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancelar')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(timelineDaoProvider).deleteEvent(_eventId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final locationsAsync = ref.watch(locationsStreamProvider(widget.projectId));
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_eventId == null ? 'Nuevo evento' : 'Editar evento'),
        actions: [
          if (_eventId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(icon: const Icon(Icons.check), tooltip: 'Guardar', onPressed: _save),
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
              controller: _fictionalDate,
              decoration: const InputDecoration(
                labelText: 'Fecha ficticia',
                hintText: 'Año 3 de la Tercera Era, 12 de invierno...',
              ),
            ),
            const SizedBox(height: 12),
            locationsAsync.when(
              data: (locations) => DropdownButtonFormField<String?>(
                initialValue: _locationId,
                decoration: const InputDecoration(labelText: 'Lugar'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Ninguno')),
                  for (final l in locations) DropdownMenuItem(value: l.id, child: Text(l.name)),
                ],
                onChanged: (v) => setState(() => _locationId = v),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(labelText: 'Descripción', border: OutlineInputBorder()),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Text('Personajes involucrados', style: Theme.of(context).textTheme.titleMedium),
            charactersAsync.when(
              data: (characters) {
                if (characters.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('No hay personajes en este proyecto todavía.'),
                  );
                }
                return Column(
                  children: [
                    for (final c in characters)
                      CheckboxListTile(
                        title: Text('${c.firstName} ${c.lastName ?? ''}'.trim()),
                        value: _selectedCharacterIds.contains(c.id),
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              _selectedCharacterIds.add(c.id);
                            } else {
                              _selectedCharacterIds.remove(c.id);
                            }
                          });
                        },
                      ),
                  ],
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
