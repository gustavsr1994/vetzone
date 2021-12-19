import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  final BuildContext context;
  HeaderTitle({this.title, this.context});

  @override
  Widget build(BuildContext context2) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: ColorPalettes().accentColor),
    );
  }
}
