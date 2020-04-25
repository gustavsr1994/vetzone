import 'package:flutter/material.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class AgeMenu extends StatefulWidget {
  @override
  _AgeMenuState createState() => _AgeMenuState();
}

class _AgeMenuState extends State<AgeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: HeaderTitle(
            context: context,
            title: 'Calculate Age',
          )),
      body: SafeArea(
        child: Container(
          child: Text('Age'),
        ),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
