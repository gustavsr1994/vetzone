import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/statemanagement/controller/navigation_controller.dart';

class DrawerNavigation extends StatelessWidget {
  final menuNavController = Get.put(NavigationController());
  final listMenu = TitleString().list_menu;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: ColorPalettes().primaryDarkColor),
            accountName: Text(
              'Gustav Sri R',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalettes().accentColor),
            ),
            accountEmail: Text(
              'gustavr1994@gmail.com',
              style: TextStyle(color: ColorPalettes().accentColor),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: ColorPalettes().accentColor,
              child: Icon(
                FontAwesomeIcons.userTie,
                color: ColorPalettes().primaryDarkColor,
              ),
            ),
          ),
          // ignore: sdk_version_ui_as_code
          for (var index = 0; index < listMenu.length; index++)
            menuNavController.obx((state) => (ListTile(
                  trailing: state!.titleMenu == listMenu[index].titleMenu
                      ? Icon(
                          Icons.star,
                          size: 20,
                          color: ColorPalettes().accentColor,
                        )
                      : SizedBox(),
                  leading: IconTheme(
                      data: IconThemeData(
                        color: state.titleMenu == listMenu[index].titleMenu
                            ? ColorPalettes().primaryColor
                            : ColorPalettes().primaryDarkColor,
                      ),
                      child: Icon(listMenu[index].iconMenu)),
                  title: Text(
                    listMenu[index].titleMenu,
                    style: TextStyle(
                        color: state.titleMenu == listMenu[index].titleMenu
                            ? ColorPalettes().accentColor
                            : ColorPalettes().primaryDarkColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    menuNavController.changeMenu(listMenu[index].titleMenu);
                  },
                )))
        ],
      ),
    );
  }
}
