import 'package:flutter/material.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
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
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColorDark: Colors.blue[900],
          primaryColor: Colors.lightBlue[800]),
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
                preferredSize: Size.fromHeight(40),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(accentColor: ColorPalettes().accentColor),
                  child: Container(
                      height: 48,
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
