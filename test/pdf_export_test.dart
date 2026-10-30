import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:worldbuilder/services/manuscript.dart';
import 'package:worldbuilder/services/pdf_export_service.dart';
import 'package:worldbuilder/services/sheets.dart';

/// Sends the temporary directory somewhere a test can write.
class _FakePaths extends PathProviderPlatform with MockPlatformInterfaceMixin {
  _FakePaths(this.root);

  final String root;

  @override
  Future<String?> getTemporaryPath() async => root;
}

void main() {
  mainSheets();

  group('reading chapters into paragraphs', () {
    test('an ordinary paragraph', () {
      final paragraphs = paragraphsOf('La casa cayo.');
      expect(paragraphs.length, 1);
      expect(paragraphs.first.block, Block.body);
      expect(paragraphs.first.text, 'La casa cayo.');
    });

    test('each line becomes its own paragraph', () {
      final paragraphs = paragraphsOf('Uno.\nDos.\nTres.');
      expect(paragraphs.map((p) => p.text).toList(), ['Uno.', 'Dos.', 'Tres.']);
    });

    test('a heading, a quote and a scene break keep what they are', () {
      final paragraphs = paragraphsOf('## Titulo\n> Citado\n---\nCuerpo.');
      expect(
        paragraphs.map((p) => p.block).toList(),
        [Block.heading, Block.quote, Block.sceneBreak, Block.body],
      );
      expect(paragraphs[0].text, 'Titulo');
      expect(paragraphs[1].text, 'Citado');
    });

    test('bold and italic come through as runs', () {
      final runs = paragraphsOf('La **Casa** es *vieja*').first.runs;
      expect(runs, [
        const Run('La ', false, false),
        const Run('Casa', true, false),
        const Run(' es ', false, false),
        const Run('vieja', false, true),
      ]);
    });

    test('the markers never reach the page', () {
      for (final source in ['## Titulo', '> Citado', '**Fuerte**', '*Suave*']) {
        expect(paragraphsOf(source).first.text, isNot(contains('*')));
        expect(paragraphsOf(source).first.text, isNot(contains('#')));
        expect(paragraphsOf(source).first.text, isNot(startsWith('>')));
      }
    });

    test('an empty chapter yields one empty paragraph', () {
      final paragraphs = paragraphsOf('');
      expect(paragraphs.length, 1);
      expect(paragraphs.first.isEmpty, isTrue);
    });
  });

  group('counting the manuscript', () {
    test('adds up the words of every chapter', () {
      const manuscript = Manuscript('Libro', [
        Chapter('Uno', [
          Paragraph(Block.body, [Run('tres palabras aqui', false, false)]),
        ]),
        Chapter('Dos', [
          Paragraph(Block.body, [Run('dos mas', false, false)]),
        ]),
      ]);
      expect(manuscript.wordCount, 5);
    });

    test('blank paragraphs count for nothing', () {
      const manuscript = Manuscript('Libro', [
        Chapter('Uno', [
          Paragraph(Block.body, [Run('   ', false, false)]),
          Paragraph(Block.body, [Run('una', false, false)]),
        ]),
      ]);
      expect(manuscript.wordCount, 1);
    });
  });

  group('writing the file', () {
    late Directory temp;

    setUp(() {
      temp = Directory.systemTemp.createTempSync('astrolabe-pdf');
      PathProviderPlatform.instance = _FakePaths(temp.path);
    });

    tearDown(() => temp.deleteSync(recursive: true));

    const labels = PdfLabels(words: '{n} palabras');

    Manuscript sample() => Manuscript('Cronicas de Eldporia', [
          Chapter('Capitulo uno', paragraphsOf(
            '## La casa\n'
            'La **Casa Valdris** cayo en el *invierno largo*.\n'
            '---\n'
            '> Estos horrores eran realmente inexistentes.\n'
            'Y sin embargo alguien los recordaba.',
          )),
          Chapter('Capitulo dos', paragraphsOf('Nada quedaba en pie.')),
        ]);

    test('produces a real PDF', () async {
      final file = await const PdfExportService().export(sample(), labels);

      expect(file.existsSync(), isTrue);
      final bytes = await file.readAsBytes();
      // Every PDF starts by saying so, and ends by saying it is finished.
      expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
      expect(String.fromCharCodes(bytes.skip(bytes.length - 8)),
          contains('%%EOF'));
      expect(bytes.length, greaterThan(1000));
    });

    test('the file is named after the book', () async {
      final file = await const PdfExportService().export(sample(), labels);
      expect(file.path, endsWith('Cronicas-de-Eldporia.pdf'));
    });

    test('a title with nothing usable still gets a name', () async {
      final file = await const PdfExportService()
          .export(Manuscript('¿?¡!', const []), labels);
      expect(file.path, endsWith('manuscrito.pdf'));
    });

    test('one chapter alone exports just as happily', () async {
      final one = Manuscript('Solo uno', [sample().chapters.first]);
      final file = await const PdfExportService().export(one, labels);
      expect(file.existsSync(), isTrue);
    });

    test('an empty chapter does not break the export', () async {
      final empty = Manuscript('Vacio', [
        Chapter('Sin escribir', paragraphsOf('')),
      ]);
      final file = await const PdfExportService().export(empty, labels);
      expect(file.existsSync(), isTrue);
    });
  });
}

