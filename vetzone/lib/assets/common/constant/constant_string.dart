import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vetzone/statemanagement/controller/navigation_controller.dart';
import 'package:vetzone/views/AboutPage.dart';
import 'package:vetzone/views/Age.dart';
import 'package:vetzone/views/BirthDate.dart';
import 'package:vetzone/views/Blood.dart';
import 'package:vetzone/views/Calori.dart';
import 'package:vetzone/views/Convert.dart';
import 'package:vetzone/views/Medicine.dart';

class TitleString {
  List<NavModel> list_menu = [
    NavModel(
        iconMenu: FontAwesomeIcons.babyCarriage,
        titleMenu: 'Birth Date',
        menuWidget: BirthDateMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.calendar,
        titleMenu: 'Age',
        menuWidget: AgeMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.heartbeat,
        titleMenu: 'Blood',
        menuWidget: BloodMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.balanceScale,
        titleMenu: 'Calori',
        menuWidget: CaloriMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.thermometer,
        titleMenu: 'Convert',
        menuWidget: ConvertMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.pills,
        titleMenu: 'Medicine',
        menuWidget: MedicineMenu()),
    NavModel(
        iconMenu: FontAwesomeIcons.infoCircle,
        titleMenu: 'About',
        menuWidget: AboutPage()),
  ];
}

class MenuModel {}

class FieldString {
  String TYPE_PETS = 'SELECT TYPE PETS';
  String MARRIED_DATE = 'MARRIED DATE';
}

class ConditionString {
  String notifBlank = "Please, fill this field";
}
