import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../data/daos/tag_dao.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/tags_field.dart';

class ItemDetailScreen extends ConsumerStatefulWidget {
  const ItemDetailScreen({super.key, required this.projectId, required this.itemId});

  final String projectId;
  final String? itemId;

  @override
  ConsumerState<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends ConsumerState<ItemDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _type = TextEditingController();
  final _description = TextEditingController();
  final _powers = TextEditingController();
  final _origin = TextEditingController();

  String? _ownerCharacterId;
  String? _locationId;
  String? _imagePath;
  String? _itemId;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _itemId = widget.itemId;
    _load();
  }

  Future<void> _load() async {
    if (widget.itemId != null) {
      final item = await ref.read(itemDaoProvider).getItem(widget.itemId!);
      _name.text = item.name;
      _type.text = item.type ?? '';
      _description.text = item.description ?? '';
      _powers.text = item.powers ?? '';
      _origin.text = item.origin ?? '';
      _ownerCharacterId = item.ownerCharacterId;
      _locationId = item.locationId;
      _imagePath = item.imagePath;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    for (final c in [_name, _type, _description, _powers, _origin]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(itemDaoProvider);

    if (_itemId == null) {
      final id = await dao.createItem(
        projectId: widget.projectId,
        name: _name.text.trim(),
      );
      setState(() => _itemId = id);
    }

    await dao.updateItem(
      ItemsCompanion(
        id: Value(_itemId!),
        name: Value(_name.text.trim()),
        type: Value(_nullIfEmpty(_type.text)),
        description: Value(_nullIfEmpty(_description.text)),
        powers: Value(_nullIfEmpty(_powers.text)),
        origin: Value(_nullIfEmpty(_origin.text)),
        ownerCharacterId: Value(_ownerCharacterId),
        locationId: Value(_locationId),
        imagePath: Value(_imagePath),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(L.of(context).itemSaved)));
    }
  }

  Future<void> _delete() async {
    if (_itemId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).itemDeleteTitle),
        content: Text(L.of(context).itemDeleteBody),
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
    await ref.read(itemDaoProvider).deleteItem(_itemId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l = L.of(context);
    final charactersAsync = ref.watch(charactersStreamProvider(widget.projectId));
    final locationsAsync = ref.watch(locationsStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text(_itemId == null ? l.itemNew : l.itemEdit),
        actions: [
          if (_itemId != null)
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
            if (_itemId != null) ...[
              Center(
                child: ImageOrDrawingPicker(
                  projectId: widget.projectId,
                  imagePath: _imagePath,
                  label: l.itemImage,
                  onChanged: (path) {
                    setState(() => _imagePath = path);
                    ref.read(itemDaoProvider).updateItem(
                          ItemsCompanion(
                            id: Value(_itemId!),
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
              decoration: InputDecoration(labelText: l.itemName),
              validator: (v) => (v == null || v.trim().isEmpty) ? l.commonRequired : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _type,
              decoration: InputDecoration(
                labelText: l.itemType,
                hintText: l.itemTypeHint,
              ),
            ),
            const SizedBox(height: 12),
            charactersAsync.when(
              data: (characters) => DropdownButtonFormField<String?>(
                initialValue: _ownerCharacterId,
                decoration: InputDecoration(labelText: l.itemOwner),
                items: [
                  DropdownMenuItem(value: null, child: Text(l.itemOwnerNone)),
                  for (final c in characters)
                    DropdownMenuItem(
                      value: c.id,
                      child: Text('${c.firstName} ${c.lastName ?? ''}'.trim()),
                    ),
                ],
                onChanged: (v) => setState(() => _ownerCharacterId = v),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 12),
            locationsAsync.when(
              data: (locations) => DropdownButtonFormField<String?>(
                initialValue: _locationId,
                decoration: InputDecoration(labelText: l.itemLocation),
                items: [
                  DropdownMenuItem(value: null, child: Text(l.itemLocationUnknown)),
                  for (final l in locations)
                    DropdownMenuItem(value: l.id, child: Text(l.name)),
                ],
                onChanged: (v) => setState(() => _locationId = v),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, st) => Text('Error: $e'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _origin,
              decoration: InputDecoration(
                labelText: l.itemOrigin,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _powers,
              decoration: InputDecoration(
                labelText: l.itemPowers,
                border: const OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _description,
              decoration: InputDecoration(
                labelText: l.itemDescription,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            if (_itemId != null) ...[
              const SizedBox(height: 16),
              TagsField(
                projectId: widget.projectId,
                entityType: TagEntity.item,
                entityId: _itemId!,
              ),
            ],
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
