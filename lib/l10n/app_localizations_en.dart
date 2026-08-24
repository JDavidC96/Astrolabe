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
}
