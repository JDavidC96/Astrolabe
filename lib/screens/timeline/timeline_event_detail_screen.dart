import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/searchable_pickers.dart';

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
  final _year = TextEditingController();

  String? _locationId;
  String? _eventId;
  String? _sourceChapterId;
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
      _year.text = event.year?.toString() ?? '';
      _locationId = event.locationId;
      _sourceChapterId = event.sourceChapterId;
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
    _year.dispose();
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
        year: Value(int.tryParse(_year.text.trim())),
        locationId: Value(_locationId),
      ),
    );
    await dao.setEventCharacters(_eventId!, _selectedCharacterIds.toList());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(L.of(context).eventSaved)));
    }
  }

  Future<void> _delete() async {
    if (_eventId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).eventDeleteTitle),
        content: Text(L.of(context).eventDeleteBody),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(L.of(context).commonCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
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

    final l = L.of(context);
    final locationsAsync = ref.watch(locationsStreamProvider(widget.projectId));
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_eventId == null ? l.eventNew : l.eventEdit),
        actions: [
          if (_eventId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(icon: const Icon(Icons.check), tooltip: l.commonSave, onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_sourceChapterId != null)
              Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.link, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              l.eventLinkedTitle,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(l.eventLinkedBody),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () async {
                          await ref
                              .read(timelineDaoProvider)
                              .unlinkFromChapter(_eventId!);
                          if (mounted) {
                            setState(() => _sourceChapterId = null);
                          }
                        },
                        icon: const Icon(Icons.link_off, size: 18),
                        label: Text(l.eventUnlink),
                      ),
                    ],
                  ),
                ),
              ),
            TextFormField(
              controller: _title,
              decoration: InputDecoration(labelText: l.eventTitle),
              validator: (v) => (v == null || v.trim().isEmpty) ? l.commonRequired : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _year,
              decoration: InputDecoration(
                labelText: l.eventYear,
                helperText: l.eventYearHelp,
                hintText: '298',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _fictionalDate,
              decoration: InputDecoration(
                labelText: l.eventFictionalDate,
                hintText: l.eventFictionalDateHint,
              ),
            ),
            const SizedBox(height: 12),
            locationsAsync.when(
              data: (locations) => DropdownButtonFormField<String?>(
                initialValue: _locationId,
                decoration: InputDecoration(labelText: l.eventPlace),
                items: [
                  DropdownMenuItem(value: null, child: Text(l.commonNone)),
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
              decoration: InputDecoration(labelText: l.eventDescription, border: const OutlineInputBorder()),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            Text(l.eventPeople, style: Theme.of(context).textTheme.titleMedium),
            charactersAsync.when(
              data: (characters) => SearchableCheckboxList(
                emptyMessage: l.eventNoCharacters,
                searchHint: l.charSearchHint,
                options: [
                  for (final c in characters)
                    PickOption(
                      id: c.id,
                      label: '${c.firstName} ${c.lastName ?? ''}'.trim(),
                      sublabel: c.race,
                    ),
                ],
                selected: _selectedCharacterIds,
                onChanged: (id, isSelected) => setState(() {
                  if (isSelected) {
                    _selectedCharacterIds.add(id);
                  } else {
                    _selectedCharacterIds.remove(id);
                  }
                }),
              ),
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
