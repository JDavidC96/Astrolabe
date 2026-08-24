import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/daos/tag_dao.dart';
import '../../providers/core_providers.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/tags_field.dart';

class MagicDetailScreen extends ConsumerStatefulWidget {
  const MagicDetailScreen({
    super.key,
    required this.projectId,
    required this.magicId,
  });

  final String projectId;
  final String? magicId;

  @override
  ConsumerState<MagicDetailScreen> createState() => _MagicDetailScreenState();
}

class _MagicDetailScreenState extends ConsumerState<MagicDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _description = TextEditingController();
  final _source = TextEditingController();
  final _rules = TextEditingController();
  final _limitations = TextEditingController();
  final _cost = TextEditingController();

  String? _imagePath;
  String? _magicId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _magicId = widget.magicId;
    _load();
  }

  Future<void> _load() async {
    if (widget.magicId != null) {
      final system = await ref.read(magicDaoProvider).getMagicSystem(widget.magicId!);
      _name.text = system.name;
      _description.text = system.description ?? '';
      _source.text = system.source ?? '';
      _rules.text = system.rules ?? '';
      _limitations.text = system.limitations ?? '';
      _cost.text = system.cost ?? '';
      _imagePath = system.imagePath;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    for (final c in [
      _name,
      _description,
      _source,
      _rules,
      _limitations,
      _cost,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(magicDaoProvider);

    if (_magicId == null) {
      final id = await dao.createMagicSystem(
        projectId: widget.projectId,
        name: _name.text.trim(),
      );
      setState(() => _magicId = id);
    }

    await dao.updateMagicSystem(
      MagicSystemsCompanion(
        id: Value(_magicId!),
        name: Value(_name.text.trim()),
        description: Value(_nullIfEmpty(_description.text)),
        source: Value(_nullIfEmpty(_source.text)),
        rules: Value(_nullIfEmpty(_rules.text)),
        limitations: Value(_nullIfEmpty(_limitations.text)),
        cost: Value(_nullIfEmpty(_cost.text)),
        imagePath: Value(_imagePath),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(L.of(context).magicSaved)));
    }
  }

  Future<void> _delete() async {
    if (_magicId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).magicDeleteTitle),
        content: Text(L.of(context).magicDeleteBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(L.of(context).commonCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(imageStorageServiceProvider).deleteImage(_imagePath);
    await ref.read(magicDaoProvider).deleteMagicSystem(_magicId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l = L.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(_magicId == null ? l.magicNew : l.magicEdit),
        actions: [
          if (_magicId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: l.commonSave,
            onPressed: _save,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_magicId != null) ...[
              Center(
                child: ImageOrDrawingPicker(
                  projectId: widget.projectId,
                  imagePath: _imagePath,
                  label: l.magicSymbol,
                  onChanged: (path) {
                    setState(() => _imagePath = path);
                    ref.read(magicDaoProvider).updateMagicSystem(
                          MagicSystemsCompanion(
                            id: Value(_magicId!),
                            imagePath: Value(path),
                          ),
                        );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _name,
              decoration: InputDecoration(labelText: l.magicName),
              validator: (v) => (v == null || v.trim().isEmpty) ? l.commonRequired : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _source,
              decoration: InputDecoration(
                labelText: l.magicSource,
                hintText: l.magicSourceHint,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _rules,
              decoration: InputDecoration(
                labelText: l.magicRules,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _limitations,
              decoration: InputDecoration(
                labelText: l.magicLimits,
                border: const OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _cost,
              decoration: InputDecoration(
                labelText: l.magicCost,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(
                labelText: l.magicDescription,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            if (_magicId != null) ...[
              const SizedBox(height: 16),
              TagsField(
                projectId: widget.projectId,
                entityType: TagEntity.magic,
                entityId: _magicId!,
              ),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
