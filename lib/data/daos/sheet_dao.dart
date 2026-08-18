import 'package:drift/drift.dart';

import '../database.dart';
import '../tables.dart';

part 'sheet_dao.g.dart';

/// The six 5e ability scores, in the canonical order sheets print them.
const abilityKeys = <String>[
  'strength',
  'dexterity',
  'constitution',
  'intelligence',
  'wisdom',
  'charisma',
];

const abilityLabels = <String, String>{
  'strength': 'Fuerza',
  'dexterity': 'Destreza',
  'constitution': 'Constitución',
  'intelligence': 'Inteligencia',
  'wisdom': 'Sabiduría',
  'charisma': 'Carisma',
};

/// 5e modifier: floor((score - 10) / 2), which for negatives must round
/// *down*, not toward zero the way Dart's ~/ does.
int abilityModifier(int score) => ((score - 10) / 2).floor();

/// 5e proficiency bonus by level: +2 at 1-4, +3 at 5-8, and so on.
int proficiencyBonusForLevel(int level) => 2 + ((level.clamp(1, 20) - 1) ~/ 4);

@DriftAccessor(tables: [CharacterSheets])
class SheetDao extends DatabaseAccessor<AppDatabase> with _$SheetDaoMixin {
  SheetDao(super.db);

  Stream<CharacterSheet?> watchSheet(String characterId) {
    return (select(characterSheets)
          ..where((t) => t.characterId.equals(characterId)))
        .watchSingleOrNull();
  }

  Future<CharacterSheet?> getSheet(String characterId) {
    return (select(characterSheets)
          ..where((t) => t.characterId.equals(characterId)))
        .getSingleOrNull();
  }

  /// Upsert, so the caller never has to know whether a sheet exists yet.
  Future<void> saveSheet(CharacterSheetsCompanion entry) {
    return into(characterSheets).insertOnConflictUpdate(entry);
  }

  Future<void> deleteSheet(String characterId) {
    return (delete(characterSheets)
          ..where((t) => t.characterId.equals(characterId)))
        .go();
  }
}
