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
  String get sectionWrite => 'Write';

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
      'No chapters yet. Tap + and start writing the first one.';

  @override
  String get chapEditChapter => 'Edit chapter';

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
  String get chapResume => 'Continue writing';

  @override
  String get chapDetails => 'Details';

  @override
  String chapDefaultChapterTitle(int number) {
    return 'Chapter $number';
  }

  @override
  String chapDefaultSessionTitle(int number) {
    return 'Session $number';
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

  @override
  String get secretsTitle => 'Secrets';

  @override
  String get secretsEmpty =>
      'Record a secret and mark who knows it, how they found out, and since when.';

  @override
  String get secretNobodyKnows => 'Nobody knows yet';

  @override
  String secretKnownBy(String names) {
    return 'Known by: $names';
  }

  @override
  String secretOwnedBy(String name) {
    return 'Secret of: $name';
  }

  @override
  String get secretNew => 'New secret';

  @override
  String get secretEdit => 'Edit secret';

  @override
  String get secretLabel => 'Secret';

  @override
  String get secretHint => 'e.g. Aria is the rightful heir';

  @override
  String get secretDetails => 'Details (optional)';

  @override
  String get secretOwnerQuestion => 'Whose secret is it?';

  @override
  String get secretOwnerNobody => 'Nobody in particular';

  @override
  String get secretWhoKnows => 'Who knows?';

  @override
  String secretHowFound(String name) {
    return 'How did $name find out? (optional)';
  }

  @override
  String get secretNoCharacters => 'No characters yet.';

  @override
  String get diceTitle => 'Dice';

  @override
  String get diceClearHistory => 'Clear history';

  @override
  String get diceRollLabel => 'Roll';

  @override
  String get diceRollHint => 'd20, 2d6+3, 4d8-1';

  @override
  String get diceRollButton => 'Roll';

  @override
  String get diceDisadvantage => 'Disadvantage';

  @override
  String get diceNormal => 'Normal';

  @override
  String get diceAdvantage => 'Advantage';

  @override
  String get diceNoRolls => 'No rolls yet.';

  @override
  String get diceAdvantageWord => 'advantage';

  @override
  String get diceDisadvantageWord => 'disadvantage';

  @override
  String get searchTitle => 'Search the universe';

  @override
  String get searchHintLong => 'Search characters, places, items, chapters...';

  @override
  String get searchPrompt => 'Type to search the whole universe at once.';

  @override
  String get searchNoResults => 'No results.';

  @override
  String searchAllCount(int count) {
    return 'All ($count)';
  }

  @override
  String get searchKindCharacter => 'Character';

  @override
  String get searchKindLocation => 'Place';

  @override
  String get searchKindFaction => 'Faction';

  @override
  String get searchKindEvent => 'Event';

  @override
  String get searchKindItem => 'Item';

  @override
  String get searchKindMagic => 'Magic';

  @override
  String get searchKindChapter => 'Chapter';

  @override
  String get searchKindNote => 'Note';

  @override
  String get backupTitle => 'Export / back up';

  @override
  String get backupLocalTitle => 'Everything is stored on this device only';

  @override
  String get backupLocalBody =>
      'The app never uploads anything on its own. If you lose, wipe or change phone without a backup, the whole universe is gone.';

  @override
  String get backupTip =>
      'Tip: \"Export and share\" opens your phone\'s share sheet, where you can pick Google Drive (or any cloud app you have) to upload the backup in two taps without leaving the app.';

  @override
  String get backupIncludes =>
      'The backup includes characters, world, factions, timeline, chapters, notes, items, magic, tags and every image and drawing.';

  @override
  String get backupExportShare => 'Export and share';

  @override
  String get backupExportSave => 'Just save on the device';

  @override
  String backupLast(String path) {
    return 'Last backup:\n$path';
  }

  @override
  String backupSavedAt(String path) {
    return 'Backup saved to:\n$path';
  }

  @override
  String get backupShareText => 'Backup of my universe';

  @override
  String backupExportFailed(String error) {
    return 'Couldn\'t export: $error';
  }

  @override
  String get backupImportTitle => 'Import';

  @override
  String get backupImportBody =>
      'Restores a backup as a new universe. Nothing you already have is overwritten.';

  @override
  String get backupImportButton => 'Import backup (.wbz)';

  @override
  String get backupImportPick => 'Choose a backup (.wbz)';

  @override
  String get backupImported =>
      'Universe imported. Find it under \"My universes\".';

  @override
  String backupImportFailed(String error) {
    return 'Couldn\'t import: $error';
  }

  @override
  String get backupNotOurs =>
      'That file doesn\'t look like an Astrolabe backup.';

  @override
  String get backupTooNew =>
      'This backup was made by a newer version of the app.';

  @override
  String get familyTitle => 'Family tree';

  @override
  String get familyExport => 'Export';

  @override
  String get familyShareImage => 'Share image';

  @override
  String get familySaveImage => 'Save image';

  @override
  String get familyShareText => 'Family tree';

  @override
  String get familyNoCharacters => 'No characters yet.';

  @override
  String get familyNoLinks => 'No family links yet.';

  @override
  String get familyHint =>
      'Open a character and add parents, children or a partner under \"Family\".';

  @override
  String get familyUnlinked => 'No family recorded';

  @override
  String get familyNotReady => 'The tree is not ready yet.';

  @override
  String get familyNoImage => 'Couldn\'t generate the image.';

  @override
  String familyExportFailed(String error) {
    return 'Couldn\'t export: $error';
  }

  @override
  String familySavedAt(String path) {
    return 'Saved to:\n$path';
  }

  @override
  String get familySection => 'Family';

  @override
  String get familyViewTree => 'View tree';

  @override
  String get familyParents => 'Parents';

  @override
  String get familyChildren => 'Children';

  @override
  String get familyPartner => 'Partner';

  @override
  String get familyNoneRecorded => 'None recorded.';

  @override
  String get familyPickParent => 'Choose a parent';

  @override
  String get familyPickChild => 'Choose a child';

  @override
  String get familyPickPartner => 'Choose a partner';

  @override
  String get familyNoOthers => 'No other characters yet.';

  @override
  String get familyPartnerKind => 'What kind of bond?';

  @override
  String get familyDerived => 'Derived relationships';

  @override
  String get familyDerivedHint =>
      'Once you record parents and children, siblings, grandparents, uncles and cousins show up here on their own.';

  @override
  String get kinFullSiblings => 'Siblings (same parents)';

  @override
  String get kinHalfSiblings => 'Half-siblings';

  @override
  String get kinGrandparents => 'Grandparents';

  @override
  String get kinGrandchildren => 'Grandchildren';

  @override
  String get kinUncles => 'Uncles and aunts';

  @override
  String get kinNiblings => 'Nieces and nephews';

  @override
  String get kinCousins => 'Cousins';

  @override
  String get partnerMarriage => 'Marriage';

  @override
  String get partnerCouple => 'Partners';

  @override
  String get partnerEngaged => 'Engaged';

  @override
  String get partnerLovers => 'Lovers';

  @override
  String get partnerOther => 'Other';

  @override
  String get mapTitle => 'Map';

  @override
  String get mapPlaceMarkers => 'Place markers';

  @override
  String get mapDone => 'Done';

  @override
  String get mapEditHint =>
      'Tap the map to drop a marker. Drag a marker to move it.';

  @override
  String get mapNoFile => 'The map file couldn\'t be found.';

  @override
  String mapNoMapYet(String name) {
    return '\"$name\" has no map yet.';
  }

  @override
  String get mapNoMapHint =>
      'Open the place and upload or draw an image; then you can put markers on it.';

  @override
  String get mapOpenPlace => 'Open the place';

  @override
  String get mapWhatIsHere => 'What\'s at this spot?';

  @override
  String get mapRemoveMarker => 'Remove marker';

  @override
  String mapRemoveMarkerBody(String label) {
    return 'Remove \"$label\" from the map?';
  }

  @override
  String get mapThisMarker => 'this marker';

  @override
  String get mapSectionPlaces => 'Places';

  @override
  String get mapSectionCharacters => 'Characters';

  @override
  String get mapSectionItems => 'Items';

  @override
  String get relTitle => 'Relationships';

  @override
  String get relEmpty => 'No relationships recorded yet.';

  @override
  String get relNew => 'New relationship';

  @override
  String get relEdit => 'Edit relationship';

  @override
  String get relType => 'Kind of relationship';

  @override
  String get relTypeOther => 'Specify the kind';

  @override
  String get relPeople => 'Characters in this relationship';

  @override
  String get relPeopleHint =>
      'You can tick several: useful for sibling trios, alliances or groups.';

  @override
  String get relNoOthers => 'No other characters in this project.';

  @override
  String get relDescription => 'Description (optional)';

  @override
  String get relNoOtherPeople => 'No other characters';

  @override
  String get relKindFamily => 'Family';

  @override
  String get relKindSiblings => 'Siblings';

  @override
  String get relKindFriendship => 'Friendship';

  @override
  String get relKindRivalry => 'Rivalry';

  @override
  String get relKindEnmity => 'Enmity';

  @override
  String get relKindRomance => 'Romance';

  @override
  String get relKindMentor => 'Mentor';

  @override
  String get relKindApprentice => 'Apprentice';

  @override
  String get relKindAllies => 'Allies';

  @override
  String get relKindPact => 'Pact';

  @override
  String get relKindOther => 'Other';

  @override
  String get tagsTitle => 'Tags';

  @override
  String get tagsNone => 'No tags.';

  @override
  String get tagsNew => 'New tag';

  @override
  String get tagsHint => 'e.g. protagonist, capital, relic';

  @override
  String get customFieldsTitle => 'Custom fields';

  @override
  String get customFieldsEmpty => 'Add whatever your world or system needs.';

  @override
  String get customFieldNew => 'New field';

  @override
  String get customFieldName => 'Field name';

  @override
  String get customFieldNameHint =>
      'e.g. Strength, Native language, Threat level';

  @override
  String get customFieldValue => 'Value (optional)';

  @override
  String get customFieldRemove => 'Remove field';

  @override
  String get imageUpload => 'Upload image';

  @override
  String get imageDraw => 'Draw';

  @override
  String get drawingTitle => 'Draw';

  @override
  String get drawingBackground => 'Background image';

  @override
  String get drawingRemoveBackground => 'Remove background';

  @override
  String get drawingClear => 'Clear all';

  @override
  String get drawingBackgroundLabel => 'Background';

  @override
  String get drawingCustomColor => 'Custom colour';

  @override
  String get drawingUseColor => 'Use colour';

  @override
  String get sheetTitle => 'Character sheet';

  @override
  String sheetProficiency(int bonus) {
    return 'Proficiency +$bonus';
  }

  @override
  String get sheetClass => 'Class';

  @override
  String get sheetLevel => 'Level';

  @override
  String get sheetArmorClass => 'AC';

  @override
  String get sheetHp => 'HP';

  @override
  String get sheetMaxHp => 'Max HP';

  @override
  String get sheetSpeed => 'Speed';

  @override
  String get sheetAbilities => 'Ability scores';

  @override
  String get sheetAbilitiesHint =>
      'Tick the box if they are proficient in that saving throw.';

  @override
  String get sheetModifier => 'Mod';

  @override
  String get sheetSave => 'Save';

  @override
  String get sheetAlignment => 'Alignment';

  @override
  String get sheetBackground => 'Background';

  @override
  String get sheetFeatures => 'Features and traits';

  @override
  String get sheetEquipment => 'Equipment';

  @override
  String get abilityStrength => 'Strength';

  @override
  String get abilityDexterity => 'Dexterity';

  @override
  String get abilityConstitution => 'Constitution';

  @override
  String get abilityIntelligence => 'Intelligence';

  @override
  String get abilityWisdom => 'Wisdom';

  @override
  String get abilityCharisma => 'Charisma';

  @override
  String get securityTitle => 'Security';

  @override
  String get lockAskOnOpen => 'Ask for a PIN on open';

  @override
  String get lockProtected => 'Your universes are protected';

  @override
  String get lockUnprotected =>
      'Anyone who picks up this device can read your universes.';

  @override
  String get lockBackgroundNote =>
      'The app locks whenever it goes to the background.';

  @override
  String get lockUseBiometrics => 'Use fingerprint or face';

  @override
  String get lockBiometricsNote =>
      'A shortcut to the PIN, which always keeps working.';

  @override
  String get lockNoBiometrics => 'This device has no biometrics set up.';

  @override
  String get lockChangePin => 'Change PIN';

  @override
  String get lockNow => 'Lock now';

  @override
  String get lockChoosePin => 'Choose a PIN';

  @override
  String get lockConfirmCurrent => 'Confirm your current PIN';

  @override
  String get lockNewPin => 'New PIN';

  @override
  String get lockCurrentPin => 'Current PIN';

  @override
  String get lockWrongPin => 'Wrong PIN.';

  @override
  String get lockMinDigits => 'Use at least 4 digits.';

  @override
  String get lockUnlock => 'Unlock';

  @override
  String get lockUnlockBiometric => 'Unlock with fingerprint or face';

  @override
  String get lockOk => 'OK';

  @override
  String get lockExplainer =>
      'The PIN guards access to the app on this device. It does not encrypt the data file: someone with access to the phone\'s file system could still read it. If you forget the PIN you will have to reinstall the app, so keep a backup.';

  @override
  String get diceErrEmpty => 'Type a roll, for example 2d6+3.';

  @override
  String diceErrUnparsable(String expression) {
    return 'I could not read \"$expression\".';
  }

  @override
  String diceErrTooManyDice(int max) {
    return 'Use between 1 and $max dice.';
  }

  @override
  String diceErrSideRange(int max) {
    return 'Dice must have between 2 and $max sides.';
  }

  @override
  String diceErrUnknownTerm(String term) {
    return 'I could not read \"$term\" in the roll.';
  }

  @override
  String get backupErrNotABackup =>
      'That file does not look like an Astrolabe backup.';

  @override
  String get backupErrNewerFormat =>
      'This backup was created by a newer version of the app.';

  @override
  String get lockBiometricReason => 'Unlock your universes';

  @override
  String get themeClassicName => 'Classic';

  @override
  String get themeClassicDesc => 'Clean and neutral. Lets your content speak.';

  @override
  String get themeMedievalName => 'Medieval';

  @override
  String get themeMedievalDesc =>
      'Parchment, wine and gold. For kingdoms, swords and bloodlines.';

  @override
  String get themeSteampunkName => 'Steampunk';

  @override
  String get themeSteampunkDesc =>
      'Brass, copper and verdigris. Gears and steam.';

  @override
  String get themeCyberpunkName => 'Cyberpunk';

  @override
  String get themeCyberpunkDesc =>
      'Neon over black. Circuits, data and acid rain.';

  @override
  String get themeSolarpunkName => 'Solarpunk';

  @override
  String get themeSolarpunkDesc =>
      'Green, sun and clean air. Futures worth living in.';

  @override
  String get themeCosmicName => 'Cosmic';

  @override
  String get themeCosmicDesc =>
      'Nebulae and starlight. Ships, empires and the void.';

  @override
  String get themeGothicName => 'Gothic';

  @override
  String get themeGothicDesc => 'Crimson and ash. Vampires, ruins and secrets.';

  @override
  String get markupBold => 'Bold';

  @override
  String get markupItalic => 'Italic';

  @override
  String get helpEditorTitle => 'The text editor';

  @override
  String get helpEditorButton => 'How formatting works';

  @override
  String get helpIntro =>
      'How to format what you write, where each button works and what gets stored underneath.';

  @override
  String get helpStylesTitle => 'Bold and italic';

  @override
  String get helpStylesIntro =>
      'It works like any word processor. There are two ways, and both work.';

  @override
  String get helpWayMarkTitle => 'Style what you already wrote';

  @override
  String get helpWayMarkBody =>
      'Select the words and press B or I. Press again to take it off.';

  @override
  String get helpWayAheadTitle => 'Turn it on before you write';

  @override
  String get helpWayAheadBody =>
      'With nothing selected, press B and what you type next comes out bold, until you turn it off.';

  @override
  String get helpOnTitle => 'Telling when it is on';

  @override
  String get helpOnBody =>
      'The button lights up when the caret sits on text that already carries that style, or when you have just turned it on. Move the caret elsewhere and it goes out.';

  @override
  String get helpCombineBody =>
      'The two combine: a phrase can be bold and italic at once. And if you type right after a bold word, what you add stays bold.';

  @override
  String get helpReachTitle => 'Three ways to reach the buttons';

  @override
  String get helpReachBarTitle => 'The toolbar';

  @override
  String get helpReachBarBody => 'The B and I buttons, above the text box.';

  @override
  String get helpReachKeysTitle => 'The keyboard';

  @override
  String get helpReachKeysBody =>
      'Ctrl+B and Ctrl+I. On a Mac, Cmd instead of Ctrl.';

  @override
  String get helpReachPhoneTitle => 'On a phone';

  @override
  String get helpReachPhoneBody =>
      'When you select a word and the system menu appears with Copy and Paste, Bold and Italic are right there. That menu covers the toolbar, so the styles live inside it too.';

  @override
  String get helpWhereTitle => 'Where it works';

  @override
  String get helpWhereBody =>
      'In the body of a note and in the chapter editor. In the notes list, each preview already shows its formatting.';

  @override
  String get helpWhereNote =>
      'Titles, summaries and the short fields stay plain text.';

  @override
  String get helpChapterOnlyTitle => 'Subheadings, quotes and scene breaks';

  @override
  String get helpChapterOnlyIntro =>
      'These three apply to the whole line the caret is on, not to the words you select. Like bold, they show while you write and leave no marker in sight.';

  @override
  String get helpSubheadingBody =>
      'Turns the line into a subheading: larger and bold. Good for separating parts within a chapter.';

  @override
  String get helpSceneBreakBody =>
      'Drops a mark on its own line to separate two scenes within a chapter.';

  @override
  String get helpChapterOnlyWarn =>
      'A quotation cannot be indented while you write it: a text box cannot give one paragraph margins of its own. That is why it is set apart by the italics and the ground instead.';

  @override
  String get helpStoredTitle => 'What gets stored';

  @override
  String get helpStoredBody =>
      'You never see an asterisk. Underneath, the text is stored as Markdown.';

  @override
  String get helpStoredSeeLabel => 'What you see';

  @override
  String get helpStoredSavedLabel => 'What gets stored';

  @override
  String get helpStoredSample =>
      'The **Valdris House** fell in the *long winter*.';

  @override
  String get helpStoredWhy =>
      'That matters for three reasons: your backups stay readable in any text editor, search still finds the words, and anything you had already written with asterisks opens already formatted.';

  @override
  String get helpStoredAsterisk =>
      'An asterisk you type on purpose is stored protected and comes back as itself.';

  @override
  String get helpHalfWordTitle => 'The one odd detail';

  @override
  String get helpHalfWordBody =>
      'Markdown has no way to say \"half of this word is bold\". If you style only part of a word, saving widens it to the whole word.';

  @override
  String get helpHalfWordNote =>
      'It is the only concession, and a deliberate one: better that than storing something that reads back differently. The words are never touched.';

  @override
  String get helpMoreTitle => 'The rest of the chapter editor';

  @override
  String get helpAutosaveTitle => 'It saves itself';

  @override
  String get helpAutosaveBody =>
      'A second after you stop typing, and again when you leave the screen. The top says Saving or Saved.';

  @override
  String get helpWordCountTitle => 'Word count';

  @override
  String get helpWordCountBody =>
      'Always in view, and it updates as you write.';

  @override
  String get helpGoalTitle => 'Word goal';

  @override
  String get helpGoalBody =>
      'Give the chapter a goal and a progress bar appears above the buttons.';

  @override
  String get helpFocusTitle => 'Distraction-free mode';

  @override
  String get helpFocusBody =>
      'Hides everything but the text. The button at the top right brings it back.';

  @override
  String get markupQuote => 'Quote';

  @override
  String get helpQuoteBody =>
      'Marks the paragraph as a quotation: italic on a faint ground, so it stands apart from the body. Press Enter and the quote carries on; a subheading does not.';

  @override
  String get pdfTitle => 'Export to PDF';

  @override
  String get pdfButton => 'Export to PDF';

  @override
  String get pdfIntro =>
      'Pick the chapters you want. They come out together in one PDF, in the order they are in.';

  @override
  String get pdfSelectAll => 'Select all';

  @override
  String get pdfClear => 'Clear all';

  @override
  String get pdfNoChapters => 'No chapters to export yet.';

  @override
  String get pdfEmptyChapter => 'No text yet';

  @override
  String get pdfExport => 'Export';

  @override
  String get pdfWorking => 'Building the PDF...';

  @override
  String get pdfDone => 'PDF ready.';

  @override
  String pdfFailed(String error) {
    return 'Could not export: $error';
  }

  @override
  String get pdfShareTitle => 'Your manuscript';

  @override
  String pdfWordsLabel(String n) {
    return '$n words';
  }

  @override
  String pdfSelectedCount(int count, int total) {
    return '$count of $total chapters';
  }

  @override
  String get pdfIntroAll =>
      'Pick what you want to take with you. It all comes out in one PDF.';

  @override
  String get pdfWithImages => 'With pictures';

  @override
  String get pdfGroupChapters => 'Chapters';

  @override
  String get pdfGroupCharacters => 'Characters';

  @override
  String get pdfGroupFactions => 'Factions';

  @override
  String get pdfGroupLocations => 'Places';

  @override
  String get pdfGroupItems => 'Items';

  @override
  String get pdfGroupMagic => 'Magic systems';

  @override
  String get pdfNothingPicked => 'Nothing picked yet.';

  @override
  String get pdfNoneOfThese => 'None of these yet.';

  @override
  String get sheetRace => 'Race';

  @override
  String get sheetGender => 'Gender';

  @override
  String get sheetAge => 'Age';

  @override
  String get sheetOccupation => 'Occupation';

  @override
  String get sheetFaction => 'Faction';

  @override
  String get sheetStatus => 'Status';

  @override
  String get sheetType => 'Kind';

  @override
  String get sheetClimate => 'Climate';

  @override
  String get sheetPopulation => 'Population';

  @override
  String get sheetGovernment => 'Government';

  @override
  String get sheetPartOf => 'Part of';

  @override
  String get sheetOwner => 'Held by';

  @override
  String get sheetWhere => 'Where it is';

  @override
  String get sheetAppearance => 'Appearance';

  @override
  String get sheetPersonality => 'Personality';

  @override
  String get sheetBackstory => 'Backstory';

  @override
  String get sheetNotes => 'Notes';

  @override
  String get sheetDescription => 'Description';

  @override
  String get sheetPowers => 'Powers';

  @override
  String get sheetOrigin => 'Origin';

  @override
  String get sheetSource => 'Where it comes from';

  @override
  String get sheetRules => 'Rules';

  @override
  String get sheetLimits => 'Limits';

  @override
  String get sheetCost => 'Cost';
}
