import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';

class CardCustom extends StatelessWidget {
  var titleStringCommon = TitleString();
  var fieldStringCommon = FieldString();
  var conditionStringCommon = ConditionString();
  var colorPalettes = ColorPalettes();
  String title;
  String result;
  CardCustom({this.title, this.result});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: colorPalettes.primaryDarkColor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              result,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark),
            )),
        Positioned(
            top: -3,
            left: 15,
            child: Container(
                color: colorPalettes.lightPrimary, child: Text(title)))
      ],
    );
  }
}
