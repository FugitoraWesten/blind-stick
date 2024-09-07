import 'package:flutter/material.dart';

import 'package:blindflutter/screens/Text_to_speech.screen.dart';
import 'package:blindflutter/screens/maps.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TTSScreen(),
    );
  }
}
