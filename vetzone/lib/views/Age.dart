import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/assets/widget/card/card_custom.dart';
import 'package:vetzone/statemanagement/providers/AgeProv.dart';
import 'package:intl/intl.dart';

class AgeMenu extends StatefulWidget {
  @override
  _AgeMenuState createState() => _AgeMenuState();
}

class _AgeMenuState extends State<AgeMenu> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AgeProv>(
      create: (context) => AgeProv(),
      child: SafeArea(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Consumer<AgeProv>(
                  builder: (context, valueAge, _) => DateTimeField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please, fill this field';
                      }
                      // _startDate = value;
                      return null;
                    },
                    style: TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorPalettes().accentColor!)),
                        filled: true,
                        labelText: 'Birth Date*',
                        labelStyle:
                            TextStyle(color: ColorPalettes().primaryDarkColor!),
                        hintStyle:
                            TextStyle(color: ColorPalettes().primaryDarkColor!),
                        errorStyle: TextStyle(
                          color: Colors.redAccent[700],
                        )),
                    format: DateFormat('dd-MMM-yyyy'),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      valueAge.setAge(value!);
                    },
                    onChanged: (value) {
                      valueAge.setAge(value!);
                    },
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        initialDate: DateTime(1994),
                        lastDate: DateTime(DateTime.now().year),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child!,
                          );
                        },
                      );
                      return date;
                    },
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
              Consumer<AgeProv>(
                  builder: (context, ageValue, _) => CardCustom(
                        result: ageValue.getResultAge,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
