import 'package:flutter/cupertino.dart';

class ConvertProv with ChangeNotifier {
  ConvertProv();
  String? result;
  void setConvertMassa(int value, int unit1, int unit2) {
    switch (unit1) {
      case 1:
        switch (unit2) {
          case 1:
            result = (value * 1).toString() + " kg";
            break;
          case 2:
            result = (value * 1000).toString() + " gram";
            break;
          case 3:
            result = (value * 1000000).toString() + " mg";
            break;
          case 4:
            result = (value * 1000000000).toString() + " µg";
            break;
          case 5:
            double hasil = double.parse(value.toString()) * 2.2;
            result = hasil.toString() + " lb";
            break;
          default:
            result = "-";
        }
        break;
      case 2:
        switch (unit2) {
          case 1:
            result = (value * 1000).toString() + " kg";
            break;
          case 2:
            result = (value * 1).toString() + " gram";
            break;
          case 3:
            result = (value * 1000).toString() + " mg";
            break;
          case 4:
            result = (value * 1000000).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000;
            result = hasil.toString() + " lb";
            break;
          default:
            result = "-";
        }
        break;
      case 3:
        switch (unit2) {
          case 1:
            result = (value * 1000000).toString() + " kg";
            break;
          case 2:
            result = (value * 1000).toString() + " gram";
            break;
          case 3:
            result = (value * 1).toString() + " mg";
            break;
          case 4:
            result = (value * 1000).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000000;
            result = hasil.toString() + " lb";
            break;
          default:
            result = "-";
        }
        break;
      case 4:
        switch (unit2) {
          case 1:
            result = (value * 1000000000).toString() + " kg";
            break;
          case 2:
            result = (value * 1000000).toString() + " gram";
            break;
          case 3:
            result = (value * 1000).toString() + " mg";
            break;
          case 4:
            result = (value * 1).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000000000;
            result = hasil.toString() + " lb";
            break;
          default:
            result = "-";
        }
        break;
      case 5:
        switch (unit2) {
          case 1:
            double hasil = double.parse(value.toString()) * 0.45;
            result = hasil.toString() + " kg";
            break;
          case 2:
            double hasil = double.parse(value.toString()) * 453.59;
            result = hasil.toString() + " gram";
            break;
          case 3:
            double hasil = double.parse(value.toString()) * 453592.7;
            result = hasil.toString() + " mg";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 453592703.69;
            result = hasil.toString() + " µg";
            break;
          case 5:
            result = (value * 1).toString() + " lb";
            break;
          default:
            result = "-";
        }
        break;
      default:
        result = "-";
    }
    notifyListeners();
  }

  void setConvertLiquid(int value, int unit1, int unit2) {
    switch (unit1) {
      case 1:
        switch (unit2) {
          case 1:
            result = (value * 1).toString() + " ml";
            break;
          case 2:
            result = (value / 1000).toString() + " liter";
            break;
          case 3:
            result = (value * 1).toString() + " cc";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 0.01;
            result = hasil.toString() + " dl";
            break;
          default:
            result = "-";
        }
        break;
      case 2:
        switch (unit2) {
          case 1:
            result = (value * 1000).toString() + " ml";
            break;
          case 2:
            result = (value * 1).toString() + " liter";
            break;
          case 3:
            result = (value * 1000).toString() + " cc";
            break;
          case 4:
            result = (value * 10).toString() + " dl";
            break;
          default:
            result = "-";
        }
        break;
      case 3:
        switch (unit2) {
          case 1:
            result = (value * 1).toString() + " ml";
            break;
          case 2:
            result = (value / 1000).toString() + " liter";
            break;
          case 3:
            result = (value * 1).toString() + " cc";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 0.01;
            result = hasil.toString() + " dl";
            break;
          default:
            result = "-";
        }
        break;
      case 4:
        switch (unit2) {
          case 1:
            result = (value * 100).toString() + " ml";
            break;
          case 2:
            double hasil = double.parse(value.toString()) * 0.1;
            result = hasil.toString() + " liter";
            break;
          case 3:
            result = (value * 100).toString() + " cc";
            break;
          case 4:
            result = (value * 1).toString() + " dl";
            break;
          default:
            result = "-";
        }
        break;
      default:
        result = "-";
    }
    notifyListeners();
  }

  String get getResult => result!;
}
