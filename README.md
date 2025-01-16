<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Interactive Text

![](https://github.com/chandresh204/interactive_text/blob/main/asset/interactive_text.jpg)

## Features

This package allows you to interact with your simple text. like dial a phone number which is in the text or opening a web link,

## Getting started


## Usage


```dart
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
```
