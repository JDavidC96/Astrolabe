import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/daos/sheet_dao.dart';
import '../providers/core_providers.dart';
import '../providers/data_providers.dart';

/// The six ability names, resolved per language. The keys themselves stay
/// English because they are column names, not display text.
String _abilityLabel(L l, String key) {
  switch (key) {
    case 'strength':
      return l.abilityStrength;
    case 'dexterity':
      return l.abilityDexterity;
    case 'constitution':
      return l.abilityConstitution;
    case 'intelligence':
      return l.abilityIntelligence;
    case 'wisdom':
      return l.abilityWisdom;
    case 'charisma':
      return l.abilityCharisma;
  }
  return key;
}

/// D&D 5e statistics for one character. Modifiers, saving throws and the
/// proficiency bonus are derived, never stored, so they can't drift out of
/// sync with the scores they come from.
class DndSheetSection extends ConsumerStatefulWidget {
  const DndSheetSection({super.key, required this.characterId});

  final String characterId;

  @override
  ConsumerState<DndSheetSection> createState() => _DndSheetSectionState();
}

class _DndSheetSectionState extends ConsumerState<DndSheetSection> {
  final _controllers = <String, TextEditingController>{};
  Set<String> _saveProficiencies = {};
  bool _initialized = false;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  TextEditingController _controllerFor(String key, String initial) {
    return _controllers.putIfAbsent(
      key,
      () => TextEditingController(text: initial),
    );
  }

  void _hydrate(CharacterSheet? sheet) {
    if (_initialized) return;
    _initialized = true;
    _controllerFor('className', sheet?.className ?? '');
    _controllerFor('level', sheet?.level?.toString() ?? '');
    _controllerFor('maxHitPoints', sheet?.maxHitPoints?.toString() ?? '');
    _controllerFor('currentHitPoints', sheet?.currentHitPoints?.toString() ?? '');
    _controllerFor('armorClass', sheet?.armorClass?.toString() ?? '');
    _controllerFor('speed', sheet?.speed?.toString() ?? '');
    _controllerFor('alignment', sheet?.alignment ?? '');
    _controllerFor('background', sheet?.background ?? '');
    _controllerFor('features', sheet?.features ?? '');
    _controllerFor('equipment', sheet?.equipment ?? '');
    for (final key in abilityKeys) {
      _controllerFor(key, _abilityValue(sheet, key)?.toString() ?? '');
    }
    _saveProficiencies = (sheet?.savingThrowProficiencies ?? '')
        .split(',')
        .where((s) => s.isNotEmpty)
        .toSet();
  }

  static int? _abilityValue(CharacterSheet? sheet, String key) {
    if (sheet == null) return null;
    switch (key) {
      case 'strength':
        return sheet.strength;
      case 'dexterity':
        return sheet.dexterity;
      case 'constitution':
        return sheet.constitution;
      case 'intelligence':
        return sheet.intelligence;
      case 'wisdom':
        return sheet.wisdom;
      case 'charisma':
        return sheet.charisma;
    }
    return null;
  }

  int? _intOf(String key) {
    final text = _controllers[key]?.text.trim() ?? '';
    return text.isEmpty ? null : int.tryParse(text);
  }

  String? _textOf(String key) {
    final text = _controllers[key]?.text.trim() ?? '';
    return text.isEmpty ? null : text;
  }

