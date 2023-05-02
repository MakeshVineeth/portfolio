import 'package:flutter/material.dart';
import 'package:makesh_vineeth/scaffoldhome.dart';
import 'package:makesh_vineeth/fixedValues.dart';
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
    return MaterialApp(
      title: fixedValues.appTitle,
      themeMode: ThemeMode.dark,
      theme: fixedValues.getThemeData(Brightness.light, context),
      darkTheme: fixedValues.getDarkTheme(context),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: ScaffoldHome(),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
