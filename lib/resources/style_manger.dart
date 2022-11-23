import 'package:flutter/cupertino.dart';

class StyleManager {
  static styleManagerMethod(fontSize, colorName, fontweight, [fontstyle]) {
    return TextStyle(
      fontSize: fontSize,
      color: colorName,
      fontWeight: fontweight,
      fontStyle: fontstyle,
    );
  }
}