/// Records printed as sheets, with their pictures or without them.
void mainSheets() {
  group('building a sheet', () {
    test('drops the facts that were never filled in', () {
      final fields = fieldsOf({'Raza': 'Elfo', 'Edad': null, 'Género': '  '});
      expect(fields, [const SheetField('Raza', 'Elfo')]);
    });

    test('long passages keep their formatting', () {
      final sections = sectionsOf({'Historia': 'La **Casa** cayo.'});
      expect(sections.length, 1);
      expect(sections.first.title, 'Historia');
      expect(sections.first.paragraphs.first.runs[1].bold, isTrue);
      expect(sections.first.paragraphs.first.text, 'La Casa cayo.');
    });

    test('an empty passage gets no heading of its own', () {
      expect(sectionsOf({'Notas': '', 'Historia': null}), isEmpty);
    });
  });

  group('pictures', () {
    late Directory temp;

    setUp(() {
      temp = Directory.systemTemp.createTempSync('astrolabe-sheets');
      PathProviderPlatform.instance = _FakePaths(temp.path);
    });

    tearDown(() => temp.deleteSync(recursive: true));

    const labels = PdfLabels(words: '{n} palabras');

    /// The smallest valid PNG there is: one transparent pixel.
    final onePixelPng = Uint8List.fromList([
      0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, //
      0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
      0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
      0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
      0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
      0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
      0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00,
      0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
      0x42, 0x60, 0x82,
    ]);

    SheetGroup people({String? image}) => SheetGroup('Personajes', [
          Sheet(
            title: 'Aria Valdris',
            subtitle: 'La Callada',
            imagePath: image,
            fields: fieldsOf({'Raza': 'Elfo', 'Estado': 'Viva'}),
            sections: sectionsOf({'Historia': 'Nacio en el *Norte*.'}),
          ),
        ]);

    test('a sheet without a picture exports on its own', () async {
      final file = await const PdfExportService().export(
        const Manuscript('Libro', []),
        labels,
        groups: [people()],
      );
      expect(file.existsSync(), isTrue);
    });

    test('a picture is asked for only when the sheet carries one', () async {
      final asked = <String>[];
      await const PdfExportService().export(
        const Manuscript('Libro', []),
        labels,
        groups: [people()],
        images: (path) async {
          asked.add(path);
          return onePixelPng;
        },
      );
      expect(asked, isEmpty);
    });

    test('leaving pictures out means never reading them', () async {
      final asked = <String>[];
      // What the screen does when the switch is off: no path on the sheet.
      await const PdfExportService().export(
        const Manuscript('Libro', []),
        labels,
        groups: [people(image: null)],
        images: (path) async {
          asked.add(path);
          return onePixelPng;
        },
      );
      expect(asked, isEmpty);
    });

    test('a picture is read once and lands in the file', () async {
      final asked = <String>[];
      // Different titles, or the two would write over each other.
      final withImage = await const PdfExportService().export(
        const Manuscript('Con imagen', []),
        labels,
        groups: [people(image: 'p/aria.png')],
        images: (path) async {
          asked.add(path);
          return onePixelPng;
        },
      );
      final without = await const PdfExportService().export(
        const Manuscript('Sin imagen', []),
        labels,
        groups: [people()],
      );

      expect(asked, ['p/aria.png']);
      // The picture has to add weight, or it never made it in.
      expect(await withImage.length(), greaterThan(await without.length()));
    });

    test('a picture that will not load does not sink the export', () async {
      final file = await const PdfExportService().export(
        const Manuscript('Libro', []),
        labels,
        groups: [people(image: 'p/missing.png')],
        images: (path) async => throw const FileSystemException('gone'),
      );
      expect(file.existsSync(), isTrue);
    });

    test('an empty group is left out rather than printed blank', () async {
      final file = await const PdfExportService().export(
        const Manuscript('Libro', []),
        labels,
        groups: const [SheetGroup('Facciones', [])],
      );
      final bytes = await file.readAsBytes();
      expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
    });

    test('chapters and sheets go in the same file', () async {
      final file = await const PdfExportService().export(
        Manuscript('Libro', [
          Chapter('Uno', paragraphsOf('La casa cayo.')),
        ]),
        labels,
        groups: [people()],
      );
      expect(await file.length(), greaterThan(1000));
    });
  });
}
