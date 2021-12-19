import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/statemanagement/controller/navigation_controller.dart';
import 'package:vetzone/views/Age.dart';
import 'package:vetzone/views/BirthDate.dart';
import 'package:vetzone/views/Blood.dart';
import 'package:vetzone/views/Calori.dart';
import 'package:vetzone/views/Convert.dart';
import 'package:vetzone/views/MainMenu.dart';
import 'package:vetzone/views/Medicine.dart';

class DrawerNavigation extends StatelessWidget {
  var menuNavController = Get.put(NavigationController());

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
          menuNavController.obx((state) => (ListTile(
                selected: state == "Birth Date" ? true : false,
                selectedTileColor: ColorPalettes().accentColor,
                leading: IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).primaryColorDark),
                    child: Icon(FontAwesomeIcons.babyCarriage)),
                title: Text(
                  'Birth Date',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  menuNavController.changeMenu('Birth Date');
                },
              ))),
          ListTile(
              leading: IconTheme(
                  data:
                      IconThemeData(color: Theme.of(context).primaryColorDark),
                  child: Icon(FontAwesomeIcons.calendar)),
              title: Text(
                'Age',
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                menuNavController.changeMenu('Age');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AgeMenu()));
              }),
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColorDark),
                child: Icon(FontAwesomeIcons.pills)),
            title: Text(
              'Medicine',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MedicineMenu()));
            },
          ),
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColorDark),
                child: Icon(FontAwesomeIcons.heartbeat)),
            title: Text(
              'Blood',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BloodMenu()));
            },
          ),
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColorDark),
                child: Icon(FontAwesomeIcons.thermometer)),
            title: Text(
              'Convert',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ConvertMenu()));
            },
          ),
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColorDark),
                child: Icon(FontAwesomeIcons.balanceScale)),
            title: Text(
              'Calori',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CaloriMenu()));
            },
          ),
          ListTile(
            leading: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColorDark),
                child: Icon(FontAwesomeIcons.infoCircle)),
            title: Text(
              'About',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MainMenu()));
            },
          ),
        ],
      ),
    );
  }
}
