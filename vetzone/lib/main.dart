import 'package:flutter/material.dart';
import 'package:vetzone/views/MainMenu.dart';

import 'assets/common/style/color_palette.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var colors = ColorPalettes();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vet Zone',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColorDark: colors.primaryDarkColor,
          primaryColor: colors.primaryColor,
          accentColor: colors.accentColor),
      home: MainMenu(),
    );
  }
}
