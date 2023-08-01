import 'package:flutter/services.dart' as s;

extension CapitalizeExt on String {

  /// "first string" to "First string"
  String capitalize() {
    return replaceFirst(this[0], this[0].toUpperCase());
  }

  String capitalizeAll() {
    String res = '';

    for (int i = 0; i < length; i++) {
      if (i == 0 || i > 1 
          && s.TextLayoutMetrics.isWhitespace(this[i - 1].codeUnits[0]) 
          && !s.TextLayoutMetrics.isWhitespace(this[i].codeUnits[0])) {
        res += this[i].toUpperCase();
      } else {
        res += this[i];
      }
    }

    return res;
  }

}