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

  /// No description provided for @charSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar personaje...'**
  String get charSearchHint;

  /// No description provided for @charEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay personajes todavía. Toca + para crear uno.'**
  String get charEmpty;

  /// No description provided for @charNoMatch.
  ///
  /// In es, this message translates to:
  /// **'Ningún personaje coincide con la búsqueda.'**
  String get charNoMatch;

  /// No description provided for @charFilterAll.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get charFilterAll;

  /// No description provided for @charNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo personaje'**
  String get charNew;

  /// No description provided for @charEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar personaje'**
  String get charEdit;

  /// No description provided for @charSaved.
  ///
  /// In es, this message translates to:
  /// **'Personaje guardado'**
  String get charSaved;

  /// No description provided for @charDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar personaje'**
  String get charDeleteTitle;

  /// No description provided for @charDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que quieres eliminar este personaje?'**
  String get charDeleteBody;

  /// No description provided for @charSectionBasics.
  ///
  /// In es, this message translates to:
  /// **'Datos básicos'**
  String get charSectionBasics;

  /// No description provided for @charFirstName.
  ///
  /// In es, this message translates to:
  /// **'Nombre *'**
  String get charFirstName;

  /// No description provided for @charLastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido (opcional)'**
  String get charLastName;

  /// No description provided for @charAlias.
  ///
  /// In es, this message translates to:
  /// **'Alias / apodo (opcional)'**
  String get charAlias;

  /// No description provided for @charRace.
  ///
  /// In es, this message translates to:
  /// **'Raza / especie (opcional)'**
  String get charRace;

  /// No description provided for @charGender.
  ///
  /// In es, this message translates to:
  /// **'Género (opcional)'**
  String get charGender;

  /// No description provided for @charAge.
  ///
  /// In es, this message translates to:
  /// **'Edad (opcional)'**
  String get charAge;

  /// No description provided for @charOccupation.
  ///
  /// In es, this message translates to:
  /// **'Ocupación (opcional)'**
  String get charOccupation;

  /// No description provided for @charFaction.
  ///
  /// In es, this message translates to:
  /// **'Facción / casa (opcional)'**
  String get charFaction;

  /// No description provided for @charStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get charStatus;

  /// No description provided for @charStatusHint.
  ///
  /// In es, this message translates to:
  /// **'Vivo, muerto, desaparecido...'**
  String get charStatusHint;

  /// No description provided for @charRole.
  ///
  /// In es, this message translates to:
  /// **'Rol en la mesa (opcional)'**
  String get charRole;

  /// No description provided for @charRoleUndefined.
  ///
  /// In es, this message translates to:
  /// **'Sin definir'**
  String get charRoleUndefined;

  /// No description provided for @charRolePc.
  ///
  /// In es, this message translates to:
  /// **'Jugador (PJ)'**
  String get charRolePc;

  /// No description provided for @charRoleNpc.
  ///
  /// In es, this message translates to:
  /// **'NPC'**
  String get charRoleNpc;

  /// No description provided for @charRoleEnemy.
  ///
  /// In es, this message translates to:
  /// **'Enemigo'**
  String get charRoleEnemy;

  /// No description provided for @charAppearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia física (opcional)'**
  String get charAppearance;

  /// No description provided for @charPersonality.
  ///
  /// In es, this message translates to:
  /// **'Personalidad (opcional)'**
  String get charPersonality;

  /// No description provided for @charBackstory.
  ///
  /// In es, this message translates to:
  /// **'Historia / trasfondo (opcional)'**
  String get charBackstory;

  /// No description provided for @charAbilities.
  ///
  /// In es, this message translates to:
  /// **'Habilidades (opcional)'**
  String get charAbilities;

  /// No description provided for @charNotes.
  ///
  /// In es, this message translates to:
  /// **'Notas (opcional)'**
  String get charNotes;

  /// No description provided for @charSaveFirst.
  ///
  /// In es, this message translates to:
  /// **'Guarda el personaje para poder agregar imagen y relaciones.'**
  String get charSaveFirst;

  /// No description provided for @charAppearsIn.
  ///
  /// In es, this message translates to:
  /// **'Aparece en'**
  String get charAppearsIn;

  /// No description provided for @charAttendedSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones en las que estuvo'**
  String get charAttendedSessions;

  /// No description provided for @charNoAppearancesChapters.
  ///
  /// In es, this message translates to:
  /// **'Todavía no está marcado en ningún capítulo. Se marca desde el capítulo, no desde aquí.'**
  String get charNoAppearancesChapters;

  /// No description provided for @charNoAppearancesSessions.
  ///
  /// In es, this message translates to:
  /// **'Todavía no está marcado en ninguna sesión. Se marca desde la sesión, no desde aquí.'**
  String get charNoAppearancesSessions;

  /// No description provided for @worldEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay lugares todavía. Crea el primero con el botón +.'**
  String get worldEmpty;

  /// No description provided for @worldAddSub.
  ///
  /// In es, this message translates to:
  /// **'Agregar sublugar'**
  String get worldAddSub;

  /// No description provided for @worldViewMap.
  ///
  /// In es, this message translates to:
  /// **'Ver mapa'**
  String get worldViewMap;

  /// No description provided for @worldViewDetails.
  ///
  /// In es, this message translates to:
  /// **'Ver / editar detalles de este lugar'**
  String get worldViewDetails;

  /// No description provided for @locNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo lugar'**
  String get locNew;

  /// No description provided for @locEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar lugar'**
  String get locEdit;

  /// No description provided for @locSaved.
  ///
  /// In es, this message translates to:
  /// **'Lugar guardado'**
  String get locSaved;

  /// No description provided for @locDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar lugar'**
  String get locDeleteTitle;

  /// No description provided for @locDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{name}\"? También se eliminarán sus sublugares.'**
  String locDeleteBody(String name);

  /// No description provided for @locDeleteBodyPlain.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este lugar? También se eliminarán sus sublugares.'**
  String get locDeleteBodyPlain;

  /// No description provided for @locName.
  ///
  /// In es, this message translates to:
  /// **'Nombre *'**
  String get locName;

  /// No description provided for @locType.
  ///
  /// In es, this message translates to:
  /// **'Tipo (opcional)'**
  String get locType;

  /// No description provided for @locTypeHint.
  ///
  /// In es, this message translates to:
  /// **'Continente, reino, ciudad, bosque...'**
  String get locTypeHint;

  /// No description provided for @locParent.
  ///
  /// In es, this message translates to:
  /// **'Lugar padre (opcional)'**
  String get locParent;

  /// No description provided for @locParentRoot.
  ///
  /// In es, this message translates to:
  /// **'Ninguno (raíz)'**
  String get locParentRoot;

  /// No description provided for @locClimate.
  ///
  /// In es, this message translates to:
  /// **'Clima (opcional)'**
  String get locClimate;

  /// No description provided for @locPopulation.
  ///
  /// In es, this message translates to:
  /// **'Población (opcional)'**
  String get locPopulation;

  /// No description provided for @locGovernment.
  ///
  /// In es, this message translates to:
  /// **'Gobierno (opcional)'**
  String get locGovernment;

  /// No description provided for @locStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado (opcional)'**
  String get locStatus;

  /// No description provided for @locDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get locDescription;

  /// No description provided for @locMapLabel.
  ///
  /// In es, this message translates to:
  /// **'Mapa / imagen'**
  String get locMapLabel;

  /// No description provided for @locMapPending.
  ///
  /// In es, this message translates to:
  /// **'Mapa de este lugar'**
  String get locMapPending;

  /// No description provided for @locMapPendingHint.
  ///
  /// In es, this message translates to:
  /// **'Guarda el lugar (✓ arriba) y aquí podrás subir un mapa o dibujarlo.'**
  String get locMapPendingHint;

  /// No description provided for @locOpenInteractiveMap.
  ///
  /// In es, this message translates to:
  /// **'Abrir mapa interactivo'**
  String get locOpenInteractiveMap;

  /// No description provided for @locCycleWarning.
  ///
  /// In es, this message translates to:
  /// **'Ese vínculo crearía un bucle en el árbol.'**
  String get locCycleWarning;

  /// No description provided for @facEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay facciones todavía. Toca + para crear una.'**
  String get facEmpty;

  /// No description provided for @facNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva facción'**
  String get facNew;

  /// No description provided for @facEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar facción'**
  String get facEdit;

  /// No description provided for @facSaved.
  ///
  /// In es, this message translates to:
  /// **'Facción guardada'**
  String get facSaved;

  /// No description provided for @facDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar facción'**
  String get facDeleteTitle;

  /// No description provided for @facDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar esta facción? Los personajes miembros dejarán de tenerla asignada.'**
  String get facDeleteBody;

  /// No description provided for @facName.
  ///
  /// In es, this message translates to:
  /// **'Nombre *'**
  String get facName;

  /// No description provided for @facType.
  ///
  /// In es, this message translates to:
  /// **'Tipo (opcional)'**
  String get facType;

  /// No description provided for @facTypeHint.
  ///
  /// In es, this message translates to:
  /// **'Casa, gremio, reino, ejército...'**
  String get facTypeHint;

  /// No description provided for @facStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado (opcional)'**
  String get facStatus;

  /// No description provided for @facDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get facDescription;

  /// No description provided for @facSymbol.
  ///
  /// In es, this message translates to:
  /// **'Símbolo / estandarte'**
  String get facSymbol;

  /// No description provided for @facMembers.
  ///
  /// In es, this message translates to:
  /// **'Miembros'**
  String get facMembers;

  /// No description provided for @facNoMembers.
  ///
  /// In es, this message translates to:
  /// **'Ningún personaje pertenece a esta facción todavía.'**
  String get facNoMembers;

  /// No description provided for @itemEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay objetos todavía. Toca + para agregar una reliquia, arma o artefacto.'**
  String get itemEmpty;

  /// No description provided for @itemNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo objeto'**
  String get itemNew;

  /// No description provided for @itemEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar objeto'**
  String get itemEdit;

  /// No description provided for @itemSaved.
  ///
  /// In es, this message translates to:
  /// **'Objeto guardado'**
  String get itemSaved;

  /// No description provided for @itemDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar objeto'**
  String get itemDeleteTitle;

  /// No description provided for @itemDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este objeto?'**
  String get itemDeleteBody;

  /// No description provided for @itemName.
  ///
  /// In es, this message translates to:
  /// **'Nombre *'**
  String get itemName;

  /// No description provided for @itemType.
  ///
  /// In es, this message translates to:
  /// **'Tipo (opcional)'**
  String get itemType;

  /// No description provided for @itemTypeHint.
  ///
  /// In es, this message translates to:
  /// **'Arma, reliquia, libro, amuleto...'**
  String get itemTypeHint;

  /// No description provided for @itemOwner.
  ///
  /// In es, this message translates to:
  /// **'Portador actual (opcional)'**
  String get itemOwner;

  /// No description provided for @itemOwnerNone.
  ///
  /// In es, this message translates to:
  /// **'Nadie'**
  String get itemOwnerNone;

  /// No description provided for @itemLocation.
  ///
  /// In es, this message translates to:
  /// **'Ubicación (opcional)'**
  String get itemLocation;

  /// No description provided for @itemLocationUnknown.
  ///
  /// In es, this message translates to:
  /// **'Desconocida'**
  String get itemLocationUnknown;

  /// No description provided for @itemOrigin.
  ///
  /// In es, this message translates to:
  /// **'Origen (opcional)'**
  String get itemOrigin;

  /// No description provided for @itemPowers.
  ///
  /// In es, this message translates to:
  /// **'Poderes / propiedades (opcional)'**
  String get itemPowers;

  /// No description provided for @itemDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get itemDescription;

  /// No description provided for @itemImage.
  ///
  /// In es, this message translates to:
  /// **'Imagen del objeto'**
  String get itemImage;

  /// No description provided for @magicEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay sistemas de magia todavía. Toca + para definir cómo funciona la magia (o la tecnología) de tu mundo.'**
  String get magicEmpty;

  /// No description provided for @magicNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo sistema'**
  String get magicNew;

  /// No description provided for @magicEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar sistema'**
  String get magicEdit;

  /// No description provided for @magicSaved.
  ///
  /// In es, this message translates to:
  /// **'Sistema de magia guardado'**
  String get magicSaved;

  /// No description provided for @magicDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar sistema'**
  String get magicDeleteTitle;

  /// No description provided for @magicDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este sistema de magia?'**
  String get magicDeleteBody;

  /// No description provided for @magicName.
  ///
  /// In es, this message translates to:
  /// **'Nombre *'**
  String get magicName;

  /// No description provided for @magicSource.
  ///
  /// In es, this message translates to:
  /// **'Fuente del poder (opcional)'**
  String get magicSource;

  /// No description provided for @magicSourceHint.
  ///
  /// In es, this message translates to:
  /// **'Los dioses, la sangre, runas, el éter...'**
  String get magicSourceHint;

  /// No description provided for @magicRules.
  ///
  /// In es, this message translates to:
  /// **'Reglas / cómo funciona (opcional)'**
  String get magicRules;

  /// No description provided for @magicLimits.
  ///
  /// In es, this message translates to:
  /// **'Limitaciones (opcional)'**
  String get magicLimits;

  /// No description provided for @magicCost.
  ///
  /// In es, this message translates to:
  /// **'Costo / precio a pagar (opcional)'**
  String get magicCost;

  /// No description provided for @magicDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción general (opcional)'**
  String get magicDescription;

  /// No description provided for @magicSymbol.
  ///
  /// In es, this message translates to:
  /// **'Símbolo / esquema'**
  String get magicSymbol;

  /// No description provided for @timelineEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay eventos todavía. Crea el primero con el botón +.'**
  String get timelineEmpty;

  /// No description provided for @timelineSortByYear.
  ///
  /// In es, this message translates to:
  /// **'Ordenar por año'**
  String get timelineSortByYear;

  /// No description provided for @timelineSortByYearOn.
  ///
  /// In es, this message translates to:
  /// **'Cronológico. Los eventos sin año van al final.'**
  String get timelineSortByYearOn;

  /// No description provided for @timelineSortByYearOff.
  ///
  /// In es, this message translates to:
  /// **'Orden manual: arrastra para reordenar.'**
  String get timelineSortByYearOff;

  /// No description provided for @timelineAutoChapters.
  ///
  /// In es, this message translates to:
  /// **'Incluir capítulos automáticamente'**
  String get timelineAutoChapters;

  /// No description provided for @timelineAutoChaptersOn.
  ///
  /// In es, this message translates to:
  /// **'Los capítulos con resumen aparecen aquí y se actualizan solos.'**
  String get timelineAutoChaptersOn;

  /// No description provided for @timelineAutoChaptersOff.
  ///
  /// In es, this message translates to:
  /// **'Actívalo para que cada resumen de capítulo aparezca en la línea de tiempo.'**
  String get timelineAutoChaptersOff;

  /// No description provided for @timelineAutoOffNotice.
  ///
  /// In es, this message translates to:
  /// **'Se quitaron los eventos que venían de capítulos. Los que creaste a mano siguen intactos.'**
  String get timelineAutoOffNotice;

  /// No description provided for @timelineFromChapter.
  ///
  /// In es, this message translates to:
  /// **'Desde un capítulo'**
  String get timelineFromChapter;

  /// No description provided for @timelineYearChip.
  ///
  /// In es, this message translates to:
  /// **'Año {year}'**
  String timelineYearChip(int year);

  /// No description provided for @eventNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo evento'**
  String get eventNew;

  /// No description provided for @eventEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar evento'**
  String get eventEdit;

  /// No description provided for @eventSaved.
  ///
  /// In es, this message translates to:
  /// **'Evento guardado'**
  String get eventSaved;

  /// No description provided for @eventDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar evento'**
  String get eventDeleteTitle;

  /// No description provided for @eventDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este evento de la línea de tiempo?'**
  String get eventDeleteBody;

  /// No description provided for @eventDeleteNamed.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{title}\"?'**
  String eventDeleteNamed(String title);

  /// No description provided for @eventLinkedTitle.
  ///
  /// In es, this message translates to:
  /// **'Este evento viene de un capítulo'**
  String get eventLinkedTitle;

  /// No description provided for @eventLinkedBody.
  ///
  /// In es, this message translates to:
  /// **'Su título, resumen y año se actualizan solos cuando edites el capítulo. Si quieres redactarlo distinto aquí, desvincúlalo.'**
  String get eventLinkedBody;

  /// No description provided for @eventUnlink.
  ///
  /// In es, this message translates to:
  /// **'Desvincular del capítulo'**
  String get eventUnlink;

  /// No description provided for @eventTitle.
  ///
  /// In es, this message translates to:
  /// **'Título *'**
  String get eventTitle;

  /// No description provided for @eventYear.
  ///
  /// In es, this message translates to:
  /// **'Año (opcional)'**
  String get eventYear;

  /// No description provided for @eventYearHelp.
  ///
  /// In es, this message translates to:
  /// **'Solo números. Sirve para ordenar cronológicamente.'**
  String get eventYearHelp;

  /// No description provided for @eventFictionalDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha ficticia (opcional)'**
  String get eventFictionalDate;

  /// No description provided for @eventFictionalDateHint.
  ///
  /// In es, this message translates to:
  /// **'Año 3 de la Tercera Era, 12 de invierno...'**
  String get eventFictionalDateHint;

  /// No description provided for @eventPlace.
  ///
  /// In es, this message translates to:
  /// **'Lugar (opcional)'**
  String get eventPlace;

  /// No description provided for @eventDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get eventDescription;

  /// No description provided for @eventPeople.
  ///
  /// In es, this message translates to:
  /// **'Personajes involucrados'**
  String get eventPeople;

  /// No description provided for @eventNoCharacters.
  ///
  /// In es, this message translates to:
  /// **'No hay personajes en este proyecto todavía.'**
  String get eventNoCharacters;

  /// No description provided for @chapEmptyChapters.
  ///
  /// In es, this message translates to:
  /// **'No hay capítulos todavía. Toca + para crear el primero.'**
  String get chapEmptyChapters;

  /// No description provided for @chapNewChapter.
  ///
  /// In es, this message translates to:
  /// **'Nuevo capítulo'**
  String get chapNewChapter;

  /// No description provided for @chapEditChapter.
  ///
  /// In es, this message translates to:
  /// **'Editar capítulo'**
  String get chapEditChapter;

  /// No description provided for @chapNewSession.
  ///
  /// In es, this message translates to:
  /// **'Nueva sesión'**
  String get chapNewSession;

  /// No description provided for @chapEditSession.
  ///
  /// In es, this message translates to:
  /// **'Editar sesión'**
  String get chapEditSession;

  /// No description provided for @chapSaved.
  ///
  /// In es, this message translates to:
  /// **'Capítulo guardado'**
  String get chapSaved;

  /// No description provided for @chapDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar capítulo'**
  String get chapDeleteTitle;

  /// No description provided for @chapDeleteBody.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este capítulo?'**
  String get chapDeleteBody;

  /// No description provided for @chapDeleteNamed.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{title}\"?'**
  String chapDeleteNamed(String title);

  /// No description provided for @chapTitle.
  ///
  /// In es, this message translates to:
  /// **'Título *'**
  String get chapTitle;

  /// No description provided for @chapStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado (opcional)'**
  String get chapStatus;

  /// No description provided for @chapStatusHintChapter.
  ///
  /// In es, this message translates to:
  /// **'Borrador, revisado, terminado...'**
  String get chapStatusHintChapter;

  /// No description provided for @chapStatusHintSession.
  ///
  /// In es, this message translates to:
  /// **'Jugada, pendiente, cancelada...'**
  String get chapStatusHintSession;

  /// No description provided for @chapPlayedOn.
  ///
  /// In es, this message translates to:
  /// **'Fecha en que se jugó'**
  String get chapPlayedOn;

  /// No description provided for @chapNoDate.
  ///
  /// In es, this message translates to:
  /// **'Sin fecha'**
  String get chapNoDate;

  /// No description provided for @chapStoryYear.
  ///
  /// In es, this message translates to:
  /// **'Año en la historia (opcional)'**
  String get chapStoryYear;

  /// No description provided for @chapStoryYearHelp.
  ///
  /// In es, this message translates to:
  /// **'Para ubicarlo en la línea de tiempo.'**
  String get chapStoryYearHelp;

  /// No description provided for @chapSummary.
  ///
  /// In es, this message translates to:
  /// **'Resumen (opcional)'**
  String get chapSummary;

  /// No description provided for @chapSummaryHelp.
  ///
  /// In es, this message translates to:
  /// **'Si activas la opción, aparece en la línea de tiempo.'**
  String get chapSummaryHelp;

  /// No description provided for @chapContent.
  ///
  /// In es, this message translates to:
  /// **'Contenido'**
  String get chapContent;

  /// No description provided for @chapContentSaveFirst.
  ///
  /// In es, this message translates to:
  /// **'Guarda primero (✓ arriba) para empezar a escribir.'**
  String get chapContentSaveFirst;

  /// No description provided for @chapContentEmpty.
  ///
  /// In es, this message translates to:
  /// **'Vacío. Toca para escribir.'**
  String get chapContentEmpty;

  /// No description provided for @chapWordCount.
  ///
  /// In es, this message translates to:
  /// **'{count} palabras'**
  String chapWordCount(int count);

  /// No description provided for @chapWordCountGoal.
  ///
  /// In es, this message translates to:
  /// **'{count} palabras de {goal}'**
  String chapWordCountGoal(int count, int goal);

  /// No description provided for @chapAddToTimeline.
  ///
  /// In es, this message translates to:
  /// **'Agregar a la línea de tiempo'**
  String get chapAddToTimeline;

  /// No description provided for @chapAddedToTimeline.
  ///
  /// In es, this message translates to:
  /// **'Agregado a la línea de tiempo. Puedes editarlo ahí libremente.'**
  String get chapAddedToTimeline;

  /// No description provided for @chapWhoAttended.
  ///
  /// In es, this message translates to:
  /// **'Quiénes asistieron'**
  String get chapWhoAttended;

  /// No description provided for @chapWhoAppears.
  ///
  /// In es, this message translates to:
  /// **'Personajes que aparecen'**
  String get chapWhoAppears;

  /// No description provided for @chapNoCharacters.
  ///
  /// In es, this message translates to:
  /// **'No hay personajes en este universo todavía.'**
  String get chapNoCharacters;

  /// No description provided for @chapPlaces.
  ///
  /// In es, this message translates to:
  /// **'Lugares donde ocurre'**
  String get chapPlaces;

  /// No description provided for @chapNoPlaces.
  ///
  /// In es, this message translates to:
  /// **'No hay lugares en este universo todavía.'**
  String get chapNoPlaces;

  /// No description provided for @searchPlaceHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar lugar...'**
  String get searchPlaceHint;

  /// No description provided for @editorHint.
  ///
  /// In es, this message translates to:
  /// **'Escribe aquí...'**
  String get editorHint;

  /// No description provided for @editorFocusMode.
  ///
  /// In es, this message translates to:
  /// **'Modo sin distracciones'**
  String get editorFocusMode;

  /// No description provided for @editorExitFocus.
  ///
  /// In es, this message translates to:
  /// **'Salir del modo sin distracciones'**
  String get editorExitFocus;

  /// No description provided for @editorSaving.
  ///
  /// In es, this message translates to:
  /// **'Guardando'**
  String get editorSaving;

  /// No description provided for @editorSaved.
  ///
  /// In es, this message translates to:
  /// **'Guardado'**
  String get editorSaved;

  /// No description provided for @editorUnsaved.
  ///
  /// In es, this message translates to:
  /// **'Sin guardar'**
  String get editorUnsaved;

  /// No description provided for @editorBold.
  ///
  /// In es, this message translates to:
  /// **'Negrita'**
  String get editorBold;

  /// No description provided for @editorItalic.
  ///
  /// In es, this message translates to:
  /// **'Cursiva'**
  String get editorItalic;

  /// No description provided for @editorSubheading.
  ///
  /// In es, this message translates to:
  /// **'Subtítulo'**
  String get editorSubheading;

  /// No description provided for @editorSceneBreak.
  ///
  /// In es, this message translates to:
  /// **'Separador de escena'**
  String get editorSceneBreak;

  /// No description provided for @editorGoalTitle.
  ///
  /// In es, this message translates to:
  /// **'Meta de palabras'**
  String get editorGoalTitle;

  /// No description provided for @editorGoalLabel.
  ///
  /// In es, this message translates to:
  /// **'Palabras para este capítulo'**
  String get editorGoalLabel;

  /// No description provided for @editorGoalRemove.
  ///
  /// In es, this message translates to:
  /// **'Quitar meta'**
  String get editorGoalRemove;

  /// No description provided for @noteEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay notas todavía. Toca + para escribir una.'**
  String get noteEmpty;

  /// No description provided for @noteNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva nota'**
  String get noteNew;

  /// No description provided for @noteEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar nota'**
  String get noteEdit;

  /// No description provided for @noteDeleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar nota'**
  String get noteDeleteTitle;

  /// No description provided for @noteDeleteNamed.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{title}\"?'**
  String noteDeleteNamed(String title);

  /// No description provided for @noteTitle.
  ///
  /// In es, this message translates to:
  /// **'Título'**
  String get noteTitle;

  /// No description provided for @noteContent.
  ///
  /// In es, this message translates to:
  /// **'Contenido'**
  String get noteContent;

  /// No description provided for @secretsTitle.
  ///
  /// In es, this message translates to:
  /// **'Secretos'**
  String get secretsTitle;

  /// No description provided for @secretsEmpty.
  ///
  /// In es, this message translates to:
  /// **'Registra un secreto y marca qué personajes lo saben, cómo se enteraron y desde cuándo.'**
  String get secretsEmpty;

  /// No description provided for @secretNobodyKnows.
  ///
  /// In es, this message translates to:
  /// **'Nadie lo sabe todavía'**
  String get secretNobodyKnows;

  /// No description provided for @secretKnownBy.
  ///
  /// In es, this message translates to:
  /// **'Lo saben: {names}'**
  String secretKnownBy(String names);

  /// No description provided for @secretOwnedBy.
  ///
  /// In es, this message translates to:
  /// **'Secreto de: {name}'**
  String secretOwnedBy(String name);

  /// No description provided for @secretNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo secreto'**
  String get secretNew;

  /// No description provided for @secretEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar secreto'**
  String get secretEdit;

  /// No description provided for @secretLabel.
  ///
  /// In es, this message translates to:
  /// **'Secreto'**
  String get secretLabel;

  /// No description provided for @secretHint.
  ///
  /// In es, this message translates to:
  /// **'ej. Aria es la heredera legítima'**
  String get secretHint;

  /// No description provided for @secretDetails.
  ///
  /// In es, this message translates to:
  /// **'Detalles (opcional)'**
  String get secretDetails;

  /// No description provided for @secretOwnerQuestion.
  ///
  /// In es, this message translates to:
  /// **'¿De quién es el secreto?'**
  String get secretOwnerQuestion;

  /// No description provided for @secretOwnerNobody.
  ///
  /// In es, this message translates to:
  /// **'De nadie en particular'**
  String get secretOwnerNobody;

  /// No description provided for @secretWhoKnows.
  ///
  /// In es, this message translates to:
  /// **'¿Quién lo sabe?'**
  String get secretWhoKnows;

  /// No description provided for @secretHowFound.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo se enteró {name}? (opcional)'**
  String secretHowFound(String name);

  /// No description provided for @secretNoCharacters.
  ///
  /// In es, this message translates to:
  /// **'No hay personajes todavía.'**
  String get secretNoCharacters;

  /// No description provided for @diceTitle.
  ///
  /// In es, this message translates to:
  /// **'Dados'**
  String get diceTitle;

  /// No description provided for @diceClearHistory.
  ///
  /// In es, this message translates to:
  /// **'Limpiar historial'**
  String get diceClearHistory;

  /// No description provided for @diceRollLabel.
  ///
  /// In es, this message translates to:
  /// **'Tirada'**
  String get diceRollLabel;

  /// No description provided for @diceRollHint.
  ///
  /// In es, this message translates to:
  /// **'d20, 2d6+3, 4d8-1'**
  String get diceRollHint;

  /// No description provided for @diceRollButton.
  ///
  /// In es, this message translates to:
  /// **'Tirar'**
  String get diceRollButton;

  /// No description provided for @diceDisadvantage.
  ///
  /// In es, this message translates to:
  /// **'Desventaja'**
  String get diceDisadvantage;

  /// No description provided for @diceNormal.
  ///
  /// In es, this message translates to:
  /// **'Normal'**
  String get diceNormal;

  /// No description provided for @diceAdvantage.
  ///
  /// In es, this message translates to:
  /// **'Ventaja'**
  String get diceAdvantage;

  /// No description provided for @diceNoRolls.
  ///
  /// In es, this message translates to:
  /// **'Sin tiradas todavía.'**
  String get diceNoRolls;

  /// No description provided for @diceAdvantageWord.
  ///
  /// In es, this message translates to:
  /// **'ventaja'**
  String get diceAdvantageWord;

  /// No description provided for @diceDisadvantageWord.
  ///
  /// In es, this message translates to:
  /// **'desventaja'**
  String get diceDisadvantageWord;

  /// No description provided for @searchTitle.
  ///
  /// In es, this message translates to:
  /// **'Buscar en el universo'**
  String get searchTitle;

  /// No description provided for @searchHintLong.
  ///
  /// In es, this message translates to:
  /// **'Buscar personajes, lugares, objetos, capítulos...'**
  String get searchHintLong;

  /// No description provided for @searchPrompt.
  ///
  /// In es, this message translates to:
  /// **'Escribe para buscar en todo el universo a la vez.'**
  String get searchPrompt;

  /// No description provided for @searchNoResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados.'**
  String get searchNoResults;

  /// No description provided for @searchAllCount.
  ///
  /// In es, this message translates to:
  /// **'Todo ({count})'**
  String searchAllCount(int count);

  /// No description provided for @searchKindCharacter.
  ///
  /// In es, this message translates to:
  /// **'Personaje'**
  String get searchKindCharacter;

  /// No description provided for @searchKindLocation.
  ///
  /// In es, this message translates to:
  /// **'Lugar'**
  String get searchKindLocation;

  /// No description provided for @searchKindFaction.
  ///
  /// In es, this message translates to:
  /// **'Facción'**
  String get searchKindFaction;

  /// No description provided for @searchKindEvent.
  ///
  /// In es, this message translates to:
  /// **'Evento'**
  String get searchKindEvent;

  /// No description provided for @searchKindItem.
  ///
  /// In es, this message translates to:
  /// **'Objeto'**
  String get searchKindItem;

  /// No description provided for @searchKindMagic.
  ///
  /// In es, this message translates to:
  /// **'Magia'**
  String get searchKindMagic;

  /// No description provided for @searchKindChapter.
  ///
  /// In es, this message translates to:
  /// **'Capítulo'**
  String get searchKindChapter;

  /// No description provided for @searchKindNote.
  ///
  /// In es, this message translates to:
  /// **'Nota'**
  String get searchKindNote;

  /// No description provided for @backupTitle.
  ///
  /// In es, this message translates to:
  /// **'Exportar / respaldar'**
  String get backupTitle;

  /// No description provided for @backupLocalTitle.
  ///
  /// In es, this message translates to:
  /// **'Todo se guarda solo en este dispositivo'**
  String get backupLocalTitle;

  /// No description provided for @backupLocalBody.
  ///
  /// In es, this message translates to:
  /// **'La app no sube nada a ninguna nube por su cuenta. Si pierdes, formateas o cambias de teléfono sin un respaldo, pierdes el universo entero.'**
  String get backupLocalBody;

  /// No description provided for @backupTip.
  ///
  /// In es, this message translates to:
  /// **'Truco: al tocar \"Exportar y compartir\" se abre el selector de compartir de tu teléfono — ahí puedes elegir Google Drive (u otra nube que tengas instalada) para subir el respaldo con dos toques, sin salir de la app.'**
  String get backupTip;

  /// No description provided for @backupIncludes.
  ///
  /// In es, this message translates to:
  /// **'El respaldo incluye personajes, mundo, facciones, línea de tiempo, capítulos, notas, objetos, magia, etiquetas y todas las imágenes y dibujos.'**
  String get backupIncludes;

  /// No description provided for @backupExportShare.
  ///
  /// In es, this message translates to:
  /// **'Exportar y compartir'**
  String get backupExportShare;

  /// No description provided for @backupExportSave.
  ///
  /// In es, this message translates to:
  /// **'Solo guardar en el dispositivo'**
  String get backupExportSave;

  /// No description provided for @backupLast.
  ///
  /// In es, this message translates to:
  /// **'Último respaldo:\n{path}'**
  String backupLast(String path);

  /// No description provided for @backupSavedAt.
  ///
  /// In es, this message translates to:
  /// **'Respaldo guardado en:\n{path}'**
  String backupSavedAt(String path);

  /// No description provided for @backupShareText.
  ///
  /// In es, this message translates to:
  /// **'Respaldo de mi universo'**
  String get backupShareText;

  /// No description provided for @backupExportFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo exportar: {error}'**
  String backupExportFailed(String error);

  /// No description provided for @backupImportTitle.
  ///
  /// In es, this message translates to:
  /// **'Importar'**
  String get backupImportTitle;

  /// No description provided for @backupImportBody.
  ///
  /// In es, this message translates to:
  /// **'Restaura un respaldo como un universo nuevo. No sobrescribe nada de lo que ya tienes.'**
  String get backupImportBody;

  /// No description provided for @backupImportButton.
  ///
  /// In es, this message translates to:
  /// **'Importar respaldo (.wbz)'**
  String get backupImportButton;

  /// No description provided for @backupImportPick.
  ///
  /// In es, this message translates to:
  /// **'Elige un respaldo (.wbz)'**
  String get backupImportPick;

  /// No description provided for @backupImported.
  ///
  /// In es, this message translates to:
  /// **'Universo importado. Búscalo en \"Mis universos\".'**
  String get backupImported;

  /// No description provided for @backupImportFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo importar: {error}'**
  String backupImportFailed(String error);

  /// No description provided for @backupNotOurs.
  ///
  /// In es, this message translates to:
  /// **'El archivo no parece un respaldo de Astrolabe.'**
  String get backupNotOurs;

  /// No description provided for @backupTooNew.
  ///
  /// In es, this message translates to:
  /// **'Este respaldo fue creado por una versión más nueva de la app.'**
  String get backupTooNew;

  /// No description provided for @familyTitle.
  ///
  /// In es, this message translates to:
  /// **'Árbol genealógico'**
  String get familyTitle;

  /// No description provided for @familyExport.
  ///
  /// In es, this message translates to:
  /// **'Exportar'**
  String get familyExport;

  /// No description provided for @familyShareImage.
  ///
  /// In es, this message translates to:
  /// **'Compartir imagen'**
  String get familyShareImage;

  /// No description provided for @familySaveImage.
  ///
  /// In es, this message translates to:
  /// **'Guardar imagen'**
  String get familySaveImage;

  /// No description provided for @familyShareText.
  ///
  /// In es, this message translates to:
  /// **'Árbol genealógico'**
  String get familyShareText;

  /// No description provided for @familyNoCharacters.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay personajes.'**
  String get familyNoCharacters;

  /// No description provided for @familyNoLinks.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay vínculos familiares.'**
  String get familyNoLinks;

  /// No description provided for @familyHint.
  ///
  /// In es, this message translates to:
  /// **'Abre un personaje y agrega padres, hijos o pareja en la sección \"Familia\".'**
  String get familyHint;

  /// No description provided for @familyUnlinked.
  ///
  /// In es, this message translates to:
  /// **'Sin familia registrada'**
  String get familyUnlinked;

  /// No description provided for @familyNotReady.
  ///
  /// In es, this message translates to:
  /// **'El árbol no está listo.'**
  String get familyNotReady;

  /// No description provided for @familyNoImage.
  ///
  /// In es, this message translates to:
  /// **'No se pudo generar la imagen.'**
  String get familyNoImage;

  /// No description provided for @familyExportFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo exportar: {error}'**
  String familyExportFailed(String error);

  /// No description provided for @familySavedAt.
  ///
  /// In es, this message translates to:
  /// **'Guardado en:\n{path}'**
  String familySavedAt(String path);

  /// No description provided for @familySection.
  ///
  /// In es, this message translates to:
  /// **'Familia'**
  String get familySection;

  /// No description provided for @familyViewTree.
  ///
  /// In es, this message translates to:
  /// **'Ver árbol'**
  String get familyViewTree;

  /// No description provided for @familyParents.
  ///
  /// In es, this message translates to:
  /// **'Padres / madres'**
  String get familyParents;

  /// No description provided for @familyChildren.
  ///
  /// In es, this message translates to:
  /// **'Hijos / hijas'**
  String get familyChildren;

  /// No description provided for @familyPartner.
  ///
  /// In es, this message translates to:
  /// **'Pareja'**
  String get familyPartner;

  /// No description provided for @familyNoneRecorded.
  ///
  /// In es, this message translates to:
  /// **'Ninguno registrado.'**
  String get familyNoneRecorded;

  /// No description provided for @familyPickParent.
  ///
  /// In es, this message translates to:
  /// **'Elegir padre/madre'**
  String get familyPickParent;

  /// No description provided for @familyPickChild.
  ///
  /// In es, this message translates to:
  /// **'Elegir hijo/hija'**
  String get familyPickChild;

  /// No description provided for @familyPickPartner.
  ///
  /// In es, this message translates to:
  /// **'Elegir pareja'**
  String get familyPickPartner;

  /// No description provided for @familyNoOthers.
  ///
  /// In es, this message translates to:
  /// **'No hay otros personajes todavía.'**
  String get familyNoOthers;

  /// No description provided for @familyPartnerKind.
  ///
  /// In es, this message translates to:
  /// **'¿Qué tipo de vínculo?'**
  String get familyPartnerKind;

  /// No description provided for @familyDerived.
  ///
  /// In es, this message translates to:
  /// **'Parentescos deducidos'**
  String get familyDerived;

  /// No description provided for @familyDerivedHint.
  ///
  /// In es, this message translates to:
  /// **'Al registrar padres e hijos, aquí aparecerán solos los hermanos, abuelos, tíos y primos.'**
  String get familyDerivedHint;

  /// No description provided for @kinFullSiblings.
  ///
  /// In es, this message translates to:
  /// **'Hermanos (mismos padres)'**
  String get kinFullSiblings;

  /// No description provided for @kinHalfSiblings.
  ///
  /// In es, this message translates to:
  /// **'Medios hermanos'**
  String get kinHalfSiblings;

  /// No description provided for @kinGrandparents.
  ///
  /// In es, this message translates to:
  /// **'Abuelos'**
  String get kinGrandparents;

  /// No description provided for @kinGrandchildren.
  ///
  /// In es, this message translates to:
  /// **'Nietos'**
  String get kinGrandchildren;

  /// No description provided for @kinUncles.
  ///
  /// In es, this message translates to:
  /// **'Tíos'**
  String get kinUncles;

  /// No description provided for @kinNiblings.
  ///
  /// In es, this message translates to:
  /// **'Sobrinos'**
  String get kinNiblings;

  /// No description provided for @kinCousins.
  ///
  /// In es, this message translates to:
  /// **'Primos'**
  String get kinCousins;

  /// No description provided for @partnerMarriage.
  ///
  /// In es, this message translates to:
  /// **'Matrimonio'**
  String get partnerMarriage;

  /// No description provided for @partnerCouple.
  ///
  /// In es, this message translates to:
  /// **'Pareja'**
  String get partnerCouple;

  /// No description provided for @partnerEngaged.
  ///
  /// In es, this message translates to:
  /// **'Prometidos'**
  String get partnerEngaged;

  /// No description provided for @partnerLovers.
  ///
  /// In es, this message translates to:
  /// **'Amantes'**
  String get partnerLovers;

  /// No description provided for @partnerOther.
  ///
  /// In es, this message translates to:
  /// **'Otro'**
  String get partnerOther;

  /// No description provided for @mapTitle.
  ///
  /// In es, this message translates to:
  /// **'Mapa'**
  String get mapTitle;

  /// No description provided for @mapPlaceMarkers.
  ///
  /// In es, this message translates to:
  /// **'Colocar marcas'**
  String get mapPlaceMarkers;

  /// No description provided for @mapDone.
  ///
  /// In es, this message translates to:
  /// **'Terminar'**
  String get mapDone;

  /// No description provided for @mapEditHint.
  ///
  /// In es, this message translates to:
  /// **'Toca el mapa para poner una marca. Arrastra una marca para moverla.'**
  String get mapEditHint;

  /// No description provided for @mapNoFile.
  ///
  /// In es, this message translates to:
  /// **'No se encontró el archivo del mapa.'**
  String get mapNoFile;

  /// No description provided for @mapNoMapYet.
  ///
  /// In es, this message translates to:
  /// **'\"{name}\" todavía no tiene mapa.'**
  String mapNoMapYet(String name);

  /// No description provided for @mapNoMapHint.
  ///
  /// In es, this message translates to:
  /// **'Abre la ficha del lugar y sube una imagen o dibújala; después podrás poner marcas encima.'**
  String get mapNoMapHint;

  /// No description provided for @mapOpenPlace.
  ///
  /// In es, this message translates to:
  /// **'Abrir ficha del lugar'**
  String get mapOpenPlace;

  /// No description provided for @mapWhatIsHere.
  ///
  /// In es, this message translates to:
  /// **'¿Qué hay en este punto?'**
  String get mapWhatIsHere;

  /// No description provided for @mapRemoveMarker.
  ///
  /// In es, this message translates to:
  /// **'Quitar marca'**
  String get mapRemoveMarker;

  /// No description provided for @mapRemoveMarkerBody.
  ///
  /// In es, this message translates to:
  /// **'¿Quitar \"{label}\" del mapa?'**
  String mapRemoveMarkerBody(String label);

  /// No description provided for @mapThisMarker.
  ///
  /// In es, this message translates to:
  /// **'esta marca'**
  String get mapThisMarker;

  /// No description provided for @mapSectionPlaces.
  ///
  /// In es, this message translates to:
  /// **'Lugares'**
  String get mapSectionPlaces;

  /// No description provided for @mapSectionCharacters.
  ///
  /// In es, this message translates to:
  /// **'Personajes'**
  String get mapSectionCharacters;

  /// No description provided for @mapSectionItems.
  ///
  /// In es, this message translates to:
  /// **'Objetos'**
  String get mapSectionItems;

  /// No description provided for @relTitle.
  ///
  /// In es, this message translates to:
  /// **'Relaciones'**
  String get relTitle;

  /// No description provided for @relEmpty.
  ///
  /// In es, this message translates to:
  /// **'Sin relaciones registradas todavía.'**
  String get relEmpty;

  /// No description provided for @relNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva relación'**
  String get relNew;

  /// No description provided for @relEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar relación'**
  String get relEdit;

  /// No description provided for @relType.
  ///
  /// In es, this message translates to:
  /// **'Tipo de relación'**
  String get relType;

  /// No description provided for @relTypeOther.
  ///
  /// In es, this message translates to:
  /// **'Especifica el tipo'**
  String get relTypeOther;

  /// No description provided for @relPeople.
  ///
  /// In es, this message translates to:
  /// **'Personajes en esta relación'**
  String get relPeople;

  /// No description provided for @relPeopleHint.
  ///
  /// In es, this message translates to:
  /// **'Puedes marcar varios: sirve para tríos de hermanos, alianzas o grupos.'**
  String get relPeopleHint;

  /// No description provided for @relNoOthers.
  ///
  /// In es, this message translates to:
  /// **'No hay otros personajes en este proyecto.'**
  String get relNoOthers;

  /// No description provided for @relDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción (opcional)'**
  String get relDescription;

  /// No description provided for @relNoOtherPeople.
  ///
  /// In es, this message translates to:
  /// **'Sin otros personajes'**
  String get relNoOtherPeople;

  /// No description provided for @relKindFamily.
  ///
  /// In es, this message translates to:
  /// **'Familiar'**
  String get relKindFamily;

  /// No description provided for @relKindSiblings.
  ///
  /// In es, this message translates to:
  /// **'Hermanos'**
  String get relKindSiblings;

  /// No description provided for @relKindFriendship.
  ///
  /// In es, this message translates to:
  /// **'Amistad'**
  String get relKindFriendship;

  /// No description provided for @relKindRivalry.
  ///
  /// In es, this message translates to:
  /// **'Rivalidad'**
  String get relKindRivalry;

  /// No description provided for @relKindEnmity.
  ///
  /// In es, this message translates to:
  /// **'Enemistad'**
  String get relKindEnmity;

  /// No description provided for @relKindRomance.
  ///
  /// In es, this message translates to:
  /// **'Romance'**
  String get relKindRomance;

  /// No description provided for @relKindMentor.
  ///
  /// In es, this message translates to:
  /// **'Mentor'**
  String get relKindMentor;

  /// No description provided for @relKindApprentice.
  ///
  /// In es, this message translates to:
  /// **'Aprendiz'**
  String get relKindApprentice;

  /// No description provided for @relKindAllies.
  ///
  /// In es, this message translates to:
  /// **'Aliados'**
  String get relKindAllies;

  /// No description provided for @relKindPact.
  ///
  /// In es, this message translates to:
  /// **'Pacto'**
  String get relKindPact;

  /// No description provided for @relKindOther.
  ///
  /// In es, this message translates to:
  /// **'Otro'**
  String get relKindOther;

  /// No description provided for @tagsTitle.
  ///
  /// In es, this message translates to:
  /// **'Etiquetas'**
  String get tagsTitle;

  /// No description provided for @tagsNone.
  ///
  /// In es, this message translates to:
  /// **'Sin etiquetas.'**
  String get tagsNone;

  /// No description provided for @tagsNew.
  ///
  /// In es, this message translates to:
  /// **'Nueva etiqueta'**
  String get tagsNew;

  /// No description provided for @tagsHint.
  ///
  /// In es, this message translates to:
  /// **'ej. protagonista, capital, reliquia'**
  String get tagsHint;

  /// No description provided for @customFieldsTitle.
  ///
  /// In es, this message translates to:
  /// **'Campos propios'**
  String get customFieldsTitle;

  /// No description provided for @customFieldsEmpty.
  ///
  /// In es, this message translates to:
  /// **'Agrega los datos que tu mundo o tu sistema necesiten.'**
  String get customFieldsEmpty;

  /// No description provided for @customFieldNew.
  ///
  /// In es, this message translates to:
  /// **'Nuevo campo'**
  String get customFieldNew;

  /// No description provided for @customFieldName.
  ///
  /// In es, this message translates to:
  /// **'Nombre del campo'**
  String get customFieldName;

  /// No description provided for @customFieldNameHint.
  ///
  /// In es, this message translates to:
  /// **'ej. Fuerza, Idioma natal, Nivel de amenaza'**
  String get customFieldNameHint;

  /// No description provided for @customFieldValue.
  ///
  /// In es, this message translates to:
  /// **'Valor (opcional)'**
  String get customFieldValue;

  /// No description provided for @customFieldRemove.
  ///
  /// In es, this message translates to:
  /// **'Quitar campo'**
  String get customFieldRemove;

  /// No description provided for @imageUpload.
  ///
  /// In es, this message translates to:
  /// **'Subir imagen'**
  String get imageUpload;

  /// No description provided for @imageDraw.
  ///
  /// In es, this message translates to:
  /// **'Dibujar'**
  String get imageDraw;

  /// No description provided for @drawingTitle.
  ///
  /// In es, this message translates to:
  /// **'Dibujar'**
  String get drawingTitle;

  /// No description provided for @drawingBackground.
  ///
  /// In es, this message translates to:
  /// **'Imagen de fondo'**
  String get drawingBackground;

  /// No description provided for @drawingRemoveBackground.
  ///
  /// In es, this message translates to:
  /// **'Quitar fondo'**
  String get drawingRemoveBackground;

  /// No description provided for @drawingClear.
  ///
  /// In es, this message translates to:
  /// **'Borrar todo'**
  String get drawingClear;

  /// No description provided for @drawingBackgroundLabel.
  ///
  /// In es, this message translates to:
  /// **'Fondo'**
  String get drawingBackgroundLabel;

  /// No description provided for @drawingCustomColor.
  ///
  /// In es, this message translates to:
  /// **'Color personalizado'**
  String get drawingCustomColor;

  /// No description provided for @drawingUseColor.
  ///
  /// In es, this message translates to:
  /// **'Usar color'**
  String get drawingUseColor;

  /// No description provided for @sheetTitle.
  ///
  /// In es, this message translates to:
  /// **'Ficha de personaje'**
  String get sheetTitle;

  /// No description provided for @sheetProficiency.
  ///
  /// In es, this message translates to:
  /// **'Competencia +{bonus}'**
  String sheetProficiency(int bonus);

  /// No description provided for @sheetClass.
  ///
  /// In es, this message translates to:
  /// **'Clase'**
  String get sheetClass;

  /// No description provided for @sheetLevel.
  ///
  /// In es, this message translates to:
  /// **'Nivel'**
  String get sheetLevel;

  /// No description provided for @sheetArmorClass.
  ///
  /// In es, this message translates to:
  /// **'CA'**
  String get sheetArmorClass;

  /// No description provided for @sheetHp.
  ///
  /// In es, this message translates to:
  /// **'PG'**
  String get sheetHp;

  /// No description provided for @sheetMaxHp.
  ///
  /// In es, this message translates to:
  /// **'PG máx'**
  String get sheetMaxHp;

  /// No description provided for @sheetSpeed.
  ///
  /// In es, this message translates to:
  /// **'Vel.'**
  String get sheetSpeed;

  /// No description provided for @sheetAbilities.
  ///
  /// In es, this message translates to:
  /// **'Características'**
  String get sheetAbilities;

  /// No description provided for @sheetAbilitiesHint.
  ///
  /// In es, this message translates to:
  /// **'Marca la casilla si tiene competencia en esa salvación.'**
  String get sheetAbilitiesHint;

  /// No description provided for @sheetModifier.
  ///
  /// In es, this message translates to:
  /// **'Mod'**
  String get sheetModifier;

  /// No description provided for @sheetSave.
  ///
  /// In es, this message translates to:
  /// **'Salv.'**
  String get sheetSave;

  /// No description provided for @sheetAlignment.
  ///
  /// In es, this message translates to:
  /// **'Alineamiento'**
  String get sheetAlignment;

  /// No description provided for @sheetBackground.
  ///
  /// In es, this message translates to:
  /// **'Trasfondo'**
  String get sheetBackground;

  /// No description provided for @sheetFeatures.
  ///
  /// In es, this message translates to:
  /// **'Rasgos y aptitudes'**
  String get sheetFeatures;

  /// No description provided for @sheetEquipment.
  ///
  /// In es, this message translates to:
  /// **'Equipo'**
  String get sheetEquipment;

  /// No description provided for @abilityStrength.
  ///
  /// In es, this message translates to:
  /// **'Fuerza'**
  String get abilityStrength;

  /// No description provided for @abilityDexterity.
  ///
  /// In es, this message translates to:
  /// **'Destreza'**
  String get abilityDexterity;

  /// No description provided for @abilityConstitution.
  ///
  /// In es, this message translates to:
  /// **'Constitución'**
  String get abilityConstitution;

  /// No description provided for @abilityIntelligence.
  ///
  /// In es, this message translates to:
  /// **'Inteligencia'**
  String get abilityIntelligence;

  /// No description provided for @abilityWisdom.
  ///
  /// In es, this message translates to:
  /// **'Sabiduría'**
  String get abilityWisdom;

  /// No description provided for @abilityCharisma.
  ///
  /// In es, this message translates to:
  /// **'Carisma'**
  String get abilityCharisma;

  /// No description provided for @securityTitle.
  ///
  /// In es, this message translates to:
  /// **'Seguridad'**
  String get securityTitle;

  /// No description provided for @lockAskOnOpen.
  ///
  /// In es, this message translates to:
  /// **'Pedir PIN al abrir'**
  String get lockAskOnOpen;

  /// No description provided for @lockProtected.
  ///
  /// In es, this message translates to:
  /// **'Tus universos están protegidos'**
  String get lockProtected;

  /// No description provided for @lockUnprotected.
  ///
  /// In es, this message translates to:
  /// **'Cualquiera que tome el dispositivo puede leer tus universos.'**
  String get lockUnprotected;

  /// No description provided for @lockBackgroundNote.
  ///
  /// In es, this message translates to:
  /// **'La app se bloquea al salir a segundo plano.'**
  String get lockBackgroundNote;

  /// No description provided for @lockUseBiometrics.
  ///
  /// In es, this message translates to:
  /// **'Usar huella o rostro'**
  String get lockUseBiometrics;

  /// No description provided for @lockBiometricsNote.
  ///
  /// In es, this message translates to:
  /// **'Atajo al PIN, que sigue funcionando siempre.'**
  String get lockBiometricsNote;

  /// No description provided for @lockNoBiometrics.
  ///
  /// In es, this message translates to:
  /// **'Este dispositivo no tiene biometría configurada.'**
  String get lockNoBiometrics;

  /// No description provided for @lockChangePin.
  ///
  /// In es, this message translates to:
  /// **'Cambiar PIN'**
  String get lockChangePin;

  /// No description provided for @lockNow.
  ///
  /// In es, this message translates to:
  /// **'Bloquear ahora'**
  String get lockNow;

  /// No description provided for @lockChoosePin.
  ///
  /// In es, this message translates to:
  /// **'Elige un PIN'**
  String get lockChoosePin;

  /// No description provided for @lockConfirmCurrent.
  ///
  /// In es, this message translates to:
  /// **'Confirma tu PIN actual'**
  String get lockConfirmCurrent;

  /// No description provided for @lockNewPin.
  ///
  /// In es, this message translates to:
  /// **'Nuevo PIN'**
  String get lockNewPin;

  /// No description provided for @lockCurrentPin.
  ///
  /// In es, this message translates to:
  /// **'PIN actual'**
  String get lockCurrentPin;

  /// No description provided for @lockWrongPin.
  ///
  /// In es, this message translates to:
  /// **'PIN incorrecto.'**
  String get lockWrongPin;

  /// No description provided for @lockMinDigits.
  ///
  /// In es, this message translates to:
  /// **'Usa al menos 4 dígitos.'**
  String get lockMinDigits;

  /// No description provided for @lockUnlock.
  ///
  /// In es, this message translates to:
  /// **'Desbloquear'**
  String get lockUnlock;

  /// No description provided for @lockUnlockBiometric.
  ///
  /// In es, this message translates to:
  /// **'Desbloquear con huella o rostro'**
  String get lockUnlockBiometric;

  /// No description provided for @lockOk.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get lockOk;

  /// No description provided for @lockExplainer.
  ///
  /// In es, this message translates to:
  /// **'El PIN protege el acceso a la app en este dispositivo. No cifra el archivo de datos: alguien con acceso al sistema de archivos del teléfono aún podría leerlo. Si olvidas el PIN tendrás que reinstalar la app, así que guarda un respaldo.'**
  String get lockExplainer;

  /// No description provided for @diceErrEmpty.
  ///
  /// In es, this message translates to:
  /// **'Escribe una tirada, por ejemplo 2d6+3.'**
  String get diceErrEmpty;

  /// No description provided for @diceErrUnparsable.
  ///
  /// In es, this message translates to:
  /// **'No entendí \"{expression}\".'**
  String diceErrUnparsable(String expression);

  /// No description provided for @diceErrTooManyDice.
  ///
  /// In es, this message translates to:
  /// **'Usa entre 1 y {max} dados.'**
  String diceErrTooManyDice(int max);

  /// No description provided for @diceErrSideRange.
  ///
  /// In es, this message translates to:
  /// **'Los dados deben tener entre 2 y {max} caras.'**
  String diceErrSideRange(int max);

  /// No description provided for @diceErrUnknownTerm.
  ///
  /// In es, this message translates to:
  /// **'No entendí \"{term}\" en la tirada.'**
  String diceErrUnknownTerm(String term);

  /// No description provided for @backupErrNotABackup.
  ///
  /// In es, this message translates to:
  /// **'El archivo no parece un respaldo de Astrolabe.'**
  String get backupErrNotABackup;

  /// No description provided for @backupErrNewerFormat.
  ///
  /// In es, this message translates to:
  /// **'Este respaldo fue creado por una versión más nueva de la app.'**
  String get backupErrNewerFormat;

  /// No description provided for @lockBiometricReason.
  ///
  /// In es, this message translates to:
  /// **'Desbloquea tus universos'**
  String get lockBiometricReason;

  /// No description provided for @themeClassicName.
  ///
  /// In es, this message translates to:
  /// **'Clásico'**
  String get themeClassicName;

  /// No description provided for @themeClassicDesc.
  ///
  /// In es, this message translates to:
  /// **'Limpio y neutro. Deja que tu contenido hable.'**
  String get themeClassicDesc;

  /// No description provided for @themeMedievalName.
  ///
  /// In es, this message translates to:
  /// **'Medieval'**
  String get themeMedievalName;

  /// No description provided for @themeMedievalDesc.
  ///
  /// In es, this message translates to:
  /// **'Pergamino, vino y oro. Para reinos, espadas y linajes.'**
  String get themeMedievalDesc;

  /// No description provided for @themeSteampunkName.
  ///
  /// In es, this message translates to:
  /// **'Steampunk'**
  String get themeSteampunkName;

  /// No description provided for @themeSteampunkDesc.
  ///
  /// In es, this message translates to:
  /// **'Latón, cobre y cardenillo. Engranajes y vapor.'**
  String get themeSteampunkDesc;

  /// No description provided for @themeCyberpunkName.
  ///
  /// In es, this message translates to:
  /// **'Cyberpunk'**
  String get themeCyberpunkName;

  /// No description provided for @themeCyberpunkDesc.
  ///
  /// In es, this message translates to:
  /// **'Neón sobre negro. Circuitos, datos y lluvia ácida.'**
  String get themeCyberpunkDesc;

  /// No description provided for @themeSolarpunkName.
  ///
  /// In es, this message translates to:
  /// **'Solarpunk'**
  String get themeSolarpunkName;

  /// No description provided for @themeSolarpunkDesc.
  ///
  /// In es, this message translates to:
  /// **'Verde, sol y aire limpio. Futuros que dan ganas de vivir.'**
  String get themeSolarpunkDesc;

  /// No description provided for @themeCosmicName.
  ///
  /// In es, this message translates to:
  /// **'Cósmico'**
  String get themeCosmicName;

  /// No description provided for @themeCosmicDesc.
  ///
  /// In es, this message translates to:
  /// **'Nebulosas y luz de estrellas. Naves, imperios y vacío.'**
  String get themeCosmicDesc;

  /// No description provided for @themeGothicName.
  ///
  /// In es, this message translates to:
  /// **'Gótico'**
  String get themeGothicName;

  /// No description provided for @themeGothicDesc.
  ///
  /// In es, this message translates to:
  /// **'Carmesí y ceniza. Vampiros, ruinas y secretos.'**
  String get themeGothicDesc;
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
