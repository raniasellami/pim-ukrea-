import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(),
      dark: ThemeData(),
      builder: (theme, darktheme) => MaterialApp(),
      initial: AdaptiveThemeMode.light,
    );
  }
}
