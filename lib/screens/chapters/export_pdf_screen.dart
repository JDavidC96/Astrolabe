import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../services/manuscript.dart' as ms;
import '../../services/pdf_export_service.dart';
import '../../services/project_sheets.dart';
import '../../services/sheets.dart';
import '../../widgets/searchable_pickers.dart';

/// What can go in the file, and what each row of the picker is.
enum ExportKind { chapters, characters, factions, locations, items, magic }

/// A row the writer can tick, kept apart from the database so the screen can
/// treat every kind the same way.
class _Entry {
  const _Entry(this.id, this.label, this.sublabel, this.build);

  final String id;
  final String label;
  final String? sublabel;

  /// Built only for what was actually picked.
  final Sheet Function(bool withImages) build;
}

/// Picks what to take away: the manuscript, the records behind it, or both,
/// with or without their pictures.
class ExportPdfScreen extends ConsumerStatefulWidget {
  const ExportPdfScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<ExportPdfScreen> createState() => _ExportPdfScreenState();
}

class _ExportPdfScreenState extends ConsumerState<ExportPdfScreen> {
  /// What is ticked, per kind. A kind absent from here has not been touched,
  /// which for chapters means "all of them".
  final _picked = <ExportKind, Set<String>>{};
  final _withImages = <ExportKind, bool>{};
  bool _busy = false;

  Set<String> _pickedIn(ExportKind kind, List<_Entry> entries) {
    // The manuscript is what most people came for, so it starts ticked.
    return _picked[kind] ??
        (kind == ExportKind.chapters
            ? entries.map((e) => e.id).toSet()
            : <String>{});
  }

  bool _imagesIn(ExportKind kind) => _withImages[kind] ?? true;

