import 'package:clipboard_all_types/clipboard_all_types.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MemoryImage> _image = [];
  String? text;

  Future<void> onPasteCallback(ClipboardFiles files) async {
    switch (files.type) {
      case ClipboardType.image:
        setState(() {
          _image.add(MemoryImage(files.file!));
          text = null;
        });
        break;
      case ClipboardType.text:
        setState(() {
          text = files.text!;
        });
        break;
      case ClipboardType.video:
        setState(() {
          text = "Video handled";
        });
        break;
      case ClipboardType.audio:
        setState(() {
          text = "Audio handled";
        });
        break;
      case ClipboardType.otherFiles:
        setState(() {
          text = "Other files handled";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ClipboardsAllTypes(
              callback: onPasteCallback,
              child: Container(
                child: _image.isEmpty
                    ? const Text("Paste something here")
                    : text == null
                        ? ListView.builder(
                            itemCount: _image.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image(
                                  image: _image[index],
                                  height: 250,
                                ),
                              );
                            })
                        : Text(text!),
              )),
        ),
      ),
    );
  }
}
