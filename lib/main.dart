import 'package:flutter/material.dart';
import 'package:makesh_vineeth/scaffoldhome.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(VineethId());

class VineethId extends StatefulWidget {
  @override
  _VineethIdState createState() => _VineethIdState();
}

class _VineethIdState extends State<VineethId> {
  FixedValues fixedValues = FixedValues();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: fixedValues.getThemeData(Brightness.light),
      dark: fixedValues.getDarkTheme(),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: fixedValues.appTitle,
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          ScaffoldHome(),
          defaultScale: true,
          breakpoints: <ResponsiveBreakpoint>[
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
      ),
    );
  }
}
