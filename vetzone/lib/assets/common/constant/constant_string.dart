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

class HistoryWorkString {
  List<HistoryWorkModel> listHistoryWork = [
    HistoryWorkModel(
        placeWork: 'PT Prambanan Kencana',
        periodWork: 'Mar 2018 - Dec 2020',
        title: 'As Fullstack Dev',
        techUseWork: 'Android Native, ASP.Net, SQL Server, Flutter',
        projectWork: 'HRMS Web and Mobile, SCS(Sales Canvasing System)',
        jobDesc: 'Design database, UI, develop and maintenance application'),
    HistoryWorkModel(
        placeWork: 'PT Inet Global Indo',
        periodWork: 'Jan 2021 - Mar 2021',
        title: 'As Mobile Dev',
        techUseWork: 'Flutter',
        projectWork: 'Fastlab Ios',
        jobDesc: 'Develop and upload application to Apple Store'),
    HistoryWorkModel(
        placeWork: 'PT Adi Consultant',
        periodWork: 'Apr 2021 - Sep 2021',
        title: 'As Mobile Dev',
        techUseWork: 'Flutter',
        projectWork: 'Vega',
        jobDesc:
            'Placement in project at Sinarmas Insurance. Develop application'),
    HistoryWorkModel(
        placeWork: 'PT Keindahan Sejahtera Hutama',
        periodWork: 'Oct 2021 - Now',
        title: 'As Mobile Dev, Backend End',
        techUseWork: 'Flutter, Golang, AWS',
        projectWork: 'Unnis App',
        jobDesc: 'Develop application, create server')
  ];
}

class HistoryWorkModel {
  String placeWork;
  String periodWork;
  String title;
  String techUseWork;
  String projectWork;
  String jobDesc;

  HistoryWorkModel(
      {required this.placeWork,
      required this.periodWork,
      required this.title,
      required this.techUseWork,
      required this.projectWork,
      required this.jobDesc});
}

class FieldString {
  String TYPE_PETS = 'SELECT TYPE PETS';
  String MARRIED_DATE = 'MARRIED DATE';
}

class ConditionString {
  String notifBlank = "Please, fill this field";
}

List<String> typePets = ["Select One", "Anjing", "Kucing"];
List<String> statDog = [
  "Select Activity",
  "Resting/Hospitalised",
  "Aktif (<1 jam/hari)",
  "Aktif (1-3 jam/hari)",
  "Aktif (Ekstrem)",
  "Dewasa (1-2 Tahun)",
  "Dewasa (3-7 Tahun)",
  "Hamil (4 minggu pertama)",
  "Hamil (5 minggu terakhir)",
  "Pertumbuhan (Puppy)",
  "Pertumbuhan (<50% BB Dewasa)",
  "Pertumbuhan (50-80% BB Dewasa)",
  "Pertumbuhan (80-100% BB Dewasa)",
  "Laktasi (Minggu 1)",
  "Laktasi (Minggu 2)",
  "Laktasi (Minggu 3)",
  "Laktasi (Minggu 4)",
  "Obesitas"
];
List<String> statCat = [
  "Select Activity",
  "Resting/Hospitalised",
  "Aktif",
  "Hamil",
  "Pertumbuhan (< 4 bulan)",
  "Pertumbuhan (4-9 bulan)",
  "Pertumbuhan (9-12 bulan)",
  "Di Dalam Rumah",
  "Laktasi (Minggu 1)",
  "Laktasi (Minggu 2)",
  "Laktasi (Minggu 3)",
  "Laktasi (Minggu 4)",
  "Laktasi (Minggu 5)",
  "Laktasi (Minggu 6)",
  "Laktasi (Minggu 7)",
  "Dikebiri"
];
