import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSScreen extends StatefulWidget {
  @override
  _TTSScreenState createState() => _TTSScreenState();
}

class _TTSScreenState extends State<TTSScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  _text = text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter text to speak',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await flutterTts.speak(_text);
              },
              child: Text('Speak'),
            ),
          ],
        ),
      ),
    );
  }
}
