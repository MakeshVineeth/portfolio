import 'package:flutter/material.dart';

class FixedValues {
  String appTitle = 'Makesh Vineeth Portfolio';

  // Default Initializations to White Theme.
  Color appBarColor = Colors.white;
  Color appBarFont = Colors.red[600];

  ThemeData getDarkTheme() {
    appBarColor = Colors.grey[850];
    appBarFont = Colors.amberAccent;

    return getThemeData(Brightness.dark);
  }

  ThemeData getThemeData(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      applyElevationOverlayColor: brightness == Brightness.dark ? true : false,
      scaffoldBackgroundColor: appBarColor,
      primaryColor: appBarColor,
      cardColor: appBarColor,
      appBarTheme: appBarStyle(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: appBarFont,
        backgroundColor: appBarColor,
      ),
    );
  }

  AppBarTheme appBarStyle() {
    return AppBarTheme(
      centerTitle: true,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: appBarFont,
          fontSize: 20.0,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  TextStyle headingStyle(BuildContext context) {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light ? appBarFont : Colors.amberAccent,
    );
  }

  TextStyle textStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );
}
