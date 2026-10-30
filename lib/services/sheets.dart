/// The shape a record takes on a printed page: a name, a picture, a few
/// short facts, and the long passages underneath.
///
/// Nothing here knows about PDFs or about the database — it is the middle
/// step between them, so it can be read and tested on its own.
library;

import 'manuscript.dart';

/// One short fact: "Raza — Elfo".
class SheetField {
  const SheetField(this.label, this.value);

  final String label;
  final String value;

  @override
  bool operator ==(Object other) =>
      other is SheetField && other.label == label && other.value == value;

  @override
  int get hashCode => Object.hash(label, value);

  @override
  String toString() => '$label: $value';
}

/// A long passage with a heading of its own: "Historia", "Personalidad".
class SheetSection {
  const SheetSection(this.title, this.paragraphs);

  final String title;
  final List<Paragraph> paragraphs;
}

/// One record, ready to print.
class Sheet {
  const Sheet({
    required this.title,
    this.subtitle,
    this.imagePath,
    this.fields = const [],
    this.sections = const [],
  });

  final String title;
  final String? subtitle;

  /// Where the picture lives, when there is one and the writer asked for it.
  final String? imagePath;

  final List<SheetField> fields;
  final List<SheetSection> sections;
}

/// Records of one kind, under one heading: "Personajes", "Facciones".
class SheetGroup {
  const SheetGroup(this.title, this.sheets);

  final String title;
  final List<Sheet> sheets;
}

/// Drops the facts that were never filled in, so a sparse record prints as
/// a short one rather than a page of blanks.
List<SheetField> fieldsOf(Map<String, String?> entries) {
  return [
    for (final entry in entries.entries)
      if (entry.value != null && entry.value!.trim().isNotEmpty)
        SheetField(entry.key, entry.value!.trim()),
  ];
}

/// The same for the long passages, which keep their formatting.
List<SheetSection> sectionsOf(Map<String, String?> entries) {
  return [
    for (final entry in entries.entries)
      if (entry.value != null && entry.value!.trim().isNotEmpty)
        SheetSection(entry.key, paragraphsOf(entry.value!.trim())),
  ];
}
