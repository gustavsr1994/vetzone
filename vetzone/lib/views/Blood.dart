import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';
import 'package:vetzone/widgets/TabBarAdapter.dart';

class BloodMenu extends StatefulWidget {
  @override
  _BloodMenuState createState() => _BloodMenuState();
}

class _BloodMenuState extends State<BloodMenu> {
  List<String> _listTitle = null;
  void initState() {
    super.initState();
    _listTitle = ['Blood', 'Max Blood Donor', 'Eritrosit'];
  }

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
                title: 'Charity Blood',
              ),
              bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(ScreenUtil.instance.setHeight(40)),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Theme.of(context).accentColor),
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
                    child: Text('Blood'),
                  ),
                  Container(
                    child: Text('Max Blood Donor'),
                  ),
                  Container(
                    child: Text('Eritrosit'),
                  ),
                ],
              ),
            ),
            drawer: DrawerNavigation(),
          )),
    );
  }
}
