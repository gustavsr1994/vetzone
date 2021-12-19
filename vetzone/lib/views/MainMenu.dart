import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/statemanagement/controller/navigation_controller.dart';
import 'package:vetzone/views/BirthDate.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  var menuNavController = Get.put(NavigationController());
  @override
  void initState() {
    super.initState();
    menuNavController.changeMenu("Birth Date");
  }

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
