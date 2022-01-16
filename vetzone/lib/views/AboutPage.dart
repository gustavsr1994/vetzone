import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/assets/widget/expansionTile/expansion_tile_profile.dart';

class AboutPage extends StatelessWidget {
  final colorPalettes = ColorPalettes();
  final listHistoryWork = HistoryWorkString().listHistoryWork;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: colorPalettes.primaryColor!),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gustav',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: colorPalettes.primaryDarkColor),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mobile Dev, Backend Dev',
                style: TextStyle(
                    fontSize: 15, color: colorPalettes.primaryDarkColor),
              ),
              Text(
                'Flutter, Golang, Aws (EC2, S3), MySQL',
                style: TextStyle(
                    fontSize: 15, color: colorPalettes.primaryDarkColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text('History Work Place',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorPalettes.primaryDarkColor)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var item in listHistoryWork)
              Container(
                width: MediaQuery.of(context).size.width,
                child: ExpansionTileProfile(
                    placeWork: item.placeWork,
                    title: item.title,
                    periodWork: item.periodWork,
                    techUseWork: item.techUseWork,
                    projectWork: item.projectWork,
                    jobDesc: item.jobDesc),
              )
          ],
        )
      ],
    ));
  }
}
