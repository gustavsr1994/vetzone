import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/assets/widget/card/card_custom.dart';
import 'package:vetzone/statemanagement/get/Calori_controller.dart';
import 'package:vetzone/statemanagement/get/Calori_selected_controller.dart';

class CaloriMenu extends StatefulWidget {
  @override
  _CaloriMenuState createState() => _CaloriMenuState();
}

class _CaloriMenuState extends State<CaloriMenu> {
  String typeSelected = "Select One";
  String activitySelected = "Select Activity";
  TextEditingController massaText = TextEditingController();
  List<DropdownMenuItem<String>> _dropdownMenuItemsType = [];
  int petSelected = 0;

  var colorPalettes = ColorPalettes();
  var titleStringCommon = TitleString();
  var fieldStringCommon = FieldString();

  var selectedActivityController = Get.put(CaloriSelectedController());
  var calculateCalori = Get.put(CaloriController());

  @override
  void initState() {
    super.initState();
    initialData();
  }

  void initialData() {
    setState(() {
      for (var itemType in typePets) {
        _dropdownMenuItemsType.add(DropdownMenuItem(
          value: itemType,
          child: Text(itemType),
        ));
      }
    });
    selectedActivityController.initState;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type Pet',
                      style: TextStyle(
                          color: colorPalettes.primaryDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                        hint: Text(fieldStringCommon.TYPE_PETS),
                        isExpanded: true,
                        value: typeSelected,
                        items: _dropdownMenuItemsType,
                        onChanged: (value) {
                          typeSelected = value!;
                          for (var index = 0;
                              index < typePets.length;
                              index++) {
                            if (typePets[index] == value) {
                              setState(() {
                                petSelected = index;
                              });
                              selectedActivityController.listActivity(index);
                            }
                          }
                        }),
                  ],
                )),
            Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Activity',
                      style: TextStyle(
                          color: colorPalettes.primaryDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                    selectedActivityController.obx(
                        (state) => DropdownButton<String>(
                            hint: Text("SELECT ACTIVITY"),
                            isExpanded: true,
                            value: state!.activitySelected,
                            items: state.listActivity,
                            onChanged: (value) {
                              for (var index = 0;
                                  index < state.listActivity!.length;
                                  index++) {
                                if (state.listActivity![index].value! ==
                                    value) {
                                  setState(() {
                                    activitySelected = (index - 1).toString();
                                  });
                                }
                              }
                              selectedActivityController.selectedActivity(
                                  state.listActivity, value);
                            }),
                        onLoading: DropdownButton<String>(
                          hint: Text("SELECT ACTIVITY"),
                          isExpanded: true,
                          value: "Select Activity",
                          items: [
                            DropdownMenuItem(
                              value: "Select Activity",
                              child: Text("Select Activity"),
                            )
                          ],
                        ))
                  ],
                )),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: massaText,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                        color: colorPalettes.accentColor!, width: 0.0),
                  ),
                  focusColor: colorPalettes.accentColor!,
                  labelText: "Insert masssa your pet (kg)",
                  labelStyle: TextStyle(color: colorPalettes.primaryDarkColor!),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () {
                  calculateCalori.calculate(petSelected, activitySelected,
                      double.parse(massaText.text));
                },
                style: ElevatedButton.styleFrom(
                    primary: ColorPalettes().primaryDarkColor!,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: ColorPalettes().primaryDarkColor!,
                            style: BorderStyle.solid))),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          color: ColorPalettes().accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Output',
                textAlign: TextAlign.left,
              ),
            ),
            calculateCalori.obx(
                (state) => CardCustom(
                      result: state!,
                    ),
                onLoading: CardCustom(
                  result: "0 kCal",
                ))
          ],
        ),
      ),
    );
  }
}
