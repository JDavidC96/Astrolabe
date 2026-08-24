import 'package:drift/drift.dart';

/// What a project is for. Drives which sections and character fields the UI
/// offers — a novel has no armour class, a campaign has no chapters.
class ProjectKind {
  static const novel = 'novel';
  static const dnd = 'dnd';
}

class Projects extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get coverImagePath => text().nullable()();
  TextColumn get kind => text().withDefault(const Constant(ProjectKind.novel))();
  /// Visual theme id (see `theme/app_themes.dart`); each universe carries
  /// its own look so a medieval saga and a cyberpunk campaign don't share one.
  TextColumn get themeId => text().withDefault(const Constant('classic'))();
  /// When on, every chapter that has a summary is mirrored into the
  /// timeline and kept in sync with it.
  BoolColumn get autoChapterTimeline =>
      boolean().withDefault(const Constant(false))();
  /// Order the timeline by in-story year instead of manual drag order.
  BoolColumn get timelineSortByYear =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Factions extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get symbolImagePath => text().nullable()();
  BoolColumn get symbolIsDrawing => boolean().withDefault(const Constant(false))();
  TextColumn get status => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Locations extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get parentLocationId =>
      text().nullable().references(Locations, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get climate => text().nullable()();
  TextColumn get population => text().nullable()();
  TextColumn get government => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get mapImagePath => text().nullable()();
  BoolColumn get mapIsDrawing => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Characters extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get firstName => text()();
  TextColumn get lastName => text().nullable()();
  TextColumn get aliasNickname => text().nullable()();
  TextColumn get race => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get age => text().nullable()();
  TextColumn get occupation => text().nullable()();
  TextColumn get factionId =>
      text().nullable().references(Factions, #id, onDelete: KeyAction.setNull)();
  TextColumn get status => text().nullable()();
  TextColumn get physicalDescription => text().nullable()();
  TextColumn get personality => text().nullable()();
  TextColumn get backstory => text().nullable()();
  TextColumn get abilities => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get portraitImagePath => text().nullable()();
  BoolColumn get portraitIsDrawing => boolean().withDefault(const Constant(false))();
  /// 'pc' | 'npc' | 'enemy' — mainly for campaigns, harmless for novels.
  TextColumn get role => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class CharacterRole {
  static const pc = 'pc';
  static const npc = 'npc';
  static const enemy = 'enemy';
}

/// D&D 5e style statistics, kept in their own table so novel projects carry
/// no empty stat columns on every character.
class CharacterSheets extends Table {
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get className => text().nullable()();
  IntColumn get level => integer().nullable()();
  IntColumn get strength => integer().nullable()();
  IntColumn get dexterity => integer().nullable()();
  IntColumn get constitution => integer().nullable()();
  IntColumn get intelligence => integer().nullable()();
  IntColumn get wisdom => integer().nullable()();
  IntColumn get charisma => integer().nullable()();
  IntColumn get maxHitPoints => integer().nullable()();
  IntColumn get currentHitPoints => integer().nullable()();
  IntColumn get armorClass => integer().nullable()();
  IntColumn get speed => integer().nullable()();
  TextColumn get alignment => text().nullable()();
  TextColumn get background => text().nullable()();
  /// Comma-separated ability keys the character is proficient in for saves.
  TextColumn get savingThrowProficiencies => text().nullable()();
  TextColumn get skillProficiencies => text().nullable()();
  TextColumn get features => text().nullable()();
  TextColumn get equipment => text().nullable()();

  @override
  Set<Column> get primaryKey => {characterId};
}

/// A partnership between two characters — marriage, betrothal, or simply
/// the pair who had children together.
///
/// The pair is symmetric, so the DAO always stores it with the smaller id
/// first; that makes the composite key reject duplicates like (A,B)+(B,A).
class PartnerLinks extends Table {
  TextColumn get aId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get bId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  /// 'Matrimonio', 'Pareja', 'Prometidos', 'Amantes'...
  TextColumn get type => text().nullable()();
  /// 'Actual', 'Separados', 'Viudo', 'Anulado'...
  TextColumn get status => text().nullable()();

  @override
  Set<Column> get primaryKey => {aId, bId};
}

/// A directed parent -> child link. Family trees need direction, which the
/// undirected [CharacterRelationships] groups cannot express.
class FamilyLinks extends Table {
  TextColumn get parentId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get childId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {parentId, childId};
}

/// A piece of hidden information, and who is in on it — the classic
/// continuity trap of "wait, did she already know?".
class Secrets extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  /// Whose secret it is (the subject), if any.
  TextColumn get ownerCharacterId =>
      text().nullable().references(Characters, #id, onDelete: KeyAction.setNull)();
  TextColumn get status => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class SecretKnowers extends Table {
  TextColumn get secretId =>
      text().references(Secrets, #id, onDelete: KeyAction.cascade)();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  /// How they found out, and when in story time.
  TextColumn get howTheyKnow => text().nullable()();
  TextColumn get knownSince => text().nullable()();

  @override
  Set<Column> get primaryKey => {secretId, characterId};
}

/// User-defined extra fields on any entity, so the app fits systems it was
/// never explicitly designed for.
class CustomFields extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get label => text()();
  TextColumn get value => text().nullable()();
  IntColumn get sortIndex => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

/// A marker placed on a location's map image, pointing at something else in
/// the project.
///
/// [x] and [y] are stored as fractions of the image (0..1) rather than
/// pixels, so a pin stays on the same landmark at any zoom level, on any
/// screen size, and even if the image is later replaced by a larger scan.
class MapPins extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();

  /// The location whose map this pin sits on.
  TextColumn get mapLocationId =>
      text().references(Locations, #id, onDelete: KeyAction.cascade)();

  /// What the pin points to: 'location', 'character', 'item', 'event'.
  TextColumn get targetType => text()();
  TextColumn get targetId => text()();

  RealColumn get x => real()();
  RealColumn get y => real()();
  TextColumn get label => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class DiceRolls extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get expression => text()();
  IntColumn get total => integer()();
  /// Human-readable breakdown, e.g. "2d6 (4, 5) + 3".
  TextColumn get detail => text()();
  TextColumn get label => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class TimelineEvents extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get fictionalDate => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get locationId =>
      text().nullable().references(Locations, #id, onDelete: KeyAction.setNull)();
  /// Numeric in-story year, used to sort chronologically. Kept separate
  /// from [fictionalDate], which stays free text ("12 del invierno largo").
  IntColumn get year => integer().nullable()();
  /// Set when this event was mirrored from a chapter. The chapter owns the
  /// text while the link exists; unlinking turns it into a normal event.
  TextColumn get sourceChapterId =>
      text().nullable().references(Chapters, #id, onDelete: KeyAction.cascade)();
  IntColumn get sortIndex => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

/// A relationship groups two *or more* characters — sibling trios, a pact
/// between several houses, a party of adventurers — so membership lives in
/// [RelationshipMembers] rather than as a fixed pair of columns.
class CharacterRelationships extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get relationshipType => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class RelationshipMembers extends Table {
  TextColumn get relationshipId =>
      text().references(CharacterRelationships, #id, onDelete: KeyAction.cascade)();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  /// Optional per-member label, e.g. Aria is the "hermana mayor" of the trio.
  TextColumn get role => text().nullable()();

  @override
  Set<Column> get primaryKey => {relationshipId, characterId};
}

class EventCharacters extends Table {
  TextColumn get eventId =>
      text().references(TimelineEvents, #id, onDelete: KeyAction.cascade)();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {eventId, characterId};
}

class Chapters extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get summary => text().nullable()();
  TextColumn get content => text().nullable()();
  TextColumn get status => text().nullable()();
  /// Real-world date the session was played (campaigns only).
  DateTimeColumn get sessionDate => dateTime().nullable()();
  /// Target word count for this chapter, if the writer set one.
  IntColumn get wordGoal => integer().nullable()();
  /// In-story year this chapter happens in, used to place it on the
  /// timeline chronologically.
  IntColumn get storyYear => integer().nullable()();
  IntColumn get sortIndex => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class ChapterCharacters extends Table {
  TextColumn get chapterId =>
      text().references(Chapters, #id, onDelete: KeyAction.cascade)();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {chapterId, characterId};
}

class ChapterLocations extends Table {
  TextColumn get chapterId =>
      text().references(Chapters, #id, onDelete: KeyAction.cascade)();
  TextColumn get locationId =>
      text().references(Locations, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {chapterId, locationId};
}

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Items extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get type => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get powers => text().nullable()();
  TextColumn get origin => text().nullable()();
  TextColumn get ownerCharacterId =>
      text().nullable().references(Characters, #id, onDelete: KeyAction.setNull)();
  TextColumn get locationId =>
      text().nullable().references(Locations, #id, onDelete: KeyAction.setNull)();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class MagicSystems extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get rules => text().nullable()();
  TextColumn get limitations => text().nullable()();
  TextColumn get cost => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Tags extends Table {
  TextColumn get id => text()();
  TextColumn get projectId =>
      text().references(Projects, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  IntColumn get color => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Tags attach to any entity. [entityType] holds the kind ('character',
/// 'location', …) and [entityId] the row id; a polymorphic link keeps one
/// table instead of one join table per entity kind.
class TagLinks extends Table {
  TextColumn get tagId => text().references(Tags, #id, onDelete: KeyAction.cascade)();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();

  @override
  Set<Column> get primaryKey => {tagId, entityType, entityId};
}
