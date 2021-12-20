import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/views/MainMenu.dart';

import 'assets/common/style/color_palette.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vet Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColorDark: ColorPalettes().primaryDarkColor,
          primaryColor: ColorPalettes().primaryColor),
      home: MainMenu(),
    );
  }
}
