import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/database.dart';
import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../data/daos/tag_dao.dart';
import '../../data/tables.dart';
import '../../widgets/custom_fields_section.dart';
import '../../widgets/dnd_sheet_section.dart';
import '../../widgets/family_section.dart';
import '../../widgets/image_or_drawing_picker.dart';
import '../../widgets/relationships_section.dart';
import '../../widgets/tags_field.dart';

class CharacterDetailScreen extends ConsumerStatefulWidget {
  const CharacterDetailScreen({
    super.key,
    required this.projectId,
    required this.characterId,
  });

  final String projectId;
  final String? characterId;

  @override
  ConsumerState<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends ConsumerState<CharacterDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _alias = TextEditingController();
  final _race = TextEditingController();
  final _gender = TextEditingController();
  final _age = TextEditingController();
  final _occupation = TextEditingController();
  final _status = TextEditingController();
  final _physicalDescription = TextEditingController();
  final _personality = TextEditingController();
  final _backstory = TextEditingController();
  final _abilities = TextEditingController();
  final _notes = TextEditingController();

  String? _factionId;
  String? _portraitPath;
  String? _characterId;
  String? _role;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _characterId = widget.characterId;
    _load();
  }

  Future<void> _load() async {
    if (widget.characterId != null) {
      final character = await ref.read(characterDaoProvider).getCharacter(widget.characterId!);
      _firstName.text = character.firstName;
      _lastName.text = character.lastName ?? '';
      _alias.text = character.aliasNickname ?? '';
      _race.text = character.race ?? '';
      _gender.text = character.gender ?? '';
      _age.text = character.age ?? '';
      _occupation.text = character.occupation ?? '';
      _status.text = character.status ?? '';
      _physicalDescription.text = character.physicalDescription ?? '';
      _personality.text = character.personality ?? '';
      _backstory.text = character.backstory ?? '';
      _abilities.text = character.abilities ?? '';
      _notes.text = character.notes ?? '';
      _factionId = character.factionId;
      _portraitPath = character.portraitImagePath;
      _role = character.role;
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    for (final c in [
      _firstName,
      _lastName,
      _alias,
      _race,
      _gender,
      _age,
      _occupation,
      _status,
      _physicalDescription,
      _personality,
      _backstory,
      _abilities,
      _notes,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  String? _nullIfEmpty(String value) => value.trim().isEmpty ? null : value.trim();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final dao = ref.read(characterDaoProvider);

    if (_characterId == null) {
      final id = await dao.createCharacter(
        projectId: widget.projectId,
        firstName: _firstName.text.trim(),
      );
      setState(() => _characterId = id);
    }

    await dao.updateCharacter(
      CharactersCompanion(
        id: Value(_characterId!),
        firstName: Value(_firstName.text.trim()),
        lastName: Value(_nullIfEmpty(_lastName.text)),
        aliasNickname: Value(_nullIfEmpty(_alias.text)),
        race: Value(_nullIfEmpty(_race.text)),
        gender: Value(_nullIfEmpty(_gender.text)),
        age: Value(_nullIfEmpty(_age.text)),
        occupation: Value(_nullIfEmpty(_occupation.text)),
        factionId: Value(_factionId),
        status: Value(_nullIfEmpty(_status.text)),
        physicalDescription: Value(_nullIfEmpty(_physicalDescription.text)),
        personality: Value(_nullIfEmpty(_personality.text)),
        backstory: Value(_nullIfEmpty(_backstory.text)),
        abilities: Value(_nullIfEmpty(_abilities.text)),
        notes: Value(_nullIfEmpty(_notes.text)),
        portraitImagePath: Value(_portraitPath),
        role: Value(_role),
        updatedAt: Value(DateTime.now()),
      ),
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L.of(context).charSaved)),
      );
    }
  }

  Future<void> _delete() async {
    if (_characterId == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L.of(context).charDeleteTitle),
        content: Text(L.of(context).charDeleteBody),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(L.of(context).commonCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(L.of(context).commonDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(imageStorageServiceProvider).deleteImage(_portraitPath);
    await ref.read(characterDaoProvider).deleteCharacter(_characterId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final l = L.of(context);
    final factionsAsync = ref.watch(factionsStreamProvider(widget.projectId));
    final projectAsync = ref.watch(projectStreamProvider(widget.projectId));
    final isCampaign = projectAsync.valueOrNull?.kind == ProjectKind.dnd;

    return Scaffold(
      appBar: AppBar(
        title: Text(_characterId == null ? l.charNew : l.charEdit),
        actions: [
          if (_characterId != null)
            IconButton(icon: const Icon(Icons.delete_outline), onPressed: _delete),
          IconButton(icon: const Icon(Icons.check), tooltip: l.commonSave, onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_characterId != null) ...[
              Center(
                child: ImageOrDrawingPicker(
                  projectId: widget.projectId,
                  imagePath: _portraitPath,
                  onChanged: (path) {
                    setState(() => _portraitPath = path);
                    ref.read(characterDaoProvider).updateCharacter(
                          CharactersCompanion(
                            id: Value(_characterId!),
                            portraitImagePath: Value(path),
                          ),
                        );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
            _SectionCard(
              title: l.charSectionBasics,
              children: [
                TextFormField(
                  controller: _firstName,
                  decoration: InputDecoration(labelText: l.charFirstName),
                  validator: (v) => (v == null || v.trim().isEmpty) ? l.commonRequired : null,
                ),
                TextFormField(
                  controller: _lastName,
                  decoration: InputDecoration(labelText: l.charLastName),
                ),
                TextFormField(
                  controller: _alias,
                  decoration: InputDecoration(labelText: l.charAlias),
                ),
                TextFormField(
                  controller: _race,
                  decoration: InputDecoration(labelText: l.charRace),
                ),
                TextFormField(
                  controller: _gender,
                  decoration: InputDecoration(labelText: l.charGender),
                ),
                TextFormField(
                  controller: _age,
                  decoration: InputDecoration(labelText: l.charAge),
                ),
                TextFormField(
                  controller: _occupation,
                  decoration: InputDecoration(labelText: l.charOccupation),
                ),
                factionsAsync.when(
                  data: (factions) => DropdownButtonFormField<String?>(
                    initialValue: _factionId,
                    decoration: InputDecoration(labelText: l.charFaction),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('Ninguna')),
                      for (final f in factions) DropdownMenuItem(value: f.id, child: Text(f.name)),
                    ],
                    onChanged: (v) => setState(() => _factionId = v),
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (e, st) => Text('Error: $e'),
                ),
                TextFormField(
                  controller: _status,
                  decoration: InputDecoration(
                    labelText: l.charStatus,
                    hintText: l.charStatusHint,
                  ),
                ),
                if (isCampaign)
                  DropdownButtonFormField<String?>(
                    initialValue: _role,
                    decoration: InputDecoration(labelText: l.charRole),
                    items: [
                      DropdownMenuItem(value: null, child: Text(l.charRoleUndefined)),
                      DropdownMenuItem(
                          value: CharacterRole.pc, child: Text(l.charRolePc)),
                      DropdownMenuItem(
                          value: CharacterRole.npc, child: Text(l.charRoleNpc)),
                      DropdownMenuItem(
                          value: CharacterRole.enemy, child: Text(l.charRoleEnemy)),
                    ],
                    onChanged: (v) => setState(() => _role = v),
                  ),
              ],
            ),
            if (isCampaign && _characterId != null)
              DndSheetSection(characterId: _characterId!),
            _SectionCard(
              title: l.charAppearance,
              children: [
                TextFormField(
                  controller: _physicalDescription,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 4,
                ),
              ],
            ),
            _SectionCard(
              title: l.charPersonality,
              children: [
                TextFormField(
                  controller: _personality,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 4,
                ),
              ],
            ),
            _SectionCard(
              title: l.charBackstory,
              children: [
                TextFormField(
                  controller: _backstory,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 6,
                ),
              ],
            ),
            _SectionCard(
              title: l.charAbilities,
              children: [
                TextFormField(
                  controller: _abilities,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 4,
                ),
              ],
            ),
            _SectionCard(
              title: l.charNotes,
              children: [
                TextFormField(
                  controller: _notes,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 4,
                ),
              ],
            ),
            if (_characterId != null) ...[
              const SizedBox(height: 8),
              _AppearancesSection(
                projectId: widget.projectId,
                characterId: _characterId!,
                isCampaign: isCampaign,
              ),
              const SizedBox(height: 16),
              RelationshipsSection(projectId: widget.projectId, characterId: _characterId!),
              const SizedBox(height: 16),
              FamilySection(
                projectId: widget.projectId,
                characterId: _characterId!,
              ),
              const SizedBox(height: 16),
              CustomFieldsSection(
                projectId: widget.projectId,
                entityType: TagEntity.character,
                entityId: _characterId!,
              ),
              const SizedBox(height: 16),
              TagsField(
                projectId: widget.projectId,
                entityType: TagEntity.character,
                entityId: _characterId!,
              ),
            ] else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  l.charSaveFirst,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final child in children)
              Padding(padding: const EdgeInsets.only(bottom: 8), child: child),
          ],
        ),
      ),
    );
  }
}

/// Where this character shows up in the story.
///
/// The link is recorded on the chapter side; reading it back here is what
/// makes it possible to follow one character's arc without opening every
/// chapter to check.
class _AppearancesSection extends ConsumerWidget {
  const _AppearancesSection({
    required this.projectId,
    required this.characterId,
    required this.isCampaign,
  });

  final String projectId;
  final String characterId;
  final bool isCampaign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final chaptersAsync =
        ref.watch(chaptersWithCharacterStreamProvider(characterId));


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isCampaign ? l.charAttendedSessions : l.charAppearsIn,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        chaptersAsync.when(
          data: (chapters) {
            if (chapters.isEmpty) {
              return Text(
                isCampaign
                    ? l.charNoAppearancesSessions
                    : l.charNoAppearancesChapters,
                style: Theme.of(context).textTheme.bodySmall,
              );
            }
            return Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final chapter in chapters)
                  ActionChip(
                    avatar: const Icon(Icons.menu_book_outlined, size: 16),
                    label: Text(chapter.title),
                    onPressed: () => context.push(
                      '/project/$projectId/chapters/${chapter.id}',
                    ),
                  ),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ],
    );
  }
}
