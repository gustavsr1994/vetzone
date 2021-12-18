import 'package:flutter/cupertino.dart';

class AgeProv with ChangeNotifier {
  AgeProv();
  String resultAge = null;

  void setAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (days < 0) {
      months--;
      days += currentDate.day;
    }
    if (months < 0) {
      years--;
      months += 12;
    }
    resultAge = years.toString() +
        ' years, ' +
        months.toString() +
        ' months, ' +
        days.toString() +
        ' days';
        notifyListeners();
  }

  String get getResultAge => resultAge;
}
