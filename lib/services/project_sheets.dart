/// Turns the stored records into printable sheets. One place decides what
/// goes on a character's page, so the export cannot drift from the app.
library;

import '../data/database.dart';
import '../l10n/app_localizations.dart';
import 'sheets.dart';

/// Whether a kind of record takes its pictures along.
typedef WithImages = bool;

Sheet characterSheet(
  Character character,
  L l, {
  String? factionName,
  WithImages images = true,
}) {
  final name = '${character.firstName} ${character.lastName ?? ''}'.trim();

  return Sheet(
    title: name,
    subtitle: character.aliasNickname,
    imagePath: images ? character.portraitImagePath : null,
    fields: fieldsOf({
      l.sheetRace: character.race,
      l.sheetGender: character.gender,
      l.sheetAge: character.age,
      l.sheetOccupation: character.occupation,
      l.sheetFaction: factionName,
      l.sheetStatus: character.status,
    }),
    sections: sectionsOf({
      l.sheetAppearance: character.physicalDescription,
      l.sheetPersonality: character.personality,
      l.sheetBackstory: character.backstory,
      l.sheetAbilities: character.abilities,
      l.sheetNotes: character.notes,
    }),
  );
}

Sheet factionSheet(Faction faction, L l, {WithImages images = true}) {
  return Sheet(
    title: faction.name,
    subtitle: faction.type,
    imagePath: images ? faction.symbolImagePath : null,
    fields: fieldsOf({
      l.sheetType: faction.type,
      l.sheetStatus: faction.status,
    }),
    sections: sectionsOf({l.sheetDescription: faction.description}),
  );
}

Sheet locationSheet(
  Location location,
  L l, {
  String? parentName,
  WithImages images = true,
}) {
  return Sheet(
    title: location.name,
    subtitle: location.type,
    imagePath: images ? location.mapImagePath : null,
    fields: fieldsOf({
      l.sheetType: location.type,
      l.sheetPartOf: parentName,
      l.sheetClimate: location.climate,
      l.sheetPopulation: location.population,
      l.sheetGovernment: location.government,
      l.sheetStatus: location.status,
    }),
    sections: sectionsOf({l.sheetDescription: location.description}),
  );
}

Sheet itemSheet(
  Item item,
  L l, {
  String? ownerName,
  String? locationName,
  WithImages images = true,
}) {
  return Sheet(
    title: item.name,
    subtitle: item.type,
    imagePath: images ? item.imagePath : null,
    fields: fieldsOf({
      l.sheetType: item.type,
      l.sheetOwner: ownerName,
      l.sheetWhere: locationName,
    }),
    sections: sectionsOf({
      l.sheetDescription: item.description,
      l.sheetPowers: item.powers,
      l.sheetOrigin: item.origin,
    }),
  );
}

Sheet magicSheet(MagicSystem magic, L l, {WithImages images = true}) {
  return Sheet(
    title: magic.name,
    imagePath: images ? magic.imagePath : null,
    fields: fieldsOf({l.sheetSource: magic.source}),
    sections: sectionsOf({
      l.sheetDescription: magic.description,
      l.sheetRules: magic.rules,
      l.sheetLimits: magic.limitations,
      l.sheetCost: magic.cost,
    }),
  );
}
