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
              backgroundColor: Theme.of(context).primaryColorDark,
              child: Icon(FontAwesomeIcons.userTie),
            ),
          ),
          // ignore: sdk_version_ui_as_code
          for (var index = 0; index < listMenu.length; index++)
            menuNavController.obx((state) => (ListTile(
                  trailing: state!.titleMenu == listMenu[index].titleMenu
                      ? Icon(
                          Icons.star,
                          size: 25,
                          color: ColorPalettes().primaryDarkColor,
                        )
                      : SizedBox(),
                  leading: IconTheme(
                      data: IconThemeData(
                          color: Theme.of(context).primaryColorDark),
                      child: Icon(listMenu[index].iconMenu)),
                  title: Text(
                    listMenu[index].titleMenu,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    menuNavController.changeMenu(listMenu[index].titleMenu);
                  },
                )))

          // menuNavController.obx(
          //   (state) => ListTile(
          //       trailing: state.titleMenu == "Age"
          //           ? Icon(
          //               Icons.star,
          //               size: 25,
          //               color: ColorPalettes().primaryDarkColor,
          //             )
          //           : SizedBox(),
          //       leading: IconTheme(
          //           data: IconThemeData(
          //               color: Theme.of(context).primaryColorDark),
          //           child: Icon(FontAwesomeIcons.calendar)),
          //       title: Text(
          //         'Age',
          //         style: TextStyle(
          //             color: Theme.of(context).primaryColorDark,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       onTap: () {
          //         menuNavController.changeMenu('Age');
          //       }),
          // ),
          // ListTile(
          //   leading: IconTheme(
          //       data: IconThemeData(color: Theme.of(context).primaryColorDark),
          //       child: Icon(FontAwesomeIcons.pills)),
          //   title: Text(
          //     'Medicine',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => MedicineMenu()));
          //   },
          // ),
          // ListTile(
          //   leading: IconTheme(
          //       data: IconThemeData(color: Theme.of(context).primaryColorDark),
          //       child: Icon(FontAwesomeIcons.heartbeat)),
          //   title: Text(
          //     'Blood',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => BloodMenu()));
          //   },
          // ),
          // ListTile(
          //   leading: IconTheme(
          //       data: IconThemeData(color: Theme.of(context).primaryColorDark),
          //       child: Icon(FontAwesomeIcons.thermometer)),
          //   title: Text(
          //     'Convert',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => ConvertMenu()));
          //   },
          // ),
          // ListTile(
          //   leading: IconTheme(
          //       data: IconThemeData(color: Theme.of(context).primaryColorDark),
          //       child: Icon(FontAwesomeIcons.balanceScale)),
          //   title: Text(
          //     'Calori',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => CaloriMenu()));
          //   },
          // ),
          // ListTile(
          //   leading: IconTheme(
          //       data: IconThemeData(color: Theme.of(context).primaryColorDark),
          //       child: Icon(FontAwesomeIcons.infoCircle)),
          //   title: Text(
          //     'About',
          //     style: TextStyle(
          //         color: Theme.of(context).primaryColorDark,
          //         fontWeight: FontWeight.bold),
          //   ),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => MainMenu()));
          //   },
          // ),
        ],
      ),
    );
  }
}
