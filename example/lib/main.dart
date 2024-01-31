import 'package:flutter/material.dart';
import 'package:interactive_text/interactive_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String sampleText = 'Mr. John L.\nweb: https://www.google.com/ \nPh: 2564824154';
  final TextStyle textStyle = const TextStyle(color: Colors.black);
  final TextStyle linkStyle = const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: InteractiveText(
            text: sampleText,
            textStyle: textStyle,
            linkStyle: linkStyle,
            onPhoneClick: (number) { // optional, use this if you want to define custom task on any phone number click
              print('todo: define your custom action on $number');
            },
            onUrlClick: (url) { // optional, use this if you want to define custom task on any url click
              print('todo: define your custom action on $url');
            },
          ),
        ),
      ),
    );
  }
}
