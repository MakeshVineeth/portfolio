import 'package:flutter/material.dart';

class FixedValues {
  ThemeData getDarkTheme() {
    Color bg = Colors.grey[900];
    Color header = Colors.orangeAccent;
    Color fontFg = Colors.grey[100];
    Color appBarColor = Colors.grey[850];
    Color appBarFont = Colors.grey[50];

    return ThemeData(
      brightness: Brightness.dark,
      applyElevationOverlayColor: true,
      scaffoldBackgroundColor: appBarColor,
      primaryColor: appBarColor,
      cardColor: appBarColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: fontFg,
        backgroundColor: appBarColor,
      ),
    );
  }

  static TextStyle headingStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );
}
