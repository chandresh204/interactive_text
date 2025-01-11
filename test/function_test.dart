import 'package:interactive_text/logic/functions.dart';

void main() {
  final testString = 'https://www.oog.com\nhttps://fool.com\nlckos/coc';

  print(searchInText(testString, SearchType.url));
}