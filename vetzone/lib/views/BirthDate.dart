import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/assets/common/constant/constant_string.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/assets/widget/card/card_custom.dart';
import 'package:vetzone/models/Model.dart';
import 'package:vetzone/statemanagement/providers/BirthProv.dart';
import 'package:intl/intl.dart';

class BirthDateMenu extends StatefulWidget {
  @override
  _BirthDateMenuState createState() => _BirthDateMenuState();
}

class _BirthDateMenuState extends State<BirthDateMenu> {
  var titleStringCommon = TitleString();
  var fieldStringCommon = FieldString();
  var conditionStringCommon = ConditionString();
  var colorPalettes = ColorPalettes();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<Model>> _dropdownMenuItemsType = [];

  int? _type;
  Model? _model;

  void initState() {
    super.initState();
    Model.listTypePets().then((value) {
      setState(() {
        _dropdownMenuItemsType = [];
        buildDropdownMenuItemsType(value);
      });
    });
  }

  void buildDropdownMenuItemsType(List types) {
    for (Model type in types) {
      _dropdownMenuItemsType.add(
        DropdownMenuItem(
          value: type,
          child: Text(type.name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BirthProv>(
      create: (context) => BirthProv(),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(12),
                  child: DropdownButton<Model>(
                      hint: Text(fieldStringCommon.TYPE_PETS),
                      isExpanded: true,
                      value: _model,
                      items: _dropdownMenuItemsType,
                      onChanged: (value) {
                        setState(() {
                          _model = value;
                          _type = value!.id;
                        });
                      })),
              Container(
                margin: EdgeInsets.all(7),
                child: Consumer<BirthProv>(
                  builder: (context, valueAge, _) => DateTimeField(
                    validator: (value) {
                      if (value == null) {
                        return conditionStringCommon.notifBlank;
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
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorPalettes().accentColor!)),
                        filled: true,
                        labelText: fieldStringCommon.MARRIED_DATE,
                        labelStyle:
                            TextStyle(color: ColorPalettes().primaryDarkColor),
                        hintStyle:
                            TextStyle(color: ColorPalettes().primaryDarkColor),
                        errorStyle: TextStyle(
                          color: Colors.redAccent[700],
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: ColorPalettes().primaryDarkColor,
                        )),
                    format: DateFormat('dd-MMM-yyyy'),
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      valueAge.setBirth(_type!, value!);
                    },
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        initialDate: DateTime(1994),
                        lastDate: DateTime(DateTime.now().year),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.from(
                                colorScheme: ColorScheme.light(
                                    primary:
                                        ColorPalettes().primaryDarkColor!)),
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
              Consumer<BirthProv>(
                  builder: (context, ageValue, _) => CardCustom(
                        result: ageValue.getResultBirth,
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
