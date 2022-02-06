import 'package:get/get.dart';

class CaloriController extends GetxController with StateMixin<String> {
  void calculate(int typePet, String indexActivity, double massa) {
    String result = "0";
    double hasil = 0.0;
    change(null, status: RxStatus.loading());
    if (typePet == 1) {
      if (indexActivity == "0") {
        hasil = massa * 70;
      } else if (indexActivity == "1") {
        hasil = massa * 100;
      } else if (indexActivity == "2") {
        hasil = massa * 125;
      } else if (indexActivity == "3") {
        hasil = massa * 1238;
      } else if (indexActivity == "4") {
        hasil = massa * 130;
      } else if (indexActivity == "5") {
        hasil = massa * 115;
      } else if (indexActivity == "6") {
        hasil = massa * 132;
      } else if (indexActivity == "7") {
        hasil = massa * 158;
      } else if (indexActivity == "8") {
        hasil = massa * 250;
      } else if (indexActivity == "9") {
        hasil = massa * 210;
      } else if (indexActivity == "10") {
        hasil = massa * 175;
      } else if (indexActivity == "11") {
        hasil = massa * 140;
      } else if (indexActivity == "12") {
        hasil = massa * 258;
      } else if (indexActivity == "13") {
        hasil = massa * 292;
      } else if (indexActivity == "14") {
        hasil = massa * 317;
      } else if (indexActivity == "15") {
        hasil = massa * 334;
      } else if (indexActivity == "16") {
        hasil = massa * 90;
      }
    } else {
      if (indexActivity == "0") {
        hasil = massa * 70;
      } else if (indexActivity == "1") {
        hasil = massa * 100;
      } else if (indexActivity == "2") {
        hasil = massa * 140;
      } else if (indexActivity == "3") {
        hasil = massa * 160;
      } else if (indexActivity == "4") {
        hasil = massa * 140;
      } else if (indexActivity == "5") {
        hasil = massa * 120;
      } else if (indexActivity == "6") {
        hasil = massa * 87;
      } else if (indexActivity == "7") {
        hasil = massa * 154;
      } else if (indexActivity == "8") {
        hasil = massa * 154;
      } else if (indexActivity == "9") {
        hasil = massa * 172;
      } else if (indexActivity == "10") {
        hasil = massa * 172;
      } else if (indexActivity == "11") {
        hasil = massa * 166;
      } else if (indexActivity == "12") {
        hasil = massa * 160;
      } else if (indexActivity == "13") {
        hasil = massa * 148;
      } else if (indexActivity == "14") {
        hasil = massa * 87;
      }
    }
    result = "$hasil kCal";
    change(result, status: RxStatus.success());
    // birthDate = marriageDate;
  }
}
