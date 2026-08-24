import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../services/backup_service.dart';

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
    final l = L.of(context);
    setState(() => _busy = true);
    try {
      final file =
          await ref.read(backupServiceProvider).exportProject(widget.projectId);
      setState(() => _lastExportPath = file.path);

      if (share) {
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(file.path)],
            text: l.backupShareText,
          ),
        );
      } else {
        _report(l.backupSavedAt(file.path));
      }
    } catch (e) {
      _report(l.backupExportFailed('$e'), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _import() async {
    final l = L.of(context);
    final picked = await FilePicker.pickFile(
      type: FileType.any,
      dialogTitle: l.backupImportPick,
    );
    final path = picked?.path;
    if (path == null) return;

    setState(() => _busy = true);
    try {
      await ref.read(backupServiceProvider).importProject(File(path));
      _report(l.backupImported);
    } on BackupFormatException catch (e) {
      _report(
        e.error == BackupError.notABackup
            ? l.backupErrNotABackup
            : l.backupErrNewerFormat,
        error: true,
      );
    } catch (e) {
      _report(l.backupImportFailed('$e'), error: true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final projectAsync = ref.watch(projectStreamProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(title: Text(l.backupTitle)),
      body: AbsorbPointer(
        absorbing: _busy,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            l.backupLocalTitle,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(l.backupLocalBody),
                    const SizedBox(height: 8),
                    Text(l.backupTip),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              projectAsync.valueOrNull?.name ?? l.drawerUniverse,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(l.backupIncludes),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _busy ? null : () => _export(share: true),
              icon: const Icon(Icons.share_outlined),
              label: Text(l.backupExportShare),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: _busy ? null : () => _export(share: false),
              icon: const Icon(Icons.save_alt),
              label: Text(l.backupExportSave),
            ),
            if (_lastExportPath != null) ...[
              const SizedBox(height: 8),
              Text(
                l.backupLast(_lastExportPath!),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            const Divider(height: 40),
            Text(l.backupImportTitle, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(l.backupImportBody),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _busy ? null : _import,
              icon: const Icon(Icons.folder_open_outlined),
              label: Text(l.backupImportButton),
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
