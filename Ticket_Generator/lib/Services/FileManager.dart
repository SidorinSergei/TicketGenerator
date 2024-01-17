
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart' as xml;

class FileManager {
  Future<String?> getStringFromDocx() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      final bytes = await file.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      String text = '';

      for (final file in archive) {
        if (file.isFile && file.name.endsWith('.xml')) {
          final fileContent = String.fromCharCodes(file.content);
          final document = xml.XmlDocument.parse(fileContent);
          final textNodes = document.findAllElements('w:t');
          text = textNodes.map((node) => node.text).join();
          print(text);
          return text;
        }
      }
    }
    return null;
  }
}