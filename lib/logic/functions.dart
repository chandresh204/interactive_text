List<String> searchUrlInText(String text) {
  List<String> urls = [];
  bool scanCompleted = false;
  while (!scanCompleted) {
    if (text.contains('https://') || (text.contains('http://'))) {
      var index = text.length;
      if (text.contains('https://')) {
        index = text.indexOf('https://');
      } else {
        index = text.indexOf('http://');
      }
      var linkFinalIndex = text.indexOf(' ', index);
      if (linkFinalIndex == -1) {
        linkFinalIndex = text.indexOf('\n', index);
        if(linkFinalIndex == -1) {
          linkFinalIndex = (text.length);
        }
      }
      final link = text.substring(index, linkFinalIndex);
      urls.add(link);
      if (linkFinalIndex == (text.length - 1)) {
        scanCompleted = true;
        break;
      }
      text = text.substring(linkFinalIndex);
    } else {
      scanCompleted = true;
    }
  }
  return urls;
}

List<String> searchPhoneInText(String text) {
  List<String> numbers = [];
  String numberFound = '';
  bool capturingStarted = false;
  for (var i = 0; i < text.length; i++) {
    var char = text[i];
    bool acceptableChar = false;
    try {
      if (char == '+') {
      } else {
        int.parse(char);
      }
      acceptableChar = true;
    } catch (e) {
      acceptableChar = false;
    }
    if (acceptableChar && (i == (text.length - 1))) {
      if (capturingStarted) {
        numberFound += char;
        capturingStarted = false;
        if(numberFound.length > 4) {
          numbers.add(numberFound);
        }
        continue;
      }
    }
    if (acceptableChar) {
      if (!capturingStarted) {
        capturingStarted = true;
      }
      numberFound += char;
      continue;
    } else {
      if (capturingStarted) {
        capturingStarted = false;
        if (numberFound.length > 4) {
          numbers.add(numberFound);
        }
        numberFound = '';
        continue;
      }
    }
  }
  return numbers;
}
