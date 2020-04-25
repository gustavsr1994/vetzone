import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarAdapter extends StatefulWidget {
  @override
  _TabBarAdapterState createState() => _TabBarAdapterState();
  List<String> title;
  BuildContext context;
  TabBarAdapter({this.title, this.context});
}

class _TabBarAdapterState extends State<TabBarAdapter> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 400,
      height: 810,
      allowFontScaling: true,
    )..init(context);
    
    final tabChild = <Widget>[];
    for (var i = 0; i < widget.title.length; i++) {
      tabChild.add(Tab(
        text: widget.title[i],
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