  Future<void> _export(Map<ExportKind, List<_Entry>> everything) async {
    final l = L.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final storage = ref.read(imageStorageServiceProvider);

    setState(() => _busy = true);
    try {
      final project =
          await ref.read(projectDaoProvider).getProject(widget.projectId);

      final chapters = <ms.Chapter>[];
      final groups = <SheetGroup>[];

      for (final kind in ExportKind.values) {
        final entries = everything[kind] ?? const <_Entry>[];
        final picked = _pickedIn(kind, entries);
        final chosen = entries.where((e) => picked.contains(e.id)).toList();
        if (chosen.isEmpty) continue;

        if (kind == ExportKind.chapters) {
          for (final entry in chosen) {
            final sheet = entry.build(false);
            chapters.add(ms.Chapter(sheet.title, sheet.sections.isEmpty
                ? const <ms.Paragraph>[]
                : sheet.sections.first.paragraphs));
          }
          continue;
        }

        groups.add(SheetGroup(
          _titleOf(kind, l),
          [for (final entry in chosen) entry.build(_imagesIn(kind))],
        ));
      }

      final file = await const PdfExportService().export(
        ms.Manuscript(project.name, chapters),
        PdfLabels(words: l.pdfWordsLabel('{n}')),
        groups: groups,
        images: (path) async {
          final file = await storage.resolveFile(path);
          if (!await file.exists()) return null;
          return Uint8List.fromList(await File(file.path).readAsBytes());
        },
      );

      await SharePlus.instance.share(
        ShareParams(files: [XFile(file.path)], title: l.pdfShareTitle),
      );
      messenger.showSnackBar(SnackBar(content: Text(l.pdfDone)));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(l.pdfFailed('$e'))));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _titleOf(ExportKind kind, L l) => switch (kind) {
        ExportKind.chapters => l.pdfGroupChapters,
        ExportKind.characters => l.pdfGroupCharacters,
        ExportKind.factions => l.pdfGroupFactions,
        ExportKind.locations => l.pdfGroupLocations,
        ExportKind.items => l.pdfGroupItems,
        ExportKind.magic => l.pdfGroupMagic,
      };

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final theme = Theme.of(context);
    final everything = _gather(l);
    final total = ExportKind.values.fold<int>(
      0,
      (sum, kind) => sum + _pickedIn(kind, everything[kind] ?? const []).length,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l.pdfTitle)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(l.pdfIntroAll),
          ),
          for (final kind in ExportKind.values)
            _section(kind, everything[kind] ?? const [], l, theme),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            icon: _busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.picture_as_pdf_outlined),
            label: Text(_busy ? l.pdfWorking : l.pdfExport),
            onPressed:
                _busy || total == 0 ? null : () => _export(everything),
          ),
        ),
      ),
    );
  }

  Widget _section(
    ExportKind kind,
    List<_Entry> entries,
    L l,
    ThemeData theme,
  ) {
    final picked = _pickedIn(kind, entries);
    // Chapters print as prose, so they have no picture to leave out.
    final offersImages = kind != ExportKind.chapters;

    return ExpansionTile(
      title: Text(_titleOf(kind, l)),
      subtitle: Text(
        entries.isEmpty
            ? l.pdfNoneOfThese
            : l.pdfSelectedCount(picked.length, entries.length),
        style: theme.textTheme.bodySmall,
      ),
      children: entries.isEmpty
          ? const []
          : [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => setState(() =>
                          _picked[kind] = entries.map((e) => e.id).toSet()),
                      child: Text(l.pdfSelectAll),
                    ),
                    TextButton(
                      onPressed: () => setState(() => _picked[kind] = {}),
                      child: Text(l.pdfClear),
                    ),
                  ],
                ),
              ),
              if (offersImages)
                SwitchListTile(
                  dense: true,
                  secondary: const Icon(Icons.image_outlined),
                  title: Text(l.pdfWithImages),
                  value: _imagesIn(kind),
                  onChanged: (value) =>
                      setState(() => _withImages[kind] = value),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchableCheckboxList(
                  options: [
                    for (final entry in entries)
                      PickOption(
                        id: entry.id,
                        label: entry.label,
                        sublabel: entry.sublabel,
                      ),
                  ],
                  selected: picked,
                  onChanged: (id, isSelected) {
                    final next = {...picked};
                    if (isSelected) {
                      next.add(id);
                    } else {
                      next.remove(id);
                    }
                    setState(() => _picked[kind] = next);
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
    );
  }

  /// Reads everything the project holds into rows the picker understands.
  Map<ExportKind, List<_Entry>> _gather(L l) {
    final id = widget.projectId;

    final characters =
        ref.watch(charactersStreamProvider(id)).valueOrNull ?? const [];
    final factions =
        ref.watch(factionsStreamProvider(id)).valueOrNull ?? const [];
    final locations =
        ref.watch(locationsStreamProvider(id)).valueOrNull ?? const [];
    final items = ref.watch(itemsStreamProvider(id)).valueOrNull ?? const [];
    final magic =
        ref.watch(magicSystemsStreamProvider(id)).valueOrNull ?? const [];
    final chapters =
        ref.watch(chaptersStreamProvider(id)).valueOrNull ?? const [];

    String? nameOfFaction(String? factionId) => factionId == null
        ? null
        : factions.where((f) => f.id == factionId).firstOrNull?.name;
    String? nameOfLocation(String? locationId) => locationId == null
        ? null
        : locations.where((x) => x.id == locationId).firstOrNull?.name;
    String? nameOfCharacter(String? characterId) => characterId == null
        ? null
        : characters
            .where((c) => c.id == characterId)
            .map((c) => '${c.firstName} ${c.lastName ?? ''}'.trim())
            .firstOrNull;

    return {
      ExportKind.chapters: [
        for (final chapter in chapters)
          _Entry(
            chapter.id,
            chapter.title,
            _wordsIn(chapter.content, l),
            (_) => Sheet(
              title: chapter.title,
              sections: [
                SheetSection('', ms.paragraphsOf(chapter.content ?? '')),
              ],
            ),
          ),
      ],
      ExportKind.characters: [
        for (final character in characters)
          _Entry(
            character.id,
            '${character.firstName} ${character.lastName ?? ''}'.trim(),
            character.race,
            (images) => characterSheet(
              character,
              l,
              factionName: nameOfFaction(character.factionId),
              images: images,
            ),
          ),
      ],
      ExportKind.factions: [
        for (final faction in factions)
          _Entry(faction.id, faction.name, faction.type,
              (images) => factionSheet(faction, l, images: images)),
      ],
      ExportKind.locations: [
        for (final location in locations)
          _Entry(
            location.id,
            location.name,
            location.type,
            (images) => locationSheet(
              location,
              l,
              parentName: nameOfLocation(location.parentLocationId),
              images: images,
            ),
          ),
      ],
      ExportKind.items: [
        for (final item in items)
          _Entry(
            item.id,
            item.name,
            item.type,
            (images) => itemSheet(
              item,
              l,
              ownerName: nameOfCharacter(item.ownerCharacterId),
              locationName: nameOfLocation(item.locationId),
              images: images,
            ),
          ),
      ],
      ExportKind.magic: [
        for (final system in magic)
          _Entry(system.id, system.name, system.source,
              (images) => magicSheet(system, l, images: images)),
      ],
    };
  }

  String _wordsIn(String? content, L l) {
    if (content == null || content.trim().isEmpty) return l.pdfEmptyChapter;
    final words = ms
        .paragraphsOf(content)
        .map((p) => p.text.trim())
        .where((t) => t.isNotEmpty)
        .fold(0, (sum, t) => sum + t.split(RegExp(r'\s+')).length);
    return l.chapWordCount(words);
  }
}
