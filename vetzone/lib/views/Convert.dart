import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';
import 'package:vetzone/widgets/TabBarAdapter.dart';

class ConvertMenu extends StatefulWidget {
  @override
  _ConvertMenuState createState() => _ConvertMenuState();
}

class _ConvertMenuState extends State<ConvertMenu> {
  List<String> _listTitle = ['Mass', 'Liquid', 'Temperature'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 400,
      height: 810,
      allowFontScaling: true,
    )..init(context);
    return MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColorDark: Colors.blue[900],
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.yellow[500]),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColorDark,
                title: HeaderTitle(
                  context: context,
                  title: 'Convert',
                ),
                bottom: PreferredSize(
                  preferredSize:
                      Size.fromHeight(ScreenUtil.instance.setHeight(40)),
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(accentColor: Theme.of(context).accentColor),
                    child: Container(
                        height: ScreenUtil.instance.setHeight(48),
                        child: TabBarAdapter(
                          context: context,
                          title: _listTitle,
                        )),
                  ),
                ),
              ),
              body: SafeArea(
                child: TabBarView(
                  children: <Widget>[
                    Container(
                      child: Text('Convert Mass'),
                    ),
                    Container(
                      child: Text('Convert Liquid'),
                    ),
                    Container(
                      child: Text('Convert Temperature'),
                    ),
                  ],
                ),
              ),
              drawer: DrawerNavigation(),
            )));
  }
}
