import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';

class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool _busy = false;
  String? _lastExportPath;

  void _report(String message, {bool error = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Theme.of(context).colorScheme.error : null,
      ),
    );
  }

  Future<void> _export({required bool share}) async {
    setState(() => _busy = true);
    try {
      final file =
          await ref.read(backupServiceProvider).exportProject(widget.projectId);
      setState(() => _lastExportPath = file.path);

      if (share) {
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(file.path)],
            text: 'Respaldo de mi universo',
          ),
        );
      } else {
        _report('Respaldo guardado en:\n${file.path}');
      }
    } catch (e) {
      _report('No se pudo exportar: $e', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _import() async {
    final picked = await FilePicker.pickFile(
      type: FileType.any,
      dialogTitle: 'Elige un respaldo (.wbz)',
    );
    final path = picked?.path;
    if (path == null) return;

    setState(() => _busy = true);
    try {
      await ref.read(backupServiceProvider).importProject(File(path));
      _report('Universo importado. Búscalo en "Mis universos".');
    } catch (e) {
      _report('No se pudo importar: $e', error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectAsync = ref.watch(projectStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(title: const Text('Exportar / respaldar')),
      body: AbsorbPointer(
        absorbing: _busy,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Todo se guarda solo en este dispositivo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'La app no sube nada a ninguna nube por su cuenta. Si '
                      'pierdes, formateas o cambias de teléfono sin un '
                      'respaldo, pierdes el universo entero.',
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Truco: al tocar "Exportar y compartir" se abre el '
                      'selector de compartir de tu teléfono — ahí puedes '
                      'elegir Google Drive (u otra nube que tengas '
                      'instalada) para subir el respaldo con dos toques, '
                      'sin salir de la app.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              projectAsync.valueOrNull?.name ?? 'Universo',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            const Text(
              'El respaldo incluye personajes, mundo, facciones, línea de '
              'tiempo, capítulos, notas, objetos, magia, etiquetas y todas '
              'las imágenes y dibujos.',
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _busy ? null : () => _export(share: true),
              icon: const Icon(Icons.share_outlined),
              label: const Text('Exportar y compartir'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _busy ? null : () => _export(share: false),
              icon: const Icon(Icons.save_alt),
              label: const Text('Solo guardar en el dispositivo'),
            ),
            if (_lastExportPath != null) ...[
              const SizedBox(height: 8),
              Text(
                'Último respaldo:\n$_lastExportPath',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const Divider(height: 40),
            Text('Importar', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            const Text(
              'Restaura un respaldo como un universo nuevo. No sobrescribe '
              'nada de lo que ya tienes.',
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _busy ? null : _import,
              icon: const Icon(Icons.folder_open_outlined),
              label: const Text('Importar respaldo (.wbz)'),
            ),
            if (_busy) ...[
              const SizedBox(height: 24),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }
}
