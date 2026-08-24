// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LEn extends L {
  LEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Astrolabe';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonClose => 'Close';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonRequired => 'Required';

  @override
  String get commonOptional => 'optional';

  @override
  String get commonNone => 'None';

  @override
  String commonError(String message) {
    return 'Error: $message';
  }

  @override
  String get commonSearch => 'Search';

  @override
  String get commonSearchHint => 'Search...';

  @override
  String get commonNoMatches => 'Nothing matches your search.';

  @override
  String commonSelectedCount(int count) {
    return '$count selected';
  }

  @override
  String commonSelectedCountFiltered(int count, int hidden) {
    return '$count selected · $hidden hidden by the filter';
  }

  @override
  String get projectsTitle => 'My universes';

  @override
  String get projectsEmpty =>
      'You haven\'t created a book or universe yet.\nTap + to begin.';

  @override
  String get projectsKindNovel => 'Book / novel';

  @override
  String get projectsKindCampaign => 'Tabletop campaign';

  @override
  String get projectNew => 'New universe';

  @override
  String get projectEdit => 'Edit universe';

  @override
  String get projectName => 'Name';

  @override
  String get projectDescription => 'Description (optional)';

  @override
  String get projectPurpose => 'What is it for?';

  @override
  String get projectKindBook => 'Book';

  @override
  String get projectKindCampaignShort => 'Campaign';

  @override
  String get projectHintCampaign => 'Adds character sheets, sessions and dice.';

  @override
  String get projectHintNovel => 'Adds chapters and writing notes.';

  @override
  String get projectAesthetic => 'Look';

  @override
  String get projectCover => 'Cover';

  @override
  String get projectSaveFirstForCover =>
      'Save the universe first to choose or draw its cover.';

  @override
  String get projectDeleteTitle => 'Delete universe';

  @override
  String projectDeleteBody(String name) {
    return 'Delete \"$name\"? All of its characters, places, factions and events will be removed. This cannot be undone.';
  }

  @override
  String get sectionCharacters => 'Characters';

  @override
  String get sectionWorld => 'World';

  @override
  String get sectionFactions => 'Factions';

  @override
  String get sectionTimeline => 'Timeline';

  @override
  String get sectionChapters => 'Chapters';

  @override
  String get sectionSessions => 'Sessions';

  @override
  String get sectionNotes => 'Notes';

  @override
  String get sectionItems => 'Items';

  @override
  String get sectionMagic => 'Magic';

  @override
  String get toolFamilyTree => 'Family tree';

  @override
  String get toolSecrets => 'Secrets';

  @override
  String get toolDice => 'Dice';

  @override
  String get toolAppearance => 'Appearance';

  @override
  String get toolBackup => 'Export / back up';

  @override
  String get drawerUniverse => 'Universe';

  @override
  String get drawerMyUniverses => 'My universes';

  @override
  String get searchWholeUniverse => 'Search the whole universe';

  @override
  String get supportTitle => 'Buy me a coffee';

  @override
  String get supportSubtitle =>
      'If the app helps you and you\'d like to support it';

  @override
  String get supportBody =>
      'Astrolabe is free and ad-free. If it\'s useful to you and you\'d like to support it, you can send something from any Colombian bank using this Bre-B key.';

  @override
  String get supportKeyLabel => 'Bre-B key';

  @override
  String get supportCopyKey => 'Copy key';

  @override
  String get supportCopied =>
      'Key copied. Paste it into your banking app under \"Send with Bre-B\".';

  @override
  String get supportHow =>
      'How: open your banking app (Nequi, Daviplata, Bancolombia, whichever you use), find \"Send with Bre-B\" and paste the key.';

  @override
  String get settingsSecurity => 'Security';

  @override
  String get appearanceTitle => 'Appearance';

  @override
  String get appearanceBrightness => 'Brightness';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceAuto => 'Auto';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceBrightnessNote =>
      'This setting applies to the whole app.';

  @override
  String get appearanceThemeTitle => 'Theme for this universe';

  @override
  String get appearanceThemeNote =>
      'Each universe keeps its own theme, so your medieval saga and your cyberpunk campaign don\'t have to look alike.';

  @override
  String get appearanceButtonSample => 'Button';

  @override
  String get appearanceButtonOther => 'Other';

  @override
  String get appearanceSystemFont => 'System';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSystem => 'Automatic (device language)';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageNote =>
      'Changes the app\'s language. Your universes and anything you write are not translated.';

  @override
  String get charSearchHint => 'Search characters...';

  @override
  String get charEmpty => 'No characters yet. Tap + to create one.';

  @override
  String get charNoMatch => 'No character matches your search.';

  @override
  String get charFilterAll => 'All';

  @override
  String get charNew => 'New character';

  @override
  String get charEdit => 'Edit character';

  @override
  String get charSaved => 'Character saved';

  @override
  String get charDeleteTitle => 'Delete character';

  @override
  String get charDeleteBody => 'Delete this character?';

  @override
  String get charSectionBasics => 'Basics';

  @override
  String get charFirstName => 'First name *';

  @override
  String get charLastName => 'Surname (optional)';

  @override
  String get charAlias => 'Alias / nickname (optional)';

  @override
  String get charRace => 'Race / species (optional)';

  @override
  String get charGender => 'Gender (optional)';

  @override
  String get charAge => 'Age (optional)';

  @override
  String get charOccupation => 'Occupation (optional)';

  @override
  String get charFaction => 'Faction / house (optional)';

  @override
  String get charStatus => 'Status';

  @override
  String get charStatusHint => 'Alive, dead, missing...';

  @override
  String get charRole => 'Table role (optional)';

  @override
  String get charRoleUndefined => 'Not set';

  @override
  String get charRolePc => 'Player (PC)';

  @override
  String get charRoleNpc => 'NPC';

  @override
  String get charRoleEnemy => 'Enemy';

  @override
  String get charAppearance => 'Appearance (optional)';

  @override
  String get charPersonality => 'Personality (optional)';

  @override
  String get charBackstory => 'Backstory (optional)';

  @override
  String get charAbilities => 'Abilities (optional)';

  @override
  String get charNotes => 'Notes (optional)';

  @override
  String get charSaveFirst =>
      'Save the character to add an image and relationships.';

  @override
  String get charAppearsIn => 'Appears in';

  @override
  String get charAttendedSessions => 'Sessions attended';

  @override
  String get charNoAppearancesChapters =>
      'Not marked in any chapter yet. You do that from the chapter, not here.';

  @override
  String get charNoAppearancesSessions =>
      'Not marked in any session yet. You do that from the session, not here.';

  @override
  String get worldEmpty =>
      'No places yet. Create the first one with the + button.';

  @override
  String get worldAddSub => 'Add sub-place';

  @override
  String get worldViewMap => 'View map';

  @override
  String get worldViewDetails => 'View / edit this place';

  @override
  String get locNew => 'New place';

  @override
  String get locEdit => 'Edit place';

  @override
  String get locSaved => 'Place saved';

  @override
  String get locDeleteTitle => 'Delete place';

  @override
  String locDeleteBody(String name) {
    return 'Delete \"$name\"? Its sub-places will be removed too.';
  }

  @override
  String get locDeleteBodyPlain =>
      'Delete this place? Its sub-places will be removed too.';

  @override
  String get locName => 'Name *';

  @override
  String get locType => 'Type (optional)';

  @override
  String get locTypeHint => 'Continent, kingdom, city, forest...';

  @override
  String get locParent => 'Contained in (optional)';

  @override
  String get locParentRoot => 'None (top level)';

  @override
  String get locClimate => 'Climate (optional)';

  @override
  String get locPopulation => 'Population (optional)';

  @override
  String get locGovernment => 'Government (optional)';

  @override
  String get locStatus => 'Status (optional)';

  @override
  String get locDescription => 'Description (optional)';

  @override
  String get locMapLabel => 'Map / image';

  @override
  String get locMapPending => 'Map of this place';

  @override
  String get locMapPendingHint =>
      'Save the place (✓ above) and you can upload or draw a map here.';

  @override
  String get locOpenInteractiveMap => 'Open interactive map';

  @override
  String get locCycleWarning => 'That link would create a loop in the tree.';

  @override
  String get facEmpty => 'No factions yet. Tap + to create one.';

  @override
  String get facNew => 'New faction';

  @override
  String get facEdit => 'Edit faction';

  @override
  String get facSaved => 'Faction saved';

  @override
  String get facDeleteTitle => 'Delete faction';

  @override
  String get facDeleteBody =>
      'Delete this faction? Its members will simply stop belonging to it.';

  @override
  String get facName => 'Name *';

  @override
  String get facType => 'Type (optional)';

  @override
  String get facTypeHint => 'House, guild, kingdom, army...';

  @override
  String get facStatus => 'Status (optional)';

  @override
  String get facDescription => 'Description (optional)';

  @override
  String get facSymbol => 'Symbol / banner';

  @override
  String get facMembers => 'Members';

  @override
  String get facNoMembers => 'No character belongs to this faction yet.';

  @override
  String get itemEmpty =>
      'No items yet. Tap + to add a relic, weapon or artefact.';

  @override
  String get itemNew => 'New item';

  @override
  String get itemEdit => 'Edit item';

  @override
  String get itemSaved => 'Item saved';

  @override
  String get itemDeleteTitle => 'Delete item';

  @override
  String get itemDeleteBody => 'Delete this item?';

  @override
  String get itemName => 'Name *';

  @override
  String get itemType => 'Type (optional)';

  @override
  String get itemTypeHint => 'Weapon, relic, book, amulet...';

  @override
  String get itemOwner => 'Current bearer (optional)';

  @override
  String get itemOwnerNone => 'Nobody';

  @override
  String get itemLocation => 'Location (optional)';

  @override
  String get itemLocationUnknown => 'Unknown';

  @override
  String get itemOrigin => 'Origin (optional)';

  @override
  String get itemPowers => 'Powers / properties (optional)';

  @override
  String get itemDescription => 'Description (optional)';

  @override
  String get itemImage => 'Item image';

  @override
  String get magicEmpty =>
      'No magic systems yet. Tap + to define how magic (or technology) works in your world.';

  @override
  String get magicNew => 'New system';

  @override
  String get magicEdit => 'Edit system';

  @override
  String get magicSaved => 'Magic system saved';

  @override
  String get magicDeleteTitle => 'Delete system';

  @override
  String get magicDeleteBody => 'Delete this magic system?';

  @override
  String get magicName => 'Name *';

  @override
  String get magicSource => 'Source of power (optional)';

  @override
  String get magicSourceHint => 'The gods, blood, runes, the aether...';

  @override
  String get magicRules => 'Rules / how it works (optional)';

  @override
  String get magicLimits => 'Limitations (optional)';

  @override
  String get magicCost => 'Cost / price paid (optional)';

  @override
  String get magicDescription => 'General description (optional)';

  @override
  String get magicSymbol => 'Symbol / diagram';

  @override
  String get timelineEmpty =>
      'No events yet. Create the first one with the + button.';

  @override
  String get timelineSortByYear => 'Sort by year';

  @override
  String get timelineSortByYearOn =>
      'Chronological. Events with no year go last.';

  @override
  String get timelineSortByYearOff => 'Manual order: drag to rearrange.';

  @override
  String get timelineAutoChapters => 'Include chapters automatically';

  @override
  String get timelineAutoChaptersOn =>
      'Chapters with a summary appear here and stay up to date.';

  @override
  String get timelineAutoChaptersOff =>
      'Turn it on so each chapter summary appears on the timeline.';

  @override
  String get timelineAutoOffNotice =>
      'Chapter-sourced events were removed. The ones you made by hand are untouched.';

  @override
  String get timelineFromChapter => 'From a chapter';

  @override
  String timelineYearChip(int year) {
    return 'Year $year';
  }

  @override
  String get eventNew => 'New event';

  @override
  String get eventEdit => 'Edit event';

  @override
  String get eventSaved => 'Event saved';

  @override
  String get eventDeleteTitle => 'Delete event';

  @override
  String get eventDeleteBody => 'Remove this event from the timeline?';

  @override
  String eventDeleteNamed(String title) {
    return 'Delete \"$title\"?';
  }

  @override
  String get eventLinkedTitle => 'This event comes from a chapter';

  @override
  String get eventLinkedBody =>
      'Its title, summary and year update themselves when you edit the chapter. To word it differently here, unlink it.';

  @override
  String get eventUnlink => 'Unlink from chapter';

  @override
  String get eventTitle => 'Title *';

  @override
  String get eventYear => 'Year (optional)';

  @override
  String get eventYearHelp => 'Numbers only. Used to sort chronologically.';

  @override
  String get eventFictionalDate => 'In-story date (optional)';

  @override
  String get eventFictionalDateHint =>
      'Year 3 of the Third Age, 12th of winter...';

  @override
  String get eventPlace => 'Place (optional)';

  @override
  String get eventDescription => 'Description (optional)';

  @override
  String get eventPeople => 'Characters involved';

  @override
  String get eventNoCharacters => 'No characters in this project yet.';

  @override
  String get chapEmptyChapters =>
      'No chapters yet. Tap + to create the first one.';

  @override
  String get chapNewChapter => 'New chapter';

  @override
  String get chapEditChapter => 'Edit chapter';

  @override
  String get chapNewSession => 'New session';

  @override
  String get chapEditSession => 'Edit session';

  @override
  String get chapSaved => 'Chapter saved';

  @override
  String get chapDeleteTitle => 'Delete chapter';

  @override
  String get chapDeleteBody => 'Delete this chapter?';

  @override
  String chapDeleteNamed(String title) {
    return 'Delete \"$title\"?';
  }

  @override
  String get chapTitle => 'Title *';

  @override
  String get chapStatus => 'Status (optional)';

  @override
  String get chapStatusHintChapter => 'Draft, revised, finished...';

  @override
  String get chapStatusHintSession => 'Played, pending, cancelled...';

  @override
  String get chapPlayedOn => 'Date played';

  @override
  String get chapNoDate => 'No date';

  @override
  String get chapStoryYear => 'In-story year (optional)';

  @override
  String get chapStoryYearHelp => 'Used to place it on the timeline.';

  @override
  String get chapSummary => 'Summary (optional)';

  @override
  String get chapSummaryHelp =>
      'If you turn the option on, it appears on the timeline.';

  @override
  String get chapContent => 'Content';

  @override
  String get chapContentSaveFirst => 'Save first (✓ above) to start writing.';

  @override
  String get chapContentEmpty => 'Empty. Tap to write.';

  @override
  String chapWordCount(int count) {
    return '$count words';
  }

  @override
  String chapWordCountGoal(int count, int goal) {
    return '$count of $goal words';
  }

  @override
  String get chapAddToTimeline => 'Add to the timeline';

  @override
  String get chapAddedToTimeline =>
      'Added to the timeline. You can edit it freely there.';

  @override
  String get chapWhoAttended => 'Who attended';

  @override
  String get chapWhoAppears => 'Characters who appear';

  @override
  String get chapNoCharacters => 'No characters in this universe yet.';

  @override
  String get chapPlaces => 'Places where it happens';

  @override
  String get chapNoPlaces => 'No places in this universe yet.';

  @override
  String get searchPlaceHint => 'Search places...';

  @override
  String get editorHint => 'Write here...';

  @override
  String get editorFocusMode => 'Distraction-free mode';

  @override
  String get editorExitFocus => 'Leave distraction-free mode';

  @override
  String get editorSaving => 'Saving';

  @override
  String get editorSaved => 'Saved';

  @override
  String get editorUnsaved => 'Unsaved';

  @override
  String get editorBold => 'Bold';

  @override
  String get editorItalic => 'Italic';

  @override
  String get editorSubheading => 'Subheading';

  @override
  String get editorSceneBreak => 'Scene break';

  @override
  String get editorGoalTitle => 'Word goal';

  @override
  String get editorGoalLabel => 'Words for this chapter';

  @override
  String get editorGoalRemove => 'Remove goal';

  @override
  String get noteEmpty => 'No notes yet. Tap + to write one.';

  @override
  String get noteNew => 'New note';

  @override
  String get noteEdit => 'Edit note';

  @override
  String get noteDeleteTitle => 'Delete note';

  @override
  String noteDeleteNamed(String title) {
    return 'Delete \"$title\"?';
  }

  @override
  String get noteTitle => 'Title';

  @override
  String get noteContent => 'Content';
}
