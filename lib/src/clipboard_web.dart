// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:typed_data';

import 'package:clipboard_all_types/src/components/clipboard_files.dart';
import 'package:flutter/material.dart';
import 'dart:html';

class ClipBoardOnPaste extends StatefulWidget {
  const ClipBoardOnPaste(
      {Key? key, required this.child, required this.callback})
      : super(key: key);
  final Widget child;
  final Future<void> Function(
    ClipboardFiles clipboardFiles,
  ) callback;

  @override
  State<ClipBoardOnPaste> createState() => _ClipBoardOnPasteState();
}

class _ClipBoardOnPasteState extends State<ClipBoardOnPaste> {
  late final StreamSubscription<ClipboardEvent> sub;
  @override
  void initState() {
    super.initState();
    sub = window.document.onPaste.listen(
      (event) async {
        ClipboardType type;
        final data = event.clipboardData?.files ?? [];

        if (data.isNotEmpty) {
          for (File file in data) {
            Uint8List content = await getFileData(file);
            if (file.type.startsWith('image/')) {
              type = ClipboardType.image;
            } else if (file.type.startsWith('video/')) {
              type = ClipboardType.video;
            } else if (file.type.startsWith('audio/')) {
              type = ClipboardType.audio;
            } else {
              type = ClipboardType.otherFiles;
            }
            widget.callback(
              ClipboardFiles(
                type: type,
                file: content,
                fileName: file.name,
                size: file.size,
                mimeType: file.type,
              ),
            );
          }
        } else if (event.clipboardData?.getData('text/plain') != null) {
          type = ClipboardType.text;
          widget.callback(
            ClipboardFiles(
              type: type,
              text: event.clipboardData?.getData('text/plain'),
            ),
          );
          return;
        }
      },
    );
  }

  Future<Uint8List> getFileData(File file) async {
    final completer = Completer<Uint8List>();
    final reader = FileReader();
    reader.readAsArrayBuffer(file);
    reader.onLoad.listen((_) => completer.complete(reader.result as Uint8List));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    sub.cancel();
  }
}
