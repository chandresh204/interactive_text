import 'dart:math';

List<String> searchInText(String text, SearchType type) {
  var trimmedText = text.trim();
  List<String> results = [];
  bool scanCompleted = false;
  int endIndex = -1;
  while (!scanCompleted) {
    if(!trimmedText.contains(' ') && !trimmedText.contains('\n')) {
      scanCompleted = true;
      if(_validateAsPerType(trimmedText, type)) {
        results.add(trimmedText);
      }
      return results;
    } else {
      final spaceIndex = trimmedText.indexOf(' ');
      final newLineIndex = trimmedText.indexOf('\n');
      if(spaceIndex < 0) {
        endIndex = newLineIndex;
      } else if(newLineIndex < 0) {
        endIndex = spaceIndex;
      } else {
        endIndex = min(spaceIndex, newLineIndex);
      }
      final word = trimmedText.substring(0, endIndex);
      if(_validateAsPerType(word, type)) {
        results.add(word);
      }
      trimmedText = trimmedText.substring(endIndex+1).trim();
    }
  }
  return results;
}

bool _validateAsPerType(String word, SearchType type) {
  switch(type) {
    case SearchType.email:
      if(_emailValid(word)) {
        return true;
      }
      break;
    case SearchType.phone:
      if(_isPhone(word)) {
        return true;
      }
      break;
    case SearchType.url:
      if(_isUrl(word)) {
        return true;
      }
  }
  return false;
}

enum SearchType {
  email, phone, url
}


bool _emailValid(String email) {
return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);
}

bool _isUrl(String url) {
  return RegExp( r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?')
    .hasMatch(url);
}

bool _isPhone(String phone) {
  return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
      .hasMatch(phone);
}