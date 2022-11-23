import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meme_generator/resources/color_manager.dart';

class ThemeManger {
  ThemeData applicationTheme() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: ColorManger.primaryColor,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: ColorManger.primaryColor,
          foregroundColor: ColorManger.secondaryColor,
        )));
  }
}
