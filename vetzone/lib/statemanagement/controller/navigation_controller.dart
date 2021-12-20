import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';

class NavigationController extends GetxController with StateMixin<NavModel> {
  void changeMenu(String nameMenu) async {
    final listMenu = TitleString().list_menu;
    Get.back();
    for (var item in listMenu) {
      if (nameMenu == item.titleMenu) {
        change(
            NavModel(
                iconMenu: item.iconMenu,
                titleMenu: item.titleMenu,
                menuWidget: item.menuWidget),
            status: RxStatus.success());
      }
    }
  }
}

class NavModel {
  IconData iconMenu;
  String titleMenu;
  Widget menuWidget;

  NavModel(
      {required this.iconMenu,
      required this.titleMenu,
      required this.menuWidget});
}
