import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'manuscript.dart';
import 'sheets.dart';

/// Reads the bytes of a stored picture, or null when it is gone. Handed in
/// so this service never has to know where the app keeps its files.
typedef ImageLoader = Future<Uint8List?> Function(String relativePath);

/// Words the document itself has to say, handed in already translated.
class PdfLabels {
  const PdfLabels({required this.words});

  /// `{n}` is replaced by the word count. Page numbers need no words.
  final String words;
}

/// Lays a manuscript out as a book: a title page, each chapter starting on a
/// fresh page, and quotations indented the way print sets them — which is
/// the one thing the on-screen editor cannot do.
class PdfExportService {
  const PdfExportService();

  static const _margin = 64.0;
  static const _bodySize = 11.5;

  Future<File> export(
    Manuscript manuscript,
    PdfLabels labels, {
    List<SheetGroup> groups = const [],
    ImageLoader? images,
  }) async {
    final document = pw.Document(title: manuscript.title);

    final body = pw.TextStyle(
      font: pw.Font.times(),
      fontSize: _bodySize,
      lineSpacing: 3.2,
    );

    document.addPage(_titlePage(manuscript, labels, body));

    for (final chapter in manuscript.chapters) {
      document.addPage(_chapterPage(chapter, labels, body));
    }

    // Pictures are read up front: laying a page out is not the place to be
    // waiting on the disk.
    final pictures = await _loadImages(groups, images);

    for (final group in groups) {
      if (group.sheets.isEmpty) continue;
      document.addPage(_groupPages(group, body, pictures));
    }

    final directory = await getTemporaryDirectory();
    final file = File(p.join(directory.path, '${_safeName(manuscript.title)}.pdf'));
    await file.writeAsBytes(await document.save());
    return file;
  }

  Future<Map<String, pw.MemoryImage>> _loadImages(
    List<SheetGroup> groups,
    ImageLoader? images,
  ) async {
    if (images == null) return {};
    final loaded = <String, pw.MemoryImage>{};

    for (final group in groups) {
      for (final sheet in group.sheets) {
        final path = sheet.imagePath;
        if (path == null || loaded.containsKey(path)) continue;
        try {
          final bytes = await images(path);
          if (bytes != null) loaded[path] = pw.MemoryImage(bytes);
        } catch (_) {
          // A picture that will not load is not worth losing the export
          // over; the record prints without it.
        }
      }
    }

    return loaded;
  }

