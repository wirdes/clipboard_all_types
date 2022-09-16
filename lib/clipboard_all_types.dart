library clipboard_all_types;

import 'package:clipboard_all_types/src/components/clipboard_files.dart';
import 'package:flutter/material.dart';
import 'package:clipboard_all_types/src/clipboard_io.dart'
    if (dart.library.html) 'package:clipboard_all_types/src/clipboard_web.dart';

export 'package:clipboard_all_types/src/components/clipboard_files.dart';

class ClipboardsAllTypes extends StatelessWidget {
  final Future<void> Function(ClipboardFiles clipboardFiles) callback;
  final Widget child;

  const ClipboardsAllTypes(
      {super.key, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipBoardOnPaste(callback: callback, child: child);
  }
}
