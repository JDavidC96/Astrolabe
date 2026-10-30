// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class LEs extends L {
  LEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Astrolabe';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonAdd => 'Agregar';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonRemove => 'Quitar';

  @override
  String get commonRequired => 'Requerido';

  @override
  String get commonOptional => 'opcional';

  @override
  String get commonNone => 'Ninguno';

  @override
  String commonError(String message) {
    return 'Error: $message';
  }

  @override
  String get commonSearch => 'Buscar';

  @override
  String get commonSearchHint => 'Buscar...';

  @override
  String get commonNoMatches => 'Nada coincide con la búsqueda.';

  @override
  String commonSelectedCount(int count) {
    return '$count seleccionado(s)';
  }

  @override
  String commonSelectedCountFiltered(int count, int hidden) {
    return '$count seleccionado(s) · $hidden fuera del filtro';
  }

  @override
  String get projectsTitle => 'Mis universos';

  @override
  String get projectsEmpty =>
      'Todavía no has creado ningún libro/universo.\nToca + para empezar.';

  @override
  String get projectsKindNovel => 'Libro / novela';

  @override
  String get projectsKindCampaign => 'Campaña de rol';

  @override
  String get projectNew => 'Nuevo universo';

  @override
  String get projectEdit => 'Editar universo';

  @override
  String get projectName => 'Nombre';

  @override
  String get projectDescription => 'Descripción (opcional)';

  @override
  String get projectPurpose => '¿Para qué es?';

  @override
  String get projectKindBook => 'Libro';

  @override
  String get projectKindCampaignShort => 'Campaña';

  @override
  String get projectHintCampaign =>
      'Agrega fichas de personaje, sesiones y dados.';

  @override
  String get projectHintNovel => 'Agrega capítulos y notas de escritura.';

  @override
  String get projectAesthetic => 'Estética';

  @override
  String get projectCover => 'Portada';

  @override
  String get projectSaveFirstForCover =>
      'Guarda el universo para poder elegir o dibujar su portada.';

  @override
  String get projectDeleteTitle => 'Eliminar universo';

  @override
  String projectDeleteBody(String name) {
    return '¿Seguro que quieres eliminar \"$name\"? Se borrarán todos sus personajes, lugares, facciones y eventos. Esta acción no se puede deshacer.';
  }

  @override
  String get sectionCharacters => 'Personajes';

  @override
  String get sectionWorld => 'Mundo';

  @override
  String get sectionFactions => 'Facciones';

  @override
  String get sectionTimeline => 'Línea de tiempo';

  @override
  String get sectionWrite => 'Escribir';

  @override
  String get sectionChapters => 'Capítulos';

  @override
  String get sectionSessions => 'Sesiones';

  @override
  String get sectionNotes => 'Notas';

  @override
  String get sectionItems => 'Objetos';

  @override
  String get sectionMagic => 'Magia';

  @override
  String get toolFamilyTree => 'Árbol genealógico';

  @override
  String get toolSecrets => 'Secretos';

  @override
  String get toolDice => 'Dados';

  @override
  String get toolAppearance => 'Apariencia';

  @override
  String get toolBackup => 'Exportar / respaldar';

  @override
  String get drawerUniverse => 'Universo';

  @override
  String get drawerMyUniverses => 'Mis universos';

  @override
  String get searchWholeUniverse => 'Buscar en todo el universo';

  @override
  String get supportTitle => 'Invítame un café';

  @override
  String get supportSubtitle => 'Si la app te sirve y quieres apoyarla';

  @override
  String get supportBody =>
      'Astrolabe es gratis y sin anuncios. Si te sirve y quieres apoyarla, puedes hacerlo desde cualquier banco colombiano con esta llave Bre-B.';

  @override
  String get supportKeyLabel => 'Llave Bre-B';

  @override
  String get supportCopyKey => 'Copiar llave';

  @override
  String get supportCopied =>
      'Llave copiada. Pégala en tu app del banco, en \"Enviar con Bre-B\".';

  @override
  String get supportHow =>
      'Cómo: abre tu app del banco (Nequi, Daviplata, Bancolombia, la que uses), busca \"Enviar con Bre-B\" y pega la llave.';

  @override
  String get settingsSecurity => 'Seguridad';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get appearanceBrightness => 'Brillo';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceAuto => 'Auto';

  @override
  String get appearanceDark => 'Oscuro';

  @override
  String get appearanceBrightnessNote => 'Este ajuste vale para toda la app.';

  @override
  String get appearanceThemeTitle => 'Tema de este universo';

  @override
  String get appearanceThemeNote =>
      'Cada universo guarda su propio tema, así que tu saga medieval y tu campaña cyberpunk no tienen que verse igual.';

  @override
  String get appearanceButtonSample => 'Botón';

  @override
  String get appearanceButtonOther => 'Otro';

  @override
  String get appearanceSystemFont => 'Sistema';

  @override
  String get languageTitle => 'Idioma';

  @override
  String get languageSystem => 'Automático (idioma del dispositivo)';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageNote =>
      'Cambia el idioma de la app. Tus universos y lo que escribas no se traducen.';

  @override
  String get charSearchHint => 'Buscar personaje...';

  @override
  String get charEmpty => 'No hay personajes todavía. Toca + para crear uno.';

  @override
  String get charNoMatch => 'Ningún personaje coincide con la búsqueda.';

  @override
  String get charFilterAll => 'Todos';

  @override
  String get charNew => 'Nuevo personaje';

  @override
  String get charEdit => 'Editar personaje';

  @override
  String get charSaved => 'Personaje guardado';

  @override
  String get charDeleteTitle => 'Eliminar personaje';

  @override
  String get charDeleteBody => '¿Seguro que quieres eliminar este personaje?';

  @override
  String get charSectionBasics => 'Datos básicos';

  @override
  String get charFirstName => 'Nombre *';

  @override
  String get charLastName => 'Apellido (opcional)';

  @override
  String get charAlias => 'Alias / apodo (opcional)';

  @override
  String get charRace => 'Raza / especie (opcional)';

  @override
  String get charGender => 'Género (opcional)';

  @override
  String get charAge => 'Edad (opcional)';

  @override
  String get charOccupation => 'Ocupación (opcional)';

  @override
  String get charFaction => 'Facción / casa (opcional)';

  @override
  String get charStatus => 'Estado';

  @override
  String get charStatusHint => 'Vivo, muerto, desaparecido...';

  @override
  String get charRole => 'Rol en la mesa (opcional)';

  @override
  String get charRoleUndefined => 'Sin definir';

  @override
  String get charRolePc => 'Jugador (PJ)';

  @override
  String get charRoleNpc => 'NPC';

  @override
  String get charRoleEnemy => 'Enemigo';

  @override
  String get charAppearance => 'Apariencia física (opcional)';

  @override
  String get charPersonality => 'Personalidad (opcional)';

  @override
  String get charBackstory => 'Historia / trasfondo (opcional)';

  @override
  String get charAbilities => 'Habilidades (opcional)';

  @override
  String get charNotes => 'Notas (opcional)';

  @override
  String get charSaveFirst =>
      'Guarda el personaje para poder agregar imagen y relaciones.';

  @override
  String get charAppearsIn => 'Aparece en';

  @override
  String get charAttendedSessions => 'Sesiones en las que estuvo';

  @override
  String get charNoAppearancesChapters =>
      'Todavía no está marcado en ningún capítulo. Se marca desde el capítulo, no desde aquí.';

  @override
  String get charNoAppearancesSessions =>
      'Todavía no está marcado en ninguna sesión. Se marca desde la sesión, no desde aquí.';

  @override
  String get worldEmpty =>
      'No hay lugares todavía. Crea el primero con el botón +.';

  @override
  String get worldAddSub => 'Agregar sublugar';

  @override
  String get worldViewMap => 'Ver mapa';

  @override
  String get worldViewDetails => 'Ver / editar detalles de este lugar';

  @override
  String get locNew => 'Nuevo lugar';

  @override
  String get locEdit => 'Editar lugar';

  @override
  String get locSaved => 'Lugar guardado';

  @override
  String get locDeleteTitle => 'Eliminar lugar';

  @override
  String locDeleteBody(String name) {
    return '¿Eliminar \"$name\"? También se eliminarán sus sublugares.';
  }

  @override
  String get locDeleteBodyPlain =>
      '¿Eliminar este lugar? También se eliminarán sus sublugares.';

  @override
  String get locName => 'Nombre *';

  @override
  String get locType => 'Tipo (opcional)';

  @override
  String get locTypeHint => 'Continente, reino, ciudad, bosque...';

  @override
  String get locParent => 'Lugar padre (opcional)';

  @override
  String get locParentRoot => 'Ninguno (raíz)';

  @override
  String get locClimate => 'Clima (opcional)';

  @override
  String get locPopulation => 'Población (opcional)';

  @override
  String get locGovernment => 'Gobierno (opcional)';

  @override
  String get locStatus => 'Estado (opcional)';

  @override
  String get locDescription => 'Descripción (opcional)';

  @override
  String get locMapLabel => 'Mapa / imagen';

  @override
  String get locMapPending => 'Mapa de este lugar';

  @override
  String get locMapPendingHint =>
      'Guarda el lugar (✓ arriba) y aquí podrás subir un mapa o dibujarlo.';

  @override
  String get locOpenInteractiveMap => 'Abrir mapa interactivo';

  @override
  String get locCycleWarning => 'Ese vínculo crearía un bucle en el árbol.';

  @override
  String get facEmpty => 'No hay facciones todavía. Toca + para crear una.';

  @override
  String get facNew => 'Nueva facción';

  @override
  String get facEdit => 'Editar facción';

  @override
  String get facSaved => 'Facción guardada';

  @override
  String get facDeleteTitle => 'Eliminar facción';

  @override
  String get facDeleteBody =>
      '¿Eliminar esta facción? Los personajes miembros dejarán de tenerla asignada.';

  @override
  String get facName => 'Nombre *';

  @override
  String get facType => 'Tipo (opcional)';

  @override
  String get facTypeHint => 'Casa, gremio, reino, ejército...';

  @override
  String get facStatus => 'Estado (opcional)';

  @override
  String get facDescription => 'Descripción (opcional)';

  @override
  String get facSymbol => 'Símbolo / estandarte';

  @override
  String get facMembers => 'Miembros';

  @override
  String get facNoMembers =>
      'Ningún personaje pertenece a esta facción todavía.';

  @override
  String get itemEmpty =>
      'No hay objetos todavía. Toca + para agregar una reliquia, arma o artefacto.';

  @override
  String get itemNew => 'Nuevo objeto';

  @override
  String get itemEdit => 'Editar objeto';

  @override
  String get itemSaved => 'Objeto guardado';

  @override
  String get itemDeleteTitle => 'Eliminar objeto';

  @override
  String get itemDeleteBody => '¿Eliminar este objeto?';

  @override
  String get itemName => 'Nombre *';

  @override
  String get itemType => 'Tipo (opcional)';

  @override
  String get itemTypeHint => 'Arma, reliquia, libro, amuleto...';

  @override
  String get itemOwner => 'Portador actual (opcional)';

  @override
  String get itemOwnerNone => 'Nadie';

  @override
  String get itemLocation => 'Ubicación (opcional)';

  @override
  String get itemLocationUnknown => 'Desconocida';

  @override
  String get itemOrigin => 'Origen (opcional)';

  @override
  String get itemPowers => 'Poderes / propiedades (opcional)';

  @override
  String get itemDescription => 'Descripción (opcional)';

  @override
  String get itemImage => 'Imagen del objeto';

  @override
  String get magicEmpty =>
      'No hay sistemas de magia todavía. Toca + para definir cómo funciona la magia (o la tecnología) de tu mundo.';

  @override
  String get magicNew => 'Nuevo sistema';

  @override
  String get magicEdit => 'Editar sistema';

  @override
  String get magicSaved => 'Sistema de magia guardado';

  @override
  String get magicDeleteTitle => 'Eliminar sistema';

  @override
  String get magicDeleteBody => '¿Eliminar este sistema de magia?';

  @override
  String get magicName => 'Nombre *';

  @override
  String get magicSource => 'Fuente del poder (opcional)';

  @override
  String get magicSourceHint => 'Los dioses, la sangre, runas, el éter...';

  @override
  String get magicRules => 'Reglas / cómo funciona (opcional)';

  @override
  String get magicLimits => 'Limitaciones (opcional)';

  @override
  String get magicCost => 'Costo / precio a pagar (opcional)';

  @override
  String get magicDescription => 'Descripción general (opcional)';

  @override
  String get magicSymbol => 'Símbolo / esquema';

  @override
  String get timelineEmpty =>
      'No hay eventos todavía. Crea el primero con el botón +.';

  @override
  String get timelineSortByYear => 'Ordenar por año';

  @override
  String get timelineSortByYearOn =>
      'Cronológico. Los eventos sin año van al final.';

  @override
  String get timelineSortByYearOff => 'Orden manual: arrastra para reordenar.';

  @override
  String get timelineAutoChapters => 'Incluir capítulos automáticamente';

  @override
  String get timelineAutoChaptersOn =>
      'Los capítulos con resumen aparecen aquí y se actualizan solos.';

  @override
  String get timelineAutoChaptersOff =>
      'Actívalo para que cada resumen de capítulo aparezca en la línea de tiempo.';

  @override
  String get timelineAutoOffNotice =>
      'Se quitaron los eventos que venían de capítulos. Los que creaste a mano siguen intactos.';

  @override
  String get timelineFromChapter => 'Desde un capítulo';

  @override
  String timelineYearChip(int year) {
    return 'Año $year';
  }

  @override
  String get eventNew => 'Nuevo evento';

  @override
  String get eventEdit => 'Editar evento';

  @override
  String get eventSaved => 'Evento guardado';

  @override
  String get eventDeleteTitle => 'Eliminar evento';

  @override
  String get eventDeleteBody => '¿Eliminar este evento de la línea de tiempo?';

  @override
  String eventDeleteNamed(String title) {
    return '¿Eliminar \"$title\"?';
  }

  @override
  String get eventLinkedTitle => 'Este evento viene de un capítulo';

  @override
  String get eventLinkedBody =>
      'Su título, resumen y año se actualizan solos cuando edites el capítulo. Si quieres redactarlo distinto aquí, desvincúlalo.';

  @override
  String get eventUnlink => 'Desvincular del capítulo';

  @override
  String get eventTitle => 'Título *';

  @override
  String get eventYear => 'Año (opcional)';

  @override
  String get eventYearHelp =>
      'Solo números. Sirve para ordenar cronológicamente.';

  @override
  String get eventFictionalDate => 'Fecha ficticia (opcional)';

  @override
  String get eventFictionalDateHint =>
      'Año 3 de la Tercera Era, 12 de invierno...';

  @override
  String get eventPlace => 'Lugar (opcional)';

  @override
  String get eventDescription => 'Descripción (opcional)';

  @override
  String get eventPeople => 'Personajes involucrados';

  @override
  String get eventNoCharacters => 'No hay personajes en este proyecto todavía.';

  @override
  String get chapEmptyChapters =>
      'Todavía no hay capítulos. Toca + y empieza a escribir el primero.';

  @override
  String get chapEditChapter => 'Editar capítulo';

  @override
  String get chapEditSession => 'Editar sesión';

  @override
  String get chapSaved => 'Capítulo guardado';

  @override
  String get chapDeleteTitle => 'Eliminar capítulo';

  @override
  String get chapDeleteBody => '¿Eliminar este capítulo?';

  @override
  String chapDeleteNamed(String title) {
    return '¿Eliminar \"$title\"?';
  }

  @override
  String get chapTitle => 'Título *';

  @override
  String get chapStatus => 'Estado (opcional)';

  @override
  String get chapStatusHintChapter => 'Borrador, revisado, terminado...';

  @override
  String get chapStatusHintSession => 'Jugada, pendiente, cancelada...';

  @override
  String get chapPlayedOn => 'Fecha en que se jugó';

  @override
  String get chapNoDate => 'Sin fecha';

  @override
  String get chapStoryYear => 'Año en la historia (opcional)';

  @override
  String get chapStoryYearHelp => 'Para ubicarlo en la línea de tiempo.';

  @override
  String get chapSummary => 'Resumen (opcional)';

  @override
  String get chapSummaryHelp =>
      'Si activas la opción, aparece en la línea de tiempo.';

  @override
  String get chapContent => 'Contenido';

  @override
  String get chapContentEmpty => 'Vacío. Toca para escribir.';

  @override
  String chapWordCount(int count) {
    return '$count palabras';
  }

  @override
  String chapWordCountGoal(int count, int goal) {
    return '$count palabras de $goal';
  }

  @override
  String get chapResume => 'Continuar escribiendo';

  @override
  String get chapDetails => 'Detalles';

  @override
  String chapDefaultChapterTitle(int number) {
    return 'Capítulo $number';
  }

  @override
  String chapDefaultSessionTitle(int number) {
    return 'Sesión $number';
  }

  @override
  String get chapAddToTimeline => 'Agregar a la línea de tiempo';

  @override
  String get chapAddedToTimeline =>
      'Agregado a la línea de tiempo. Puedes editarlo ahí libremente.';

  @override
  String get chapWhoAttended => 'Quiénes asistieron';

  @override
  String get chapWhoAppears => 'Personajes que aparecen';

  @override
  String get chapNoCharacters => 'No hay personajes en este universo todavía.';

  @override
  String get chapPlaces => 'Lugares donde ocurre';

  @override
  String get chapNoPlaces => 'No hay lugares en este universo todavía.';

  @override
  String get searchPlaceHint => 'Buscar lugar...';

  @override
  String get editorHint => 'Escribe aquí...';

  @override
  String get editorFocusMode => 'Modo sin distracciones';

  @override
  String get editorExitFocus => 'Salir del modo sin distracciones';

  @override
  String get editorSaving => 'Guardando';

  @override
  String get editorSaved => 'Guardado';

  @override
  String get editorUnsaved => 'Sin guardar';

  @override
  String get editorSubheading => 'Subtítulo';

  @override
  String get editorSceneBreak => 'Separador de escena';

  @override
  String get editorGoalTitle => 'Meta de palabras';

  @override
  String get editorGoalLabel => 'Palabras para este capítulo';

  @override
  String get editorGoalRemove => 'Quitar meta';

  @override
  String get noteEmpty => 'No hay notas todavía. Toca + para escribir una.';

  @override
  String get noteNew => 'Nueva nota';

  @override
  String get noteEdit => 'Editar nota';

  @override
  String get noteDeleteTitle => 'Eliminar nota';

  @override
  String noteDeleteNamed(String title) {
    return '¿Eliminar \"$title\"?';
  }

  @override
  String get noteTitle => 'Título';

  @override
  String get noteContent => 'Contenido';

  @override
  String get secretsTitle => 'Secretos';

  @override
  String get secretsEmpty =>
      'Registra un secreto y marca qué personajes lo saben, cómo se enteraron y desde cuándo.';

  @override
  String get secretNobodyKnows => 'Nadie lo sabe todavía';

  @override
  String secretKnownBy(String names) {
    return 'Lo saben: $names';
  }

  @override
  String secretOwnedBy(String name) {
    return 'Secreto de: $name';
  }

  @override
  String get secretNew => 'Nuevo secreto';

  @override
  String get secretEdit => 'Editar secreto';

  @override
  String get secretLabel => 'Secreto';

  @override
  String get secretHint => 'ej. Aria es la heredera legítima';

  @override
  String get secretDetails => 'Detalles (opcional)';

  @override
  String get secretOwnerQuestion => '¿De quién es el secreto?';

  @override
  String get secretOwnerNobody => 'De nadie en particular';

  @override
  String get secretWhoKnows => '¿Quién lo sabe?';

  @override
  String secretHowFound(String name) {
    return '¿Cómo se enteró $name? (opcional)';
  }

  @override
  String get secretNoCharacters => 'No hay personajes todavía.';

  @override
  String get diceTitle => 'Dados';

  @override
  String get diceClearHistory => 'Limpiar historial';

  @override
  String get diceRollLabel => 'Tirada';

  @override
  String get diceRollHint => 'd20, 2d6+3, 4d8-1';

  @override
  String get diceRollButton => 'Tirar';

  @override
  String get diceDisadvantage => 'Desventaja';

  @override
  String get diceNormal => 'Normal';

  @override
  String get diceAdvantage => 'Ventaja';

  @override
  String get diceNoRolls => 'Sin tiradas todavía.';

  @override
  String get diceAdvantageWord => 'ventaja';

  @override
  String get diceDisadvantageWord => 'desventaja';

  @override
  String get searchTitle => 'Buscar en el universo';

  @override
  String get searchHintLong =>
      'Buscar personajes, lugares, objetos, capítulos...';

  @override
  String get searchPrompt =>
      'Escribe para buscar en todo el universo a la vez.';

  @override
  String get searchNoResults => 'Sin resultados.';

  @override
  String searchAllCount(int count) {
    return 'Todo ($count)';
  }

  @override
  String get searchKindCharacter => 'Personaje';

  @override
  String get searchKindLocation => 'Lugar';

  @override
  String get searchKindFaction => 'Facción';

  @override
  String get searchKindEvent => 'Evento';

  @override
  String get searchKindItem => 'Objeto';

  @override
  String get searchKindMagic => 'Magia';

  @override
  String get searchKindChapter => 'Capítulo';

  @override
  String get searchKindNote => 'Nota';

  @override
  String get backupTitle => 'Exportar / respaldar';

  @override
  String get backupLocalTitle => 'Todo se guarda solo en este dispositivo';

  @override
  String get backupLocalBody =>
      'La app no sube nada a ninguna nube por su cuenta. Si pierdes, formateas o cambias de teléfono sin un respaldo, pierdes el universo entero.';

  @override
  String get backupTip =>
      'Truco: al tocar \"Exportar y compartir\" se abre el selector de compartir de tu teléfono — ahí puedes elegir Google Drive (u otra nube que tengas instalada) para subir el respaldo con dos toques, sin salir de la app.';

  @override
  String get backupIncludes =>
      'El respaldo incluye personajes, mundo, facciones, línea de tiempo, capítulos, notas, objetos, magia, etiquetas y todas las imágenes y dibujos.';

  @override
  String get backupExportShare => 'Exportar y compartir';

  @override
  String get backupExportSave => 'Solo guardar en el dispositivo';

  @override
  String backupLast(String path) {
    return 'Último respaldo:\n$path';
  }

  @override
  String backupSavedAt(String path) {
    return 'Respaldo guardado en:\n$path';
  }

  @override
  String get backupShareText => 'Respaldo de mi universo';

  @override
  String backupExportFailed(String error) {
    return 'No se pudo exportar: $error';
  }

  @override
  String get backupImportTitle => 'Importar';

  @override
  String get backupImportBody =>
      'Restaura un respaldo como un universo nuevo. No sobrescribe nada de lo que ya tienes.';

  @override
  String get backupImportButton => 'Importar respaldo (.wbz)';

  @override
  String get backupImportPick => 'Elige un respaldo (.wbz)';

  @override
  String get backupImported =>
      'Universo importado. Búscalo en \"Mis universos\".';

  @override
  String backupImportFailed(String error) {
    return 'No se pudo importar: $error';
  }

  @override
  String get backupNotOurs => 'El archivo no parece un respaldo de Astrolabe.';

  @override
  String get backupTooNew =>
      'Este respaldo fue creado por una versión más nueva de la app.';

  @override
  String get familyTitle => 'Árbol genealógico';

  @override
  String get familyExport => 'Exportar';

  @override
  String get familyShareImage => 'Compartir imagen';

  @override
  String get familySaveImage => 'Guardar imagen';

  @override
  String get familyShareText => 'Árbol genealógico';

  @override
  String get familyNoCharacters => 'Todavía no hay personajes.';

  @override
  String get familyNoLinks => 'Todavía no hay vínculos familiares.';

  @override
  String get familyHint =>
      'Abre un personaje y agrega padres, hijos o pareja en la sección \"Familia\".';

  @override
  String get familyUnlinked => 'Sin familia registrada';

  @override
  String get familyNotReady => 'El árbol no está listo.';

  @override
  String get familyNoImage => 'No se pudo generar la imagen.';

  @override
  String familyExportFailed(String error) {
    return 'No se pudo exportar: $error';
  }

  @override
  String familySavedAt(String path) {
    return 'Guardado en:\n$path';
  }

  @override
  String get familySection => 'Familia';

  @override
  String get familyViewTree => 'Ver árbol';

  @override
  String get familyParents => 'Padres / madres';

  @override
  String get familyChildren => 'Hijos / hijas';

  @override
  String get familyPartner => 'Pareja';

  @override
  String get familyNoneRecorded => 'Ninguno registrado.';

  @override
  String get familyPickParent => 'Elegir padre/madre';

  @override
  String get familyPickChild => 'Elegir hijo/hija';

  @override
  String get familyPickPartner => 'Elegir pareja';

  @override
  String get familyNoOthers => 'No hay otros personajes todavía.';

  @override
  String get familyPartnerKind => '¿Qué tipo de vínculo?';

  @override
  String get familyDerived => 'Parentescos deducidos';

  @override
  String get familyDerivedHint =>
      'Al registrar padres e hijos, aquí aparecerán solos los hermanos, abuelos, tíos y primos.';

  @override
  String get kinFullSiblings => 'Hermanos (mismos padres)';

  @override
  String get kinHalfSiblings => 'Medios hermanos';

  @override
  String get kinGrandparents => 'Abuelos';

  @override
  String get kinGrandchildren => 'Nietos';

  @override
  String get kinUncles => 'Tíos';

  @override
  String get kinNiblings => 'Sobrinos';

  @override
  String get kinCousins => 'Primos';

  @override
  String get partnerMarriage => 'Matrimonio';

  @override
  String get partnerCouple => 'Pareja';

  @override
  String get partnerEngaged => 'Prometidos';

  @override
  String get partnerLovers => 'Amantes';

  @override
  String get partnerOther => 'Otro';

  @override
  String get mapTitle => 'Mapa';

  @override
  String get mapPlaceMarkers => 'Colocar marcas';

  @override
  String get mapDone => 'Terminar';

  @override
  String get mapEditHint =>
      'Toca el mapa para poner una marca. Arrastra una marca para moverla.';

  @override
  String get mapNoFile => 'No se encontró el archivo del mapa.';

  @override
  String mapNoMapYet(String name) {
    return '\"$name\" todavía no tiene mapa.';
  }

  @override
  String get mapNoMapHint =>
      'Abre la ficha del lugar y sube una imagen o dibújala; después podrás poner marcas encima.';

  @override
  String get mapOpenPlace => 'Abrir ficha del lugar';

  @override
  String get mapWhatIsHere => '¿Qué hay en este punto?';

  @override
  String get mapRemoveMarker => 'Quitar marca';

  @override
  String mapRemoveMarkerBody(String label) {
    return '¿Quitar \"$label\" del mapa?';
  }

  @override
  String get mapThisMarker => 'esta marca';

  @override
  String get mapSectionPlaces => 'Lugares';

  @override
  String get mapSectionCharacters => 'Personajes';

  @override
  String get mapSectionItems => 'Objetos';

  @override
  String get relTitle => 'Relaciones';

  @override
  String get relEmpty => 'Sin relaciones registradas todavía.';

  @override
  String get relNew => 'Nueva relación';

  @override
  String get relEdit => 'Editar relación';

  @override
  String get relType => 'Tipo de relación';

  @override
  String get relTypeOther => 'Especifica el tipo';

  @override
  String get relPeople => 'Personajes en esta relación';

  @override
  String get relPeopleHint =>
      'Puedes marcar varios: sirve para tríos de hermanos, alianzas o grupos.';

  @override
  String get relNoOthers => 'No hay otros personajes en este proyecto.';

  @override
  String get relDescription => 'Descripción (opcional)';

  @override
  String get relNoOtherPeople => 'Sin otros personajes';

  @override
  String get relKindFamily => 'Familiar';

  @override
  String get relKindSiblings => 'Hermanos';

  @override
  String get relKindFriendship => 'Amistad';

  @override
  String get relKindRivalry => 'Rivalidad';

  @override
  String get relKindEnmity => 'Enemistad';

  @override
  String get relKindRomance => 'Romance';

  @override
  String get relKindMentor => 'Mentor';

  @override
  String get relKindApprentice => 'Aprendiz';

  @override
  String get relKindAllies => 'Aliados';

  @override
  String get relKindPact => 'Pacto';

  @override
  String get relKindOther => 'Otro';

  @override
  String get tagsTitle => 'Etiquetas';

  @override
  String get tagsNone => 'Sin etiquetas.';

  @override
  String get tagsNew => 'Nueva etiqueta';

  @override
  String get tagsHint => 'ej. protagonista, capital, reliquia';

  @override
  String get customFieldsTitle => 'Campos propios';

  @override
  String get customFieldsEmpty =>
      'Agrega los datos que tu mundo o tu sistema necesiten.';

  @override
  String get customFieldNew => 'Nuevo campo';

  @override
  String get customFieldName => 'Nombre del campo';

  @override
  String get customFieldNameHint =>
      'ej. Fuerza, Idioma natal, Nivel de amenaza';

  @override
  String get customFieldValue => 'Valor (opcional)';

  @override
  String get customFieldRemove => 'Quitar campo';

  @override
  String get imageUpload => 'Subir imagen';

  @override
  String get imageDraw => 'Dibujar';

  @override
  String get drawingTitle => 'Dibujar';

  @override
  String get drawingBackground => 'Imagen de fondo';

  @override
  String get drawingRemoveBackground => 'Quitar fondo';

  @override
  String get drawingClear => 'Borrar todo';

  @override
  String get drawingBackgroundLabel => 'Fondo';

  @override
  String get drawingCustomColor => 'Color personalizado';

  @override
  String get drawingUseColor => 'Usar color';

  @override
  String get sheetTitle => 'Ficha de personaje';

  @override
  String sheetProficiency(int bonus) {
    return 'Competencia +$bonus';
  }

  @override
  String get sheetClass => 'Clase';

  @override
  String get sheetLevel => 'Nivel';

  @override
  String get sheetArmorClass => 'CA';

  @override
  String get sheetHp => 'PG';

  @override
  String get sheetMaxHp => 'PG máx';

  @override
  String get sheetSpeed => 'Vel.';

  @override
  String get sheetAbilities => 'Características';

  @override
  String get sheetAbilitiesHint =>
      'Marca la casilla si tiene competencia en esa salvación.';

  @override
  String get sheetModifier => 'Mod';

  @override
  String get sheetSave => 'Salv.';

  @override
  String get sheetAlignment => 'Alineamiento';

  @override
  String get sheetBackground => 'Trasfondo';

  @override
  String get sheetFeatures => 'Rasgos y aptitudes';

  @override
  String get sheetEquipment => 'Equipo';

  @override
  String get abilityStrength => 'Fuerza';

  @override
  String get abilityDexterity => 'Destreza';

  @override
  String get abilityConstitution => 'Constitución';

  @override
  String get abilityIntelligence => 'Inteligencia';

  @override
  String get abilityWisdom => 'Sabiduría';

  @override
  String get abilityCharisma => 'Carisma';

  @override
  String get securityTitle => 'Seguridad';

  @override
  String get lockAskOnOpen => 'Pedir PIN al abrir';

  @override
  String get lockProtected => 'Tus universos están protegidos';

  @override
  String get lockUnprotected =>
      'Cualquiera que tome el dispositivo puede leer tus universos.';

  @override
  String get lockBackgroundNote =>
      'La app se bloquea al salir a segundo plano.';

  @override
  String get lockUseBiometrics => 'Usar huella o rostro';

  @override
  String get lockBiometricsNote =>
      'Atajo al PIN, que sigue funcionando siempre.';

  @override
  String get lockNoBiometrics =>
      'Este dispositivo no tiene biometría configurada.';

  @override
  String get lockChangePin => 'Cambiar PIN';

  @override
  String get lockNow => 'Bloquear ahora';

  @override
  String get lockChoosePin => 'Elige un PIN';

  @override
  String get lockConfirmCurrent => 'Confirma tu PIN actual';

  @override
  String get lockNewPin => 'Nuevo PIN';

  @override
  String get lockCurrentPin => 'PIN actual';

  @override
  String get lockWrongPin => 'PIN incorrecto.';

  @override
  String get lockMinDigits => 'Usa al menos 4 dígitos.';

  @override
  String get lockUnlock => 'Desbloquear';

  @override
  String get lockUnlockBiometric => 'Desbloquear con huella o rostro';

  @override
  String get lockOk => 'Aceptar';

  @override
  String get lockExplainer =>
      'El PIN protege el acceso a la app en este dispositivo. No cifra el archivo de datos: alguien con acceso al sistema de archivos del teléfono aún podría leerlo. Si olvidas el PIN tendrás que reinstalar la app, así que guarda un respaldo.';

  @override
  String get diceErrEmpty => 'Escribe una tirada, por ejemplo 2d6+3.';

  @override
  String diceErrUnparsable(String expression) {
    return 'No entendí \"$expression\".';
  }

  @override
  String diceErrTooManyDice(int max) {
    return 'Usa entre 1 y $max dados.';
  }

  @override
  String diceErrSideRange(int max) {
    return 'Los dados deben tener entre 2 y $max caras.';
  }

  @override
  String diceErrUnknownTerm(String term) {
    return 'No entendí \"$term\" en la tirada.';
  }

  @override
  String get backupErrNotABackup =>
      'El archivo no parece un respaldo de Astrolabe.';

  @override
  String get backupErrNewerFormat =>
      'Este respaldo fue creado por una versión más nueva de la app.';

  @override
  String get lockBiometricReason => 'Desbloquea tus universos';

  @override
  String get themeClassicName => 'Clásico';

  @override
  String get themeClassicDesc =>
      'Limpio y neutro. Deja que tu contenido hable.';

  @override
  String get themeMedievalName => 'Medieval';

  @override
  String get themeMedievalDesc =>
      'Pergamino, vino y oro. Para reinos, espadas y linajes.';

  @override
  String get themeSteampunkName => 'Steampunk';

  @override
  String get themeSteampunkDesc =>
      'Latón, cobre y cardenillo. Engranajes y vapor.';

  @override
  String get themeCyberpunkName => 'Cyberpunk';

  @override
  String get themeCyberpunkDesc =>
      'Neón sobre negro. Circuitos, datos y lluvia ácida.';

  @override
  String get themeSolarpunkName => 'Solarpunk';

  @override
  String get themeSolarpunkDesc =>
      'Verde, sol y aire limpio. Futuros que dan ganas de vivir.';

  @override
  String get themeCosmicName => 'Cósmico';

  @override
  String get themeCosmicDesc =>
      'Nebulosas y luz de estrellas. Naves, imperios y vacío.';

  @override
  String get themeGothicName => 'Gótico';

  @override
  String get themeGothicDesc =>
      'Carmesí y ceniza. Vampiros, ruinas y secretos.';

  @override
  String get markupBold => 'Negrita';

  @override
  String get markupItalic => 'Cursiva';

  @override
  String get helpEditorTitle => 'El editor de texto';

  @override
  String get helpEditorButton => 'Cómo dar formato';

  @override
  String get helpIntro =>
      'Cómo dar formato a lo que escribes, dónde funciona cada botón y qué queda guardado por debajo.';

  @override
  String get helpStylesTitle => 'Negrita y cursiva';

  @override
  String get helpStylesIntro =>
      'Funciona igual que en cualquier procesador de texto. Hay dos formas, y las dos sirven.';

  @override
  String get helpWayMarkTitle => 'Marcar lo que ya escribiste';

  @override
  String get helpWayMarkBody =>
      'Selecciona las palabras y presiona B o I. Presionarlo otra vez se lo quita.';

  @override
  String get helpWayAheadTitle => 'Prenderlo antes de escribir';

  @override
  String get helpWayAheadBody =>
      'Sin nada seleccionado, presiona B y lo que escribas a continuación sale en negrita, hasta que lo apagues.';

  @override
  String get helpOnTitle => 'Cómo saber si está prendido';

  @override
  String get helpOnBody =>
      'El botón se enciende cuando el cursor está sobre texto que ya tiene ese estilo, o cuando lo acabas de prender. Si mueves el cursor a otro lado, se apaga.';

  @override
  String get helpCombineBody =>
      'Los dos estilos se combinan: puedes tener una frase en negrita y cursiva a la vez. Y si escribes pegado a una palabra en negrita, lo nuevo sigue en negrita.';

  @override
  String get helpReachTitle => 'Tres formas de llegar a los botones';

  @override
  String get helpReachBarTitle => 'La barra';

  @override
  String get helpReachBarBody =>
      'Los botones B e I, arriba del cuadro de texto.';

  @override
  String get helpReachKeysTitle => 'El teclado';

  @override
  String get helpReachKeysBody =>
      'Ctrl+B y Ctrl+I. En Mac, Cmd en vez de Ctrl.';

  @override
  String get helpReachPhoneTitle => 'El celular';

  @override
  String get helpReachPhoneBody =>
      'Cuando seleccionas una palabra y aparece el menú del sistema con Copiar y Pegar, ahí mismo están Negrita y Cursiva. Ese menú tapa la barra, así que los estilos también viven adentro de él.';

  @override
  String get helpWhereTitle => 'Dónde funciona';

  @override
  String get helpWhereBody =>
      'En el contenido de las notas y en el editor de capítulos. En la lista de notas, la vista previa de cada una ya se ve con su formato aplicado.';

  @override
  String get helpWhereNote =>
      'Los títulos, los resúmenes y los campos cortos siguen siendo texto simple.';

  @override
  String get helpChapterOnlyTitle => 'Subtítulos, citas y cortes de escena';

  @override
  String get helpChapterOnlyIntro =>
      'Estos tres se aplican a la línea entera donde está el cursor, no a las palabras que selecciones. Igual que la negrita, se ven mientras escribes y no dejan ningún símbolo a la vista.';

  @override
  String get helpSubheadingBody =>
      'Convierte la línea en un subtítulo: se ve más grande y en negrita. Sirve para separar partes dentro de un capítulo.';

  @override
  String get helpSceneBreakBody =>
      'Deja una marca en su propia línea para separar dos escenas dentro del mismo capítulo.';

  @override
  String get helpChapterOnlyWarn =>
      'La cita no se puede sangrar mientras la escribes: un cuadro de texto no sabe darle márgenes propios a un párrafo suelto. Por eso se distingue con la cursiva y el fondo, en vez de con una sangría.';

  @override
  String get helpStoredTitle => 'Qué queda guardado';

  @override
  String get helpStoredBody =>
      'Nunca ves un asterisco. Por debajo, el texto se guarda en Markdown.';

  @override
  String get helpStoredSeeLabel => 'Lo que ves';

  @override
  String get helpStoredSavedLabel => 'Lo que se guarda';

  @override
  String get helpStoredSample =>
      'La **Casa Valdris** cayó en el *invierno largo*.';

  @override
  String get helpStoredWhy =>
      'Eso importa por tres razones: tus respaldos siguen siendo legibles y se pueden abrir en cualquier editor de texto, la búsqueda sigue encontrando las palabras, y lo que ya tenías escrito con asteriscos se abre ya formateado.';

  @override
  String get helpStoredAsterisk =>
      'Si escribes un asterisco a propósito, se guarda protegido y vuelve tal cual.';

  @override
  String get helpHalfWordTitle => 'El único detalle raro';

  @override
  String get helpHalfWordBody =>
      'Markdown no tiene forma de decir \"media palabra en negrita\". Si marcas solo una parte de una palabra, al guardar el estilo se ensancha a la palabra entera.';

  @override
  String get helpHalfWordNote =>
      'Es la única concesión, y es a propósito: preferible eso a guardar algo que después se lea distinto. Las palabras nunca se tocan.';

  @override
  String get helpMoreTitle => 'Lo demás del editor de capítulos';

  @override
  String get helpAutosaveTitle => 'Se guarda solo';

  @override
  String get helpAutosaveBody =>
      'Un segundo después de que dejas de escribir, y también al salir de la pantalla. Arriba te dice Guardando o Guardado.';

  @override
  String get helpWordCountTitle => 'Contador de palabras';

  @override
  String get helpWordCountBody =>
      'Siempre a la vista, y se actualiza mientras escribes.';

  @override
  String get helpGoalTitle => 'Meta de palabras';

  @override
  String get helpGoalBody =>
      'Puedes ponerle una meta al capítulo y aparece una barra de avance arriba de los botones.';

  @override
  String get helpFocusTitle => 'Modo sin distracciones';

  @override
  String get helpFocusBody =>
      'Esconde todo menos el texto. Para salir, el botón de arriba a la derecha.';

  @override
  String get markupQuote => 'Cita';

  @override
  String get helpQuoteBody =>
      'Marca el párrafo como una cita: sale en cursiva y sobre un fondo tenue, para que se distinga del cuerpo del texto. Si presionas Enter, la cita continúa; un subtítulo no.';

  @override
  String get pdfTitle => 'Exportar a PDF';

  @override
  String get pdfButton => 'Exportar a PDF';

  @override
  String get pdfIntro =>
      'Elige qué capítulos quieres. Salen todos juntos en un solo PDF, en el orden en que están.';

  @override
  String get pdfSelectAll => 'Seleccionar todos';

  @override
  String get pdfClear => 'Quitar todos';

  @override
  String get pdfNoChapters => 'No hay capítulos que exportar todavía.';

  @override
  String get pdfEmptyChapter => 'Sin texto';

  @override
  String get pdfExport => 'Exportar';

  @override
  String get pdfWorking => 'Armando el PDF...';

  @override
  String get pdfDone => 'PDF listo.';

  @override
  String pdfFailed(String error) {
    return 'No se pudo exportar: $error';
  }

  @override
  String get pdfShareTitle => 'Tu manuscrito';

  @override
  String pdfWordsLabel(String n) {
    return '$n palabras';
  }

  @override
  String pdfSelectedCount(int count, int total) {
    return '$count de $total capítulos';
  }

  @override
  String get pdfIntroAll =>
      'Elige qué quieres llevarte. Todo sale junto en un solo PDF.';

  @override
  String get pdfWithImages => 'Con imágenes';

  @override
  String get pdfGroupChapters => 'Capítulos';

  @override
  String get pdfGroupCharacters => 'Personajes';

  @override
  String get pdfGroupFactions => 'Facciones';

  @override
  String get pdfGroupLocations => 'Lugares';

  @override
  String get pdfGroupItems => 'Objetos';

  @override
  String get pdfGroupMagic => 'Sistemas de magia';

  @override
  String get pdfNothingPicked => 'No has elegido nada todavía.';

  @override
  String get pdfNoneOfThese => 'Todavía no hay ninguno.';

  @override
  String get sheetRace => 'Raza';

  @override
  String get sheetGender => 'Género';

  @override
  String get sheetAge => 'Edad';

  @override
  String get sheetOccupation => 'Ocupación';

  @override
  String get sheetFaction => 'Facción';

  @override
  String get sheetStatus => 'Estado';

  @override
  String get sheetType => 'Tipo';

  @override
  String get sheetClimate => 'Clima';

  @override
  String get sheetPopulation => 'Población';

  @override
  String get sheetGovernment => 'Gobierno';

  @override
  String get sheetPartOf => 'Dentro de';

  @override
  String get sheetOwner => 'En manos de';

  @override
  String get sheetWhere => 'Dónde está';

  @override
  String get sheetAppearance => 'Apariencia';

  @override
  String get sheetPersonality => 'Personalidad';

  @override
  String get sheetBackstory => 'Historia';

  @override
  String get sheetNotes => 'Notas';

  @override
  String get sheetDescription => 'Descripción';

  @override
  String get sheetPowers => 'Poderes';

  @override
  String get sheetOrigin => 'Origen';

  @override
  String get sheetSource => 'De dónde viene';

  @override
  String get sheetRules => 'Reglas';

  @override
  String get sheetLimits => 'Límites';

  @override
  String get sheetCost => 'Cuesta';
}
