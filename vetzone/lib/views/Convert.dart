import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/assets/widget/card/card_custom.dart';
import 'package:vetzone/models/Model.dart';
import 'package:vetzone/statemanagement/providers/ConvertProv.dart';
import 'package:vetzone/widgets/TabBarAdapter.dart';

class ConvertMenu extends StatefulWidget {
  @override
  _ConvertMenuState createState() => _ConvertMenuState();
}

class _ConvertMenuState extends State<ConvertMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> formKeyMass = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyLiquid = GlobalKey<FormState>();

  List<String> _listTitle = ['Mass', 'Liquid'];
  List<DropdownMenuItem<Model>>? _dropdownMenuItemsMassaUnit,
      _dropdownMenuItemsLiquidUnit = [];
  int? _variabel, _unit, _unit2 = 0;
  Model? unitMassFrom, unitMassTo;
  Model? unitLiquidFrom, unitLiquidTo;

  int? indexCurrent;

  void initState() {
    super.initState();
    Model.listMassaUnit().then((value) {
      _dropdownMenuItemsMassaUnit = [];
      buildDropdownMenuItemsMassaUnit(value);
    });

    Model.listLiquidUnit().then((value) {
      _dropdownMenuItemsLiquidUnit = [];
      buildDropdownMenuItemsLiquidUnit(value);
    });
  }

  void buildDropdownMenuItemsMassaUnit(List units) {
    for (Model unit in units) {
      setState(() {
        _dropdownMenuItemsMassaUnit!.add(
          DropdownMenuItem(
            value: unit,
            child: Text(unit.name),
          ),
        );
      });
    }
  }

  void buildDropdownMenuItemsLiquidUnit(List units) {
    for (Model unit in units) {
      setState(() {
        _dropdownMenuItemsLiquidUnit!.add(
          DropdownMenuItem(
            value: unit,
            child: Text(unit.name),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConvertProv>(
      create: (context) => ConvertProv(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Container(
                      height: 70,
                      color: ColorPalettes().primaryDarkColor,
                      child: TabBarAdapter(
                        context: context,
                        title: _listTitle,
                      )),
                ),
                body: SafeArea(
                  child: TabBarView(
                    // controller: _tabController,
                    children: <Widget>[
                      //tab massa
                      Form(
                        key: formKeyMass,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please, fill this field';
                                            }
                                            _variabel = int.parse(value);
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(fontSize: 17),
                                          cursorColor: Theme.of(context)
                                              .primaryColorDark,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: ColorPalettes()
                                                          .accentColor!)),
                                              filled: true,
                                              labelText: 'Insert Your Massa*',
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
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
                                          child: Consumer<ConvertProv>(
                                            builder: (context, convertValue,
                                                    _) =>
                                                DropdownButton<Model>(
                                                    hint: Text('Unit'),
                                                    isExpanded: true,
                                                    value: unitMassFrom,
                                                    items:
                                                        _dropdownMenuItemsMassaUnit,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        unitMassFrom = value;
                                                        _unit = value!.id;
                                                      });
                                                      if (_unit2 != null) {
                                                        if (formKeyMass
                                                            .currentState!
                                                            .validate()) {
                                                          convertValue
                                                              .setConvertMassa(
                                                                  _variabel!,
                                                                  _unit!,
                                                                  _unit2!);
                                                        }
                                                      }
                                                    }),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(15),
                                  child: Consumer<ConvertProv>(
                                    builder: (context, convertValue, _) =>
                                        DropdownButton<Model>(
                                            hint: Text('Unit'),
                                            isExpanded: true,
                                            value: unitMassTo,
                                            items: _dropdownMenuItemsMassaUnit,
                                            onChanged: (value) {
                                              setState(() {
                                                unitMassTo = value;
                                                _unit2 = value!.id;
                                              });
                                              if (formKeyMass.currentState!
                                                  .validate()) {
                                                convertValue.setConvertMassa(
                                                    _variabel!,
                                                    _unit!,
                                                    _unit2!);
                                              }
                                            }),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Result',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Consumer<ConvertProv>(
                                  builder: (context, convertValue, _) =>
                                      CardCustom(
                                        result: convertValue.getResultMassa,
                                      ))
                            ],
                          ),
                        ),
                      ),

                      //tab liquid
                      Form(
                        key: formKeyLiquid,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please, fill this field';
                                            }
                                            _variabel = int.parse(value);
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(fontSize: 17),
                                          cursorColor: Theme.of(context)
                                              .primaryColorDark,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: ColorPalettes()
                                                          .accentColor!)),
                                              filled: true,
                                              labelText: 'Insert Your Liquid*',
                                              hintStyle: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
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
                                          child: Consumer<ConvertProv>(
                                            builder: (context, convertValue,
                                                    _) =>
                                                DropdownButton<Model>(
                                                    hint: Text('Unit'),
                                                    isExpanded: true,
                                                    value: unitLiquidFrom,
                                                    items:
                                                        _dropdownMenuItemsLiquidUnit,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        unitLiquidFrom = value;
                                                        _unit = value!.id;
                                                      });
                                                      if (_unit2 != null) {
                                                        if (formKeyLiquid
                                                            .currentState!
                                                            .validate()) {
                                                          convertValue
                                                              .setConvertLiquid(
                                                                  _variabel!,
                                                                  _unit!,
                                                                  _unit2!);
                                                        }
                                                      }
                                                    }),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(15),
                                  child: Consumer<ConvertProv>(
                                    builder: (context, convertValue, _) =>
                                        DropdownButton<Model>(
                                            hint: Text('Unit'),
                                            isExpanded: true,
                                            value: unitLiquidTo,
                                            items: _dropdownMenuItemsLiquidUnit,
                                            onChanged: (value) {
                                              setState(() {
                                                unitLiquidTo = value;
                                                _unit2 = value!.id;
                                              });
                                              if (formKeyLiquid.currentState!
                                                  .validate()) {
                                                convertValue.setConvertLiquid(
                                                    _variabel!,
                                                    _unit!,
                                                    _unit2!);
                                              }
                                            }),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Result',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Consumer<ConvertProv>(
                                  builder: (context, convertValue, _) =>
                                      CardCustom(
                                        result: convertValue.getResultLiquid,
                                      ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
