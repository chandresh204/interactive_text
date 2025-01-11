import 'package:flutter/material.dart';
import 'package:interactive_text/interactive_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String sampleText = 'Visit https://www.example.com or Contact : 9876543210 for more details, Share your feedback at https://example.feedback.com';
  final TextStyle textStyle = const TextStyle(color: Colors.black, fontSize: 30);
  final TextStyle linkStyle = const TextStyle(color: Colors.blue, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
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
      ),
    );
  }
}
