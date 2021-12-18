import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vetzone/views/Age.dart';
import 'package:vetzone/views/BirthDate.dart';
import 'package:vetzone/views/Blood.dart';
import 'package:vetzone/views/Calori.dart';
import 'package:vetzone/views/Convert.dart';
import 'package:vetzone/views/MainMenu.dart';
import 'package:vetzone/views/Medicine.dart';

class DrawerNavigation extends StatelessWidget {
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
                  color: Theme.of(context).accentColor),
            ),
            accountEmail: Text(
              'gustavr1994@gmail.com',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColorDark,
              child: Icon(FontAwesomeIcons.userTie),
            ),
          ),
          ListTile(
            leading: IconTheme(
                  data:
                      IconThemeData(color: Theme.of(context).primaryColorDark),
                  child: Icon(FontAwesomeIcons.babyCarriage)),
            title: Text(
              'Birth Date',
              style: TextStyle(color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => BirthDateMenu()));
            },
          ),
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