  Future<void> _save() async {
    await ref.read(sheetDaoProvider).saveSheet(
          CharacterSheetsCompanion(
            characterId: Value(widget.characterId),
            className: Value(_textOf('className')),
            level: Value(_intOf('level')),
            strength: Value(_intOf('strength')),
            dexterity: Value(_intOf('dexterity')),
            constitution: Value(_intOf('constitution')),
            intelligence: Value(_intOf('intelligence')),
            wisdom: Value(_intOf('wisdom')),
            charisma: Value(_intOf('charisma')),
            maxHitPoints: Value(_intOf('maxHitPoints')),
            currentHitPoints: Value(_intOf('currentHitPoints')),
            armorClass: Value(_intOf('armorClass')),
            speed: Value(_intOf('speed')),
            alignment: Value(_textOf('alignment')),
            background: Value(_textOf('background')),
            savingThrowProficiencies:
                Value(_saveProficiencies.isEmpty ? null : _saveProficiencies.join(',')),
            features: Value(_textOf('features')),
            equipment: Value(_textOf('equipment')),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final sheetAsync = ref.watch(characterSheetStreamProvider(widget.characterId));

    return sheetAsync.when(
      data: (sheet) {
        _hydrate(sheet);
        final level = _intOf('level') ?? 1;
        final proficiency = proficiencyBonusForLevel(level);

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l.sheetTitle,
                        style: Theme.of(context).textTheme.titleMedium),
                    Chip(
                      label: Text(l.sheetProficiency(proficiency)),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _field('className', l.sheetClass),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: _numberField('level', l.sheetLevel)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _numberField('armorClass', l.sheetArmorClass)),
                    const SizedBox(width: 8),
                    Expanded(child: _numberField('currentHitPoints', l.sheetHp)),
                    const SizedBox(width: 8),
                    Expanded(child: _numberField('maxHitPoints', l.sheetMaxHp)),
                    const SizedBox(width: 8),
                    Expanded(child: _numberField('speed', l.sheetSpeed)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(l.sheetAbilities,
                    style: Theme.of(context).textTheme.labelLarge),
                Text(l.sheetAbilitiesHint,
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                for (final key in abilityKeys) _abilityRow(key, proficiency),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _field('alignment', l.sheetAlignment)),
                    const SizedBox(width: 8),
                    Expanded(child: _field('background', l.sheetBackground)),
                  ],
                ),
                const SizedBox(height: 8),
                _field('features', l.sheetFeatures, maxLines: 4),
                const SizedBox(height: 8),
                _field('equipment', l.sheetEquipment, maxLines: 4),
              ],
            ),
          ),
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, st) => Text('Error: $e'),
    );
  }

  Widget _field(String key, String label, {int maxLines = 1}) {
    return TextField(
      controller: _controllers[key],
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: maxLines > 1 ? const OutlineInputBorder() : null,
      ),
      maxLines: maxLines,
      onTapOutside: (_) => _save(),
      onSubmitted: (_) => _save(),
    );
  }

  Widget _numberField(String key, String label) {
    return TextField(
      controller: _controllers[key],
      decoration: InputDecoration(labelText: label, isDense: true),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: (_) => setState(() {}),
      onTapOutside: (_) => _save(),
      onSubmitted: (_) => _save(),
    );
  }

  Widget _abilityRow(String key, int proficiency) {
    final score = _intOf(key);
    final modifier = score == null ? null : abilityModifier(score);
    final isProficient = _saveProficiencies.contains(key);
    final save = modifier == null
        ? null
        : modifier + (isProficient ? proficiency : 0);

    String signed(int? value) =>
        value == null ? '—' : (value >= 0 ? '+$value' : '$value');

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: _controllers[key],
              decoration: InputDecoration(
                labelText: _abilityLabel(L.of(context), key),
                isDense: true,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() {}),
              onTapOutside: (_) => _save(),
              onSubmitted: (_) => _save(),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Text(L.of(context).sheetModifier,
                    style: Theme.of(context).textTheme.labelSmall),
                Text(signed(modifier),
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          SizedBox(
            width: 56,
            child: Column(
              children: [
                Text(L.of(context).sheetSave,
                    style: Theme.of(context).textTheme.labelSmall),
                Text(signed(save),
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Checkbox(
            value: isProficient,
            onChanged: (checked) {
              setState(() {
                if (checked == true) {
                  _saveProficiencies.add(key);
                } else {
                  _saveProficiencies.remove(key);
                }
              });
              _save();
            },
          ),
        ],
      ),
    );
  }
}
