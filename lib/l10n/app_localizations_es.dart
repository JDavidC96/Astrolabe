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
      'No hay capítulos todavía. Toca + para crear el primero.';

  @override
  String get chapNewChapter => 'Nuevo capítulo';

  @override
  String get chapEditChapter => 'Editar capítulo';

  @override
  String get chapNewSession => 'Nueva sesión';

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
  String get chapContentSaveFirst =>
      'Guarda primero (✓ arriba) para empezar a escribir.';

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
  String get editorBold => 'Negrita';

  @override
  String get editorItalic => 'Cursiva';

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
}