  pw.Page _titlePage(
    Manuscript manuscript,
    PdfLabels labels,
    pw.TextStyle body,
  ) {
    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(_margin),
      build: (context) => pw.Center(
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text(
              manuscript.title,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                font: pw.Font.timesBold(),
                fontSize: 26,
              ),
            ),
            pw.SizedBox(height: 18),
            pw.Text(
              labels.words.replaceAll('{n}', '${manuscript.wordCount}'),
              style: body.copyWith(
                font: pw.Font.timesItalic(),
                color: PdfColors.grey700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  pw.MultiPage _chapterPage(
    Chapter chapter,
    PdfLabels labels,
    pw.TextStyle body,
  ) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(_margin),
      footer: (context) => pw.Container(
        alignment: pw.Alignment.center,
        margin: const pw.EdgeInsets.only(top: 14),
        child: pw.Text(
          '${context.pageNumber}',
          style: body.copyWith(fontSize: 9, color: PdfColors.grey600),
        ),
      ),
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Text(
            chapter.title,
            style: pw.TextStyle(font: pw.Font.timesBold(), fontSize: 17),
          ),
        ),
        pw.SizedBox(height: 10),
        for (final paragraph in chapter.paragraphs)
          _paragraph(paragraph, body),
      ],
    );
  }

  pw.Widget _paragraph(Paragraph paragraph, pw.TextStyle body) {
    if (paragraph.block == Block.sceneBreak) {
      return pw.Container(
        alignment: pw.Alignment.center,
        margin: const pw.EdgeInsets.symmetric(vertical: 14),
        child: pw.Text('* * *', style: body),
      );
    }

    if (paragraph.isEmpty) return pw.SizedBox(height: 8);

    if (paragraph.block == Block.heading) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(top: 16, bottom: 6),
        child: pw.RichText(
          text: pw.TextSpan(
            children: _spans(
              paragraph.runs,
              body.copyWith(font: pw.Font.timesBold(), fontSize: 13.5),
            ),
          ),
        ),
      );
    }

    if (paragraph.block == Block.quote) {
      // Set in from both sides, the way a quoted passage is printed.
      return pw.Container(
        margin: const pw.EdgeInsets.fromLTRB(28, 8, 28, 8),
        child: pw.RichText(
          textAlign: pw.TextAlign.justify,
          text: pw.TextSpan(
            children: _spans(
              paragraph.runs,
              body.copyWith(font: pw.Font.timesItalic(), fontSize: 11),
            ),
          ),
        ),
      );
    }

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 7),
      child: pw.RichText(
        textAlign: pw.TextAlign.justify,
        text: pw.TextSpan(children: _spans(paragraph.runs, body)),
      ),
    );
  }

  List<pw.InlineSpan> _spans(List<Run> runs, pw.TextStyle base) {
    return [
      for (final run in runs)
        pw.TextSpan(text: run.text, style: _styleFor(run, base)),
    ];
  }

  pw.TextStyle _styleFor(Run run, pw.TextStyle base) {
    // Times comes in four cuts; pick the one the run asks for.
    final font = switch ((run.bold, run.italic)) {
      (true, true) => pw.Font.timesBoldItalic(),
      (true, false) => pw.Font.timesBold(),
      (false, true) => pw.Font.timesItalic(),
      _ => base.font,
    };

    // A heading is already bold, so leave its face alone unless the run
    // asks for italic on top.
    if (!run.bold && !run.italic) return base;
    return base.copyWith(font: font);
  }

  /// One section of records: a heading page-wide, then a card per record.
  pw.MultiPage _groupPages(
    SheetGroup group,
    pw.TextStyle body,
    Map<String, pw.MemoryImage> pictures,
  ) {
    return pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(_margin),
      footer: (context) => pw.Container(
        alignment: pw.Alignment.center,
        margin: const pw.EdgeInsets.only(top: 14),
        child: pw.Text(
          '${context.pageNumber}',
          style: body.copyWith(fontSize: 9, color: PdfColors.grey600),
        ),
      ),
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Text(
            group.title,
            style: pw.TextStyle(font: pw.Font.timesBold(), fontSize: 17),
          ),
        ),
        for (final sheet in group.sheets) _sheet(sheet, body, pictures),
      ],
    );
  }

  pw.Widget _sheet(
    Sheet sheet,
    pw.TextStyle body,
    Map<String, pw.MemoryImage> pictures,
  ) {
    final picture = sheet.imagePath == null ? null : pictures[sheet.imagePath];

    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 18),
      padding: const pw.EdgeInsets.only(bottom: 12),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.grey400, width: 0.5),
        ),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (picture != null) ...[
                pw.Container(
                  width: 86,
                  height: 86,
                  margin: const pw.EdgeInsets.only(right: 14),
                  child: pw.Image(picture, fit: pw.BoxFit.cover),
                ),
              ],
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      sheet.title,
                      style: pw.TextStyle(
                        font: pw.Font.timesBold(),
                        fontSize: 13.5,
                      ),
                    ),
                    if (sheet.subtitle != null &&
                        sheet.subtitle!.trim().isNotEmpty)
                      pw.Text(
                        sheet.subtitle!,
                        style: body.copyWith(
                          font: pw.Font.timesItalic(),
                          color: PdfColors.grey700,
                        ),
                      ),
                    if (sheet.fields.isNotEmpty) ...[
                      pw.SizedBox(height: 6),
                      _facts(sheet.fields, body),
                    ],
                  ],
                ),
              ),
            ],
          ),
          for (final section in sheet.sections) ...[
            pw.SizedBox(height: 8),
            pw.Text(
              section.title,
              style: body.copyWith(
                font: pw.Font.timesBold(),
                fontSize: 10,
                color: PdfColors.grey800,
              ),
            ),
            pw.SizedBox(height: 2),
            for (final paragraph in section.paragraphs)
              _paragraph(paragraph, body),
          ],
        ],
      ),
    );
  }

  /// The short facts, two to a row so a sheet stays compact.
  pw.Widget _facts(List<SheetField> fields, pw.TextStyle body) {
    final label = body.copyWith(fontSize: 9, color: PdfColors.grey700);

    return pw.Wrap(
      spacing: 18,
      runSpacing: 3,
      children: [
        for (final field in fields)
          pw.RichText(
            text: pw.TextSpan(children: [
              pw.TextSpan(text: '${field.label}: ', style: label),
              pw.TextSpan(text: field.value, style: body.copyWith(fontSize: 10)),
            ]),
          ),
      ],
    );
  }

  String _safeName(String title) {
    final cleaned = title
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '-');
    return cleaned.isEmpty ? 'manuscrito' : cleaned;
  }
}
