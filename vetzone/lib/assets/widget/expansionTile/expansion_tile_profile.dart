import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';

class ExpansionTileProfile extends StatelessWidget {
  final String placeWork;
  final String periodWork;
  final String title;
  final String techUseWork;
  final String projectWork;
  final String jobDesc;
  ExpansionTileProfile(
      {required this.placeWork,
      required this.periodWork,
      required this.title,
      required this.techUseWork,
      required this.projectWork,
      required this.jobDesc});

  @override
  Widget build(BuildContext context) {
    final colorPalettes = ColorPalettes();
    return ExpansionTile(
      title: Text(placeWork,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: colorPalettes.primaryDarkColor)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 13, color: colorPalettes.primaryDarkColor)),
          Text(periodWork,
              style: TextStyle(
                  fontSize: 13, color: colorPalettes.primaryDarkColor)),
        ],
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      children: [
        Text(
          'Tech Use : ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorPalettes.primaryDarkColor),
        ),
        Text(
          techUseWork,
          style: TextStyle(fontSize: 15, color: colorPalettes.primaryDarkColor),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Projek : ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorPalettes.primaryDarkColor),
        ),
        Text(projectWork,
            style:
                TextStyle(fontSize: 15, color: colorPalettes.primaryDarkColor)),
        SizedBox(
          height: 10,
        ),
        Text(
          'Job Desc : ',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: colorPalettes.primaryDarkColor),
        ),
        Text(jobDesc,
            style:
                TextStyle(fontSize: 15, color: colorPalettes.primaryDarkColor)),
      ],
    );
  }
}
