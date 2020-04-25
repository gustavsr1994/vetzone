import 'package:flutter/material.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: HeaderTitle(
          context: context,
          title: 'Vet Zone',
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Text('Main Menu'),
        ),
      ),
      drawer: DrawerNavigation(),
    );
  }
}
