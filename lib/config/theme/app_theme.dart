import 'package:flutter/material.dart';

const _customColor = Color.fromARGB(255, 0, 0, 0);

const List _colorThemes = [
  _customColor,
  Colors.white,
  Colors.blue,
  Colors.red,
  Colors.lightGreen
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      /* colorScheme: ColorScheme.dark(
          primary: Colors.black,
          secondary: Colors.white,
          error: Colors.red,
        ) */
    );
  }
}
