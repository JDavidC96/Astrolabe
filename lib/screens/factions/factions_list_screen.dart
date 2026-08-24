import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/data_providers.dart';
import '../../widgets/stored_image.dart';

class FactionsListScreen extends ConsumerWidget {
  const FactionsListScreen({super.key, required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factionsAsync = ref.watch(factionsStreamProvider(projectId));

    return Scaffold(
      body: factionsAsync.when(
        data: (factions) {
          if (factions.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  L.of(context).facEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: factions.length,
            itemBuilder: (context, index) {
              final faction = factions[index];
              final subtitleParts = [
                if (faction.type != null && faction.type!.isNotEmpty) faction.type!,
                if (faction.status != null && faction.status!.isNotEmpty) faction.status!,
              ];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: StoredImage(
                      relativePath: faction.symbolImagePath,
                      width: 48,
                      height: 48,
                      placeholderIcon: Icons.shield_outlined,
                    ),
                  ),
                  title: Text(faction.name),
                  subtitle: subtitleParts.isNotEmpty ? Text(subtitleParts.join(' · ')) : null,
                  onTap: () => context.push('/project/$projectId/factions/${faction.id}'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/project/$projectId/factions/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
