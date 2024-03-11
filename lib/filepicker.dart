import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class PickAudioScreen extends StatefulWidget {
  const PickAudioScreen({Key? key}) : super(key: key);

  @override
  _PickAudioScreenState createState() => _PickAudioScreenState();
}

class _PickAudioScreenState extends State<PickAudioScreen> {
  String? _selectedFilePath;

  Future<void> _pickAudio() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false, // Only allow picking a single file
    );

    if (result != null) {
      final file = result.files.single;
      setState(() {
        _selectedFilePath = file.path;
      });
    } else {
      // Handle no file selection scenario (optional)
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selected Audio File:'),
            Text(_selectedFilePath ?? 'No file selected'),
            ElevatedButton(
              onPressed: _pickAudio,
              child: Text('Pick Audio'),
            ),
          ],
        ),
      ),
    );
  }
}
