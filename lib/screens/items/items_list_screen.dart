import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/data_providers.dart';
import '../../widgets/stored_image.dart';

class ItemsListScreen extends ConsumerWidget {
  const ItemsListScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(itemsStreamProvider(projectId));

    return Scaffold(
      body: itemsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  L.of(context).itemEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: StoredImage(
                      relativePath: item.imagePath,
                      width: 48,
                      height: 48,
                      placeholderIcon: Icons.auto_awesome_outlined,
                    ),
                  ),
                  title: Text(item.name),
                  subtitle: item.type != null && item.type!.isNotEmpty
                      ? Text(item.type!)
                      : null,
                  onTap: () => context.push('/project/$projectId/items/${item.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/items/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
