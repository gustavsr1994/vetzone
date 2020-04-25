import 'package:flutter/material.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class CaloriMenu extends StatefulWidget {
  @override
  _CaloriMenuState createState() => _CaloriMenuState();
}

class _CaloriMenuState extends State<CaloriMenu> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: HeaderTitle(
            context: context,
            title: 'Calculate Calori',
          )),
      body: SafeArea(
        child: Container(
          child: Text('Calori'),
        ),
      ),
      drawer: DrawerNavigation(),
    );
  
  }
}