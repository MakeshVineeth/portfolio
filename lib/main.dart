import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:makesh_vineeth/scaffoldhome.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() {
  runApp(VineethId());
  GestureBinding.instance.resamplingEnabled = true;
}

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
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: fixedValues.appTitle,
        home: ScaffoldHome(),
        theme: theme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
