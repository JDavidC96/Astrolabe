import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/location_tree.dart';

class WorldTreeScreen extends ConsumerWidget {
  const WorldTreeScreen({super.key, required this.projectId});

  final String projectId;

  void _openNew(BuildContext context, String? parentId) {
    final uri = Uri(
      path: '/project/$projectId/world/new',
      queryParameters: parentId != null ? {'parentId': parentId} : null,
    );
    context.push(uri.toString());
  }

  Future<void> _delete(BuildContext context, WidgetRef ref, Location location) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar lugar'),
        content: Text(
          '¿Eliminar "${location.name}"? También se eliminarán sus sublugares.',
        ),
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
    await ref.read(imageStorageServiceProvider).deleteImage(location.mapImagePath);
    await ref.read(locationDaoProvider).deleteLocation(location.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationsAsync = ref.watch(locationsStreamProvider(projectId));

    return Scaffold(
      body: locationsAsync.when(
        data: (locations) => LocationTree(
          locations: locations,
          onTap: (location) => context.push('/project/$projectId/world/${location.id}'),
          onAddChild: (parentId) => _openNew(context, parentId),
          onDelete: (location) => _delete(context, ref, location),
          onOpenMap: (location) =>
              context.push('/project/$projectId/map/${location.id}'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNew(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
