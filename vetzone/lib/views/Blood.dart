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
  List<String>? _listTitle = null;
  void initState() {
    super.initState();
    _listTitle = ['Blood', 'Max Blood Donor', 'Eritrosit'];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                height: 70,
                color: ColorPalettes().primaryDarkColor,
                child: TabBarAdapter(
                  context: context,
                  title: _listTitle!,
                ),
              ),
            ),
            body: TabBarView(
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
          )),
    );
  }
}
