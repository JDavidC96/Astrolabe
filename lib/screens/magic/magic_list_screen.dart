import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/data_providers.dart';
import '../../widgets/stored_image.dart';

class MagicListScreen extends ConsumerWidget {
  const MagicListScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final systemsAsync = ref.watch(magicSystemsStreamProvider(projectId));

    return Scaffold(
      body: systemsAsync.when(
        data: (systems) {
          if (systems.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No hay sistemas de magia todavía. Toca + para definir cómo '
                  'funciona la magia (o la tecnología) de tu mundo.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: systems.length,
            itemBuilder: (context, index) {
              final system = systems[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: StoredImage(
                      relativePath: system.imagePath,
                      width: 48,
                      height: 48,
                      placeholderIcon: Icons.auto_fix_high_outlined,
                    ),
                  ),
                  title: Text(system.name),
                  subtitle: system.source != null && system.source!.isNotEmpty
                      ? Text(system.source!)
                      : null,
                  onTap: () => context.push('/project/$projectId/magic/${system.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/magic/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
