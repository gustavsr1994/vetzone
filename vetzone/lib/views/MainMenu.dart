import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/statemanagement/controller/navigation_controller.dart';
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
        elevation: 2,
        title: menuNavController.obx((state) => HeaderTitle(
              context: context,
              title: state!.titleMenu,
            )),
      ),
      body: menuNavController.obx((state) => state!.menuWidget),
      drawer: DrawerNavigation(),
    );
  }
}
