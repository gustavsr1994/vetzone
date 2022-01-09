import 'package:flutter/cupertino.dart';
import 'package:vetzone/assets/common/utils/date_formatter.dart';

class BirthProv with ChangeNotifier {
  BirthProv();
  String? birthDate = "0";
  void setBirth(int type, DateTime marriageDate) {
    switch (type) {
      case 0:
        var result = new DateTime(
            marriageDate.year, marriageDate.month + 3, marriageDate.day + 2);
        birthDate = DateFormatter().formatCalendar(result);
        break;
      case 1:
        var result = new DateTime(
            marriageDate.year, marriageDate.month + 3, marriageDate.day + 2);
        birthDate = DateFormatter().formatCalendar(result);
        break;
      case 2:
        var result = new DateTime(
            marriageDate.year, marriageDate.month + 2, marriageDate.day + 11);
        birthDate = DateFormatter().formatCalendar(result);
        break;
      case 3:
        var result = new DateTime(
            marriageDate.year, marriageDate.month + 0, marriageDate.day + 16);
        birthDate = DateFormatter().formatCalendar(result);
        break;
      case 4:
        var result = new DateTime(
            marriageDate.year, marriageDate.month + 2, marriageDate.day + 1);
        birthDate = DateFormatter().formatCalendar(result);
        break;
      default:
        birthDate = DateFormatter().formatCalendar(marriageDate);
    }

    notifyListeners();
    // birthDate = marriageDate;
  }

  String get getResultBirth => birthDate!;
}
