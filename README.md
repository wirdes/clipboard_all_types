# clipboard_all_types

This package get all types of data from clipboard
<br>
[![Pub Version](https://img.shields.io/pub/v/clipboard_all_types)](https://pub.dev/packages/clipboard_all_types)

## Platform Support

| macOS | Windows | Linux | Web | Android | iOS |
| :---: | :-----: | :---: | :-: | :-----: | :-: |
|  ⌛   |   ⌛    |  ⌛   | ✅  |   ⌛    | ⌛  |

# Install

- Add `clipboard_all_types` to your dependencies list in `pubspec.yaml` file

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^0.1.2
  clipboard_all_types: ^0.0.1
```

- Run `flutter packages get` from your root project

- import the package by `import 'package:clipboard_all_types/clipboard_all_types.dart';`

## Usage

```dart
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

```

## Example

the plugin comes with an simplest example app. run it to see it in working.
