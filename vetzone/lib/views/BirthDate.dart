import 'package:flutter/material.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class BirthDateMenu extends StatefulWidget {
  @override
  _BirthDateMenuState createState() => _BirthDateMenuState();
}

class _BirthDateMenuState extends State<BirthDateMenu> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: HeaderTitle(
          context: context,
          title: 'Calculate Birth Date',
        )
      ),
      body: SafeArea(
        child: Container(
          child: Text('Birth Date'),
        ),
      ),
      drawer: DrawerNavigation(),
    );
  
  }
}