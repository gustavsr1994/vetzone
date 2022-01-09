import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';

class TabBarAdapter extends StatelessWidget {
  final List<String> title;
  final BuildContext context;
  TabBarAdapter({required this.title, required this.context});

  @override
  Widget build(BuildContext context2) {
    final tabChild = <Widget>[];
    for (var i = 0; i < title.length; i++) {
      tabChild.add(Tab(
        child: Text(
          title[i],
          textAlign: TextAlign.center,
        ),
      ));
    }

    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BubbleTabIndicator(
        indicatorHeight: 50,
        indicatorRadius: 10,
        indicatorColor: ColorPalettes().accentColor!,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      unselectedLabelColor: ColorPalettes().accentColor,
      labelStyle: TextStyle(fontSize: 17),
      labelColor: ColorPalettes().primaryDarkColor,
      tabs: tabChild,
    );
  }
}
