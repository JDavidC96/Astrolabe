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
}
