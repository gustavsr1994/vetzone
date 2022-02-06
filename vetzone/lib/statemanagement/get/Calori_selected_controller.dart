import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';

class CaloriSelectedController extends GetxController
    with StateMixin<ActivitySelected> {
  void initState() {
    change(null, status: RxStatus.success());
  }

  void listActivity(int indexType) async {
    List<DropdownMenuItem<String>> _dropdownActivity = [];
    change(null, status: RxStatus.loading());
    if (indexType == 1) {
      for (var itemType in statDog) {
        _dropdownActivity.add(DropdownMenuItem(
          value: itemType,
          child: Text(itemType),
        ));
      }
    } else if (indexType == 2) {
      for (var itemType in statCat) {
        _dropdownActivity.add(DropdownMenuItem(
          value: itemType,
          child: Text(itemType),
        ));
      }
    }
    change(
        ActivitySelected(
            listActivity: _dropdownActivity,
            activitySelected: "Select Activity"),
        status: RxStatus.success());
  }

  void selectedActivity(
      List<DropdownMenuItem<String>>? _dropdownActivity, String? selected) {
    change(null, status: RxStatus.loading());
    change(
        ActivitySelected(
            listActivity: _dropdownActivity, activitySelected: selected),
        status: RxStatus.success());
  }
}

class ActivitySelected {
  List<DropdownMenuItem<String>>? listActivity;
  String? activitySelected;
  ActivitySelected({this.listActivity, this.activitySelected});
}
