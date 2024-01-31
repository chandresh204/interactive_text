import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../logic/functions.dart';

class InteractiveText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextStyle linkStyle;
  final Function(String)? onUrlClick;
  final Function(String)? onPhoneClick;
  const InteractiveText(
      {super.key,
      required this.text,
      required this.textStyle,
      required this.linkStyle,
      this.onUrlClick,
      this.onPhoneClick});

  @override
  Widget build(BuildContext context) {
    List<String> phoneNumbers = searchPhoneInText(text);
    List<String> urls = searchUrlInText(text);
    Map<String, HighlightedWord> words = {};
    onNumTap(num1) {
      if (onPhoneClick != null) {
        onPhoneClick!(num1);
      } else {
        launchUrl(Uri.parse('tel:$num1'));
      }
    }

    onUrlTap(url) {
      if (onUrlClick != null) {
        onUrlClick!(url);
      } else {
        launchUrl(Uri.parse(url));
      }
    }

    for (var num in phoneNumbers) {
      words[num] = HighlightedWord(
          textStyle: linkStyle,
          onTap: () {
            onNumTap(num);
          });
    }
    for (var url in urls) {
      words[url] = HighlightedWord(
          textStyle: linkStyle,
          onTap: () {
            onUrlTap(url);
          });
    }
    return TextHighlight(text: text, words: words, textStyle: textStyle);
  }
}
