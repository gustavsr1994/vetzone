import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';

class CardCustom extends StatelessWidget {
  final String result;
  CardCustom({required this.result});

  final colorPalettes = ColorPalettes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: colorPalettes.primaryColor!),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        result,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: colorPalettes.primaryDarkColor),
      ),
    );
  }
}
