import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L
/// returned by `L.of(context)`.
///
/// Applications need to include `L.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L.localizationsDelegates,
///   supportedLocales: L.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L.supportedLocales
/// property.
abstract class L {
  L(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L)!;
  }

  static const LocalizationsDelegate<L> delegate = _LDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Name of the app, not translated
  ///
  /// In es, this message translates to:
  /// **'Astrolabe'**
  String get appTitle;

  /// No description provided for @commonSave.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get commonSave;

  /// No description provided for @commonCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get commonEdit;

  /// No description provided for @commonAdd.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get commonAdd;

  /// No description provided for @commonClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get commonClose;

  /// No description provided for @commonRemove.
  ///
  /// In es, this message translates to:
  /// **'Quitar'**
  String get commonRemove;

  /// No description provided for @commonRequired.
  ///
  /// In es, this message translates to:
  /// **'Requerido'**
  String get commonRequired;

  /// Word appended in parentheses to optional field labels
  ///
  /// In es, this message translates to:
  /// **'opcional'**
  String get commonOptional;

  /// No description provided for @commonNone.
  ///
  /// In es, this message translates to:
  /// **'Ninguno'**
  String get commonNone;

  /// No description provided for @commonError.
  ///
  /// In es, this message translates to:
  /// **'Error: {message}'**
  String commonError(String message);

  /// No description provided for @commonSearch.
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get commonSearch;

  /// No description provided for @commonSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar...'**
  String get commonSearchHint;

  /// No description provided for @commonNoMatches.
  ///
  /// In es, this message translates to:
  /// **'Nada coincide con la búsqueda.'**
  String get commonNoMatches;

  /// No description provided for @commonSelectedCount.
  ///
  /// In es, this message translates to:
  /// **'{count} seleccionado(s)'**
  String commonSelectedCount(int count);

  /// No description provided for @commonSelectedCountFiltered.
  ///
  /// In es, this message translates to:
  /// **'{count} seleccionado(s) · {hidden} fuera del filtro'**
  String commonSelectedCountFiltered(int count, int hidden);

  /// No description provided for @projectsTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis universos'**
  String get projectsTitle;

  /// No description provided for @projectsEmpty.
  ///
  /// In es, this message translates to:
  /// **'Todavía no has creado ningún libro/universo.\nToca + para empezar.'**
  String get projectsEmpty;

  /// No description provided for @projectsKindNovel.
  ///
  /// In es, this message translates to:
  /// **'Libro / novela'**
  String get projectsKindNovel;

  /// No description provided for @projectsKindCampaign.
  ///
  /// In es, this message translates to:
  /// **'Campaña de rol'**
  String get projectsKindCampaign;

  /// No description provided for @projectNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo universo'**
  String get projectNew;

  /// No description provided for @projectEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar universo'**
  String get projectEdit;

  /// No description provided for @projectName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get projectName;

  /// No description provided for @projectDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get projectDescription;

  /// No description provided for @projectPurpose.
  ///
  /// In es, this message translates to:
  /// **'¿Para qué es?'**
  String get projectPurpose;

  /// No description provided for @projectKindBook.
  ///
  /// In es, this message translates to:
  /// **'Libro'**
  String get projectKindBook;

  /// No description provided for @projectKindCampaignShort.
  ///
  /// In es, this message translates to:
  /// **'Campaña'**
  String get projectKindCampaignShort;

  /// No description provided for @projectHintCampaign.
  ///
  /// In es, this message translates to:
  /// **'Agrega fichas de personaje, sesiones y dados.'**
  String get projectHintCampaign;

  /// No description provided for @projectHintNovel.
  ///
  /// In es, this message translates to:
  /// **'Agrega capítulos y notas de escritura.'**
  String get projectHintNovel;

  /// No description provided for @projectAesthetic.
  ///
  /// In es, this message translates to:
  /// **'Estética'**
  String get projectAesthetic;

  /// No description provided for @projectCover.
  ///
  /// In es, this message translates to:
  /// **'Portada'**
  String get projectCover;

  /// No description provided for @projectSaveFirstForCover.
  ///
  /// In es, this message translates to:
  /// **'Guarda el universo para poder elegir o dibujar su portada.'**
  String get projectSaveFirstForCover;

  /// No description provided for @projectDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar universo'**
  String get projectDeleteTitle;

  /// No description provided for @projectDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que quieres eliminar \"{name}\"? Se borrarán todos sus personajes, lugares, facciones y eventos. Esta acción no se puede deshacer.'**
  String projectDeleteBody(String name);

  /// No description provided for @sectionCharacters.
  ///
  /// In es, this message translates to:
  /// **'Personajes'**
  String get sectionCharacters;

  /// No description provided for @sectionWorld.
  ///
  /// In es, this message translates to:
  /// **'Mundo'**
  String get sectionWorld;

  /// No description provided for @sectionFactions.
  ///
  /// In es, this message translates to:
  /// **'Facciones'**
  String get sectionFactions;

  /// No description provided for @sectionTimeline.
  ///
  /// In es, this message translates to:
  /// **'Línea de tiempo'**
  String get sectionTimeline;

  /// No description provided for @sectionChapters.
  ///
  /// In es, this message translates to:
  /// **'Capítulos'**
  String get sectionChapters;

  /// No description provided for @sectionSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones'**
  String get sectionSessions;

  /// No description provided for @sectionNotes.
  ///
  /// In es, this message translates to:
  /// **'Notas'**
  String get sectionNotes;

  /// No description provided for @sectionItems.
  ///
  /// In es, this message translates to:
  /// **'Objetos'**
  String get sectionItems;

  /// No description provided for @sectionMagic.
  ///
  /// In es, this message translates to:
  /// **'Magia'**
  String get sectionMagic;

  /// No description provided for @toolFamilyTree.
  ///
  /// In es, this message translates to:
  /// **'Árbol genealógico'**
  String get toolFamilyTree;

  /// No description provided for @toolSecrets.
  ///
  /// In es, this message translates to:
  /// **'Secretos'**
  String get toolSecrets;

  /// No description provided for @toolDice.
  ///
  /// In es, this message translates to:
  /// **'Dados'**
  String get toolDice;

  /// No description provided for @toolAppearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get toolAppearance;

  /// No description provided for @toolBackup.
  ///
  /// In es, this message translates to:
  /// **'Exportar / respaldar'**
  String get toolBackup;

  /// No description provided for @drawerUniverse.
  ///
  /// In es, this message translates to:
  /// **'Universo'**
  String get drawerUniverse;

  /// No description provided for @drawerMyUniverses.
  ///
  /// In es, this message translates to:
  /// **'Mis universos'**
  String get drawerMyUniverses;

  /// No description provided for @searchWholeUniverse.
  ///
  /// In es, this message translates to:
  /// **'Buscar en todo el universo'**
  String get searchWholeUniverse;

  /// No description provided for @supportTitle.
  ///
  /// In es, this message translates to:
  /// **'Invítame un café'**
  String get supportTitle;

  /// No description provided for @supportSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Si la app te sirve y quieres apoyarla'**
  String get supportSubtitle;

  /// No description provided for @supportBody.
  ///
  /// In es, this message translates to:
  /// **'Astrolabe es gratis y sin anuncios. Si te sirve y quieres apoyarla, puedes hacerlo desde cualquier banco colombiano con esta llave Bre-B.'**
  String get supportBody;

  /// No description provided for @supportKeyLabel.
  ///
  /// In es, this message translates to:
  /// **'Llave Bre-B'**
  String get supportKeyLabel;

  /// No description provided for @supportCopyKey.
  ///
  /// In es, this message translates to:
  /// **'Copiar llave'**
  String get supportCopyKey;

  /// No description provided for @supportCopied.
  ///
  /// In es, this message translates to:
  /// **'Llave copiada. Pégala en tu app del banco, en \"Enviar con Bre-B\".'**
  String get supportCopied;

  /// No description provided for @supportHow.
  ///
  /// In es, this message translates to:
  /// **'Cómo: abre tu app del banco (Nequi, Daviplata, Bancolombia, la que uses), busca \"Enviar con Bre-B\" y pega la llave.'**
  String get supportHow;

  /// No description provided for @settingsSecurity.
  ///
  /// In es, this message translates to:
  /// **'Seguridad'**
  String get settingsSecurity;

  /// No description provided for @appearanceTitle.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get appearanceTitle;

  /// No description provided for @appearanceBrightness.
  ///
  /// In es, this message translates to:
  /// **'Brillo'**
  String get appearanceBrightness;

  /// No description provided for @appearanceLight.
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get appearanceLight;

  /// No description provided for @appearanceAuto.
  ///
  /// In es, this message translates to:
  /// **'Auto'**
  String get appearanceAuto;

  /// No description provided for @appearanceDark.
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get appearanceDark;

  /// No description provided for @appearanceBrightnessNote.
  ///
  /// In es, this message translates to:
  /// **'Este ajuste vale para toda la app.'**
  String get appearanceBrightnessNote;

  /// No description provided for @appearanceThemeTitle.
  ///
  /// In es, this message translates to:
  /// **'Tema de este universo'**
  String get appearanceThemeTitle;

  /// No description provided for @appearanceThemeNote.
  ///
  /// In es, this message translates to:
  /// **'Cada universo guarda su propio tema, así que tu saga medieval y tu campaña cyberpunk no tienen que verse igual.'**
  String get appearanceThemeNote;

  /// No description provided for @appearanceButtonSample.
  ///
  /// In es, this message translates to:
  /// **'Botón'**
  String get appearanceButtonSample;

  /// No description provided for @appearanceButtonOther.
  ///
  /// In es, this message translates to:
  /// **'Otro'**
  String get appearanceButtonOther;

  /// No description provided for @appearanceSystemFont.
  ///
  /// In es, this message translates to:
  /// **'Sistema'**
  String get appearanceSystemFont;

  /// No description provided for @languageTitle.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get languageTitle;

  /// No description provided for @languageSystem.
  ///
  /// In es, this message translates to:
  /// **'Automático (idioma del dispositivo)'**
  String get languageSystem;

  /// No description provided for @languageSpanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageNote.
  ///
  /// In es, this message translates to:
  /// **'Cambia el idioma de la app. Tus universos y lo que escribas no se traducen.'**
  String get languageNote;
}

class _LDelegate extends LocalizationsDelegate<L> {
  const _LDelegate();

  @override
  Future<L> load(Locale locale) {
    return SynchronousFuture<L>(lookupL(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_LDelegate old) => false;
}

L lookupL(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return LEn();
    case 'es':
      return LEs();
  }

  throw FlutterError(
    'L.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
