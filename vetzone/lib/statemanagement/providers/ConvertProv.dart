import 'package:flutter/cupertino.dart';

class ConvertProv with ChangeNotifier {
  ConvertProv();
  String? resultMassa = "0";
  String? resultLiquid = "0";

  void setConvertMassa(int value, int unit1, int unit2) {
    switch (unit1) {
      case 1:
        switch (unit2) {
          case 1:
            resultMassa = (value * 1).toString() + " kg";
            break;
          case 2:
            resultMassa = (value * 1000).toString() + " gram";
            break;
          case 3:
            resultMassa = (value * 1000000).toString() + " mg";
            break;
          case 4:
            resultMassa = (value * 1000000000).toString() + " µg";
            break;
          case 5:
            double hasil = double.parse(value.toString()) * 2.2;
            resultMassa = hasil.toString() + " lb";
            break;
          default:
            resultMassa = "-";
        }
        break;
      case 2:
        switch (unit2) {
          case 1:
            resultMassa = (value * 1000).toString() + " kg";
            break;
          case 2:
            resultMassa = (value * 1).toString() + " gram";
            break;
          case 3:
            resultMassa = (value * 1000).toString() + " mg";
            break;
          case 4:
            resultMassa = (value * 1000000).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000;
            resultMassa = hasil.toString() + " lb";
            break;
          default:
            resultMassa = "-";
        }
        break;
      case 3:
        switch (unit2) {
          case 1:
            resultMassa = (value * 1000000).toString() + " kg";
            break;
          case 2:
            resultMassa = (value * 1000).toString() + " gram";
            break;
          case 3:
            resultMassa = (value * 1).toString() + " mg";
            break;
          case 4:
            resultMassa = (value * 1000).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000000;
            resultMassa = hasil.toString() + " lb";
            break;
          default:
            resultMassa = "-";
        }
        break;
      case 4:
        switch (unit2) {
          case 1:
            resultMassa = (value * 1000000000).toString() + " kg";
            break;
          case 2:
            resultMassa = (value * 1000000).toString() + " gram";
            break;
          case 3:
            resultMassa = (value * 1000).toString() + " mg";
            break;
          case 4:
            resultMassa = (value * 1).toString() + " µg";
            break;
          case 5:
            double hasil = (double.parse(value.toString()) * 2.2) / 1000000000;
            resultMassa = hasil.toString() + " lb";
            break;
          default:
            resultMassa = "-";
        }
        break;
      case 5:
        switch (unit2) {
          case 1:
            double hasil = double.parse(value.toString()) * 0.45;
            resultMassa = hasil.toString() + " kg";
            break;
          case 2:
            double hasil = double.parse(value.toString()) * 453.59;
            resultMassa = hasil.toString() + " gram";
            break;
          case 3:
            double hasil = double.parse(value.toString()) * 453592.7;
            resultMassa = hasil.toString() + " mg";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 453592703.69;
            resultMassa = hasil.toString() + " µg";
            break;
          case 5:
            resultMassa = (value * 1).toString() + " lb";
            break;
          default:
            resultMassa = "-";
        }
        break;
      default:
        resultMassa = "-";
    }
    notifyListeners();
  }

  void setConvertLiquid(int value, int unit1, int unit2) {
    switch (unit1) {
      case 1:
        switch (unit2) {
          case 1:
            resultLiquid = (value * 1).toString() + " ml";
            break;
          case 2:
            resultLiquid = (value / 1000).toString() + " liter";
            break;
          case 3:
            resultLiquid = (value * 1).toString() + " cc";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 0.01;
            resultLiquid = hasil.toString() + " dl";
            break;
          default:
            resultLiquid = "-";
        }
        break;
      case 2:
        switch (unit2) {
          case 1:
            resultLiquid = (value * 1000).toString() + " ml";
            break;
          case 2:
            resultLiquid = (value * 1).toString() + " liter";
            break;
          case 3:
            resultLiquid = (value * 1000).toString() + " cc";
            break;
          case 4:
            resultLiquid = (value * 10).toString() + " dl";
            break;
          default:
            resultLiquid = "-";
        }
        break;
      case 3:
        switch (unit2) {
          case 1:
            resultLiquid = (value * 1).toString() + " ml";
            break;
          case 2:
            resultLiquid = (value / 1000).toString() + " liter";
            break;
          case 3:
            resultLiquid = (value * 1).toString() + " cc";
            break;
          case 4:
            double hasil = double.parse(value.toString()) * 0.01;
            resultLiquid = hasil.toString() + " dl";
            break;
          default:
            resultLiquid = "-";
        }
        break;
      case 4:
        switch (unit2) {
          case 1:
            resultLiquid = (value * 100).toString() + " ml";
            break;
          case 2:
            double hasil = double.parse(value.toString()) * 0.1;
            resultLiquid = hasil.toString() + " liter";
            break;
          case 3:
            resultLiquid = (value * 100).toString() + " cc";
            break;
          case 4:
            resultLiquid = (value * 1).toString() + " dl";
            break;
          default:
            resultLiquid = "-";
        }
        break;
      default:
        resultLiquid = "-";
    }
    notifyListeners();
  }

  String get getResultMassa => resultMassa!;
  String get getResultLiquid => resultLiquid!;
}
