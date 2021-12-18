import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vetzone/views/Convert.dart';

class TabBarAdapter extends StatelessWidget {
  List<String> title;
  BuildContext context;
  TabBarAdapter({this.title, this.context});

  @override
  Widget build(BuildContext context2) {
    ScreenUtil.instance = ScreenUtil(
      width: 400,
      height: 810,
      allowFontScaling: true,
    )..init(context);

    final tabChild = <Widget>[];
    for (var i = 0; i < title.length; i++) {
      tabChild.add(Tab(
        text: title[i],
      ));
    }

    return TabBar(
      indicatorColor: Theme.of(context).accentColor,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      indicator: BubbleTabIndicator(
        indicatorHeight: ScreenUtil.instance.setHeight(35.0),
        indicatorColor: Colors.blue[700],
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      labelStyle: TextStyle(fontSize: ScreenUtil.instance.setSp(17)),
      labelColor: Theme.of(context).accentColor,
      tabs: tabChild,
      
    );
  }
}
