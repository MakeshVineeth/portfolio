import 'package:flutter/material.dart';

class FixedValues {
  String appTitle = 'Makesh Vineeth Portfolio';

  // Default Initializations to White Theme.
  Color appBarColor = Colors.white;
  Color appBarFont = Colors.blue[900];

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
      appBarTheme: appBarStyle(brightness),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: appBarFont,
        backgroundColor: appBarColor,
      ),
    );
  }

  AppBarTheme appBarStyle(Brightness brightness) {
    bool isDark = brightness == Brightness.dark;
    return AppBarTheme(
      centerTitle: true,
      color: isDark ? appBarColor : appBarFont,
      elevation: 3,
      textTheme: TextTheme(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? appBarFont : appBarColor,
          fontSize: 20.0,
        ),
      ),
    );
  }

  TextStyle headingStyle(BuildContext context) {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.light
          ? appBarFont
          : Colors.amberAccent,
    );
  }

  TextStyle textStyle(BuildContext context) {
    return TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    );
  }
}
