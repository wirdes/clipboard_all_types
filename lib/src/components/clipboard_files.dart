import 'dart:typed_data';

enum ClipboardType { text, image, video, audio, otherFiles }

class ClipboardFiles {
  final ClipboardType type;
  final Uint8List? file;
  final String? fileName;
  final int? size;
  final String? mimeType;
  final String? text;

  ClipboardFiles({
    required this.type,
    this.file,
    this.fileName,
    this.size,
    this.mimeType,
    this.text,
  });
  ClipboardType get getType => type;
  Uint8List? get getFile => file;
  String? get getFileName => fileName;
  int? get getSize => size;
  String? get getMimeType => mimeType;
  String? get getText => text;
}
