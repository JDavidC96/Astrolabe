import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/stored_image.dart';

class FactionDetailScreen extends ConsumerStatefulWidget {
  const FactionDetailScreen({super.key, required this.projectId, required this.factionId});

  final String projectId;
  final String? factionId;

  @override
  ConsumerState<FactionDetailScreen> createState() => _FactionDetailScreenState();
}

class _FactionDetailScreenState extends ConsumerState<FactionDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _type = TextEditingController();
  final _description = TextEditingController();
  final _status = TextEditingController();

  String? _symbolPath;
  String? _factionId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _factionId = widget.factionId;
    _load();
  }

  Future<void> _load() async {
    if (widget.factionId != null) {
      final faction = await ref.read(factionDaoProvider).getFaction(widget.factionId!);
      _name.text = faction.name;
      _type.text = faction.type ?? '';
      _description.text = faction.description ?? '';
      _status.text = faction.status ?? '';
      _symbolPath = faction.symbolImagePath;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    for (final c in [_name, _type, _description, _status]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(factionDaoProvider);

    if (_factionId == null) {
      final id = await dao.createFaction(projectId: widget.projectId, name: _name.text.trim());
      setState(() => _factionId = id);
    }

    await dao.updateFaction(
      FactionsCompanion(
        id: Value(_factionId!),
        name: Value(_name.text.trim()),
        type: Value(_nullIfEmpty(_type.text)),
        description: Value(_nullIfEmpty(_description.text)),
        status: Value(_nullIfEmpty(_status.text)),
        symbolImagePath: Value(_symbolPath),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Facción guardada')));
    }
  }

  Future<void> _delete() async {
    if (_factionId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar facción'),
        content: const Text('¿Eliminar esta facción? Los personajes miembros dejarán de tenerla asignada.'),
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
    await ref.read(imageStorageServiceProvider).deleteImage(_symbolPath);
    await ref.read(factionDaoProvider).deleteFaction(_factionId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_factionId == null ? 'Nueva facción' : 'Editar facción'),
        actions: [
          if (_factionId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(icon: const Icon(Icons.check), tooltip: 'Guardar', onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_factionId != null) ...[
              Center(
                child: ImageOrDrawingPicker(
                  projectId: widget.projectId,
                  imagePath: _symbolPath,
                  label: 'Símbolo / estandarte',
                  onChanged: (path) {
                    setState(() => _symbolPath = path);
                    ref.read(factionDaoProvider).updateFaction(
                          FactionsCompanion(id: Value(_factionId!), symbolImagePath: Value(path)),
                        );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Nombre *'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Requerido' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _type,
              decoration: const InputDecoration(
                labelText: 'Tipo (opcional)',
                hintText: 'Casa, gremio, reino, ejército...',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _status,
              decoration: const InputDecoration(labelText: 'Estado (opcional)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(labelText: 'Descripción (opcional)', border: OutlineInputBorder()),
              maxLines: 6,
            ),
            if (_factionId != null) ...[
              const SizedBox(height: 16),
              Text('Miembros', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Consumer(
                builder: (context, ref, _) {
                  final membersAsync = ref.watch(factionMembersStreamProvider(_factionId!));
                  return membersAsync.when(
                    data: (members) {
                      if (members.isEmpty) {
                        return const Text('Ningún personaje pertenece a esta facción todavía.');
                      }
                      return Column(
                        children: [
                          for (final m in members)
                            Card(
                              child: ListTile(
                                leading: ClipOval(
                                  child: StoredImage(
                                    relativePath: m.portraitImagePath,
                                    width: 40,
                                    height: 40,
                                    placeholderIcon: Icons.person_outline,
                                  ),
                                ),
                                title: Text('${m.firstName} ${m.lastName ?? ''}'.trim()),
                                onTap: () =>
                                    context.push('/project/${widget.projectId}/characters/${m.id}'),
                              ),
                            ),
                        ],
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (e, st) => Text('Error: $e'),
                  );
                },
              ),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
