import 'dart:typed_data';

import 'package:clipboard_all_types/src/components/clipboard_files.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
