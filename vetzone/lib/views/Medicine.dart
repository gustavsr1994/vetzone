import 'package:flutter/material.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class MedicineMenu extends StatefulWidget {
  @override
  _MedicineMenuState createState() => _MedicineMenuState();
}

class _MedicineMenuState extends State<MedicineMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: HeaderTitle(
            context: context,
            title: 'Calculate Dose of Medicine',
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
