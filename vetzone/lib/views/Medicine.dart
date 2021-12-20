import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/models/Model.dart';
import 'package:vetzone/statemanagement/providers/MedicineProv.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';

class MedicineMenu extends StatefulWidget {
  @override
  _MedicineMenuState createState() => _MedicineMenuState();
}

@override
class _MedicineMenuState extends State<MedicineMenu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<Model>> _dropdownMenuItemsUnit = [];
  int? _massPet, _dose, _concentration, _unit;
  Model? _model;

  void initState() {
    super.initState();
    Model.listUnitMedicine().then((value) {
      _dropdownMenuItemsUnit = [];
      buildDropdownMenuItemsUnit(value);
    });
  }

  void buildDropdownMenuItemsUnit(List units) {
    for (Model unit in units) {
      _dropdownMenuItemsUnit.add(
        DropdownMenuItem(
          value: unit,
          child: Text(unit.name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MedicineProv>(
      create: (context) => MedicineProv(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            title: HeaderTitle(
              context: context,
              title: 'Calculate Dose of Medicine',
            )),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, fill this field';
                        }
                        _massPet = int.parse(value);
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 17),
                      cursorColor: Theme.of(context).primaryColorDark,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Insert Mass your Pets(kg)*',
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          errorStyle: TextStyle(
                            color: Colors.redAccent[700],
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please, fill this field';
                                }
                                _dose = int.parse(value);
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 17),
                              cursorColor: Theme.of(context).primaryColorDark,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  labelText: 'Insert Dose*',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent[700],
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: EdgeInsets.all(5),
                              child: DropdownButton<Model>(
                                  hint: Text('Select a Unit'),
                                  isExpanded: true,
                                  value: _model,
                                  items: _dropdownMenuItemsUnit,
                                  onChanged: (value) {
                                    setState(() {
                                      _model = value;
                                      _unit = value!.id;
                                    });
                                  })),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please, fill this field';
                        }
                        _concentration = int.parse(value);
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 17),
                      cursorColor: Theme.of(context).primaryColorDark,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Insert Concentration(%)*',
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          errorStyle: TextStyle(
                            color: Colors.redAccent[700],
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    child: Consumer<MedicineProv>(
                      builder: (context, doseValue, _) => ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            doseValue.setMedicineDose(
                                _massPet!, _dose!, _unit!, _concentration!);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            onPrimary: Theme.of(context).primaryColorDark,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColorDark,
                                    style: BorderStyle.solid))),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                  color: ColorPalettes().accentColor,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Consumer<MedicineProv>(
                        builder: (context, medicalValue, _) => Text(
                          'Result : ' +
                              medicalValue.getMedicalPaid.toString() +
                              " ml",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerNavigation(),
      ),
    );
  }
}
