import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/assets/common/style/color_palette.dart';
import 'package:vetzone/models/Model.dart';
import 'package:vetzone/statemanagement/providers/ConvertProv.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';
import 'package:vetzone/widgets/TabBarAdapter.dart';

class ConvertMenu extends StatefulWidget {
  @override
  _ConvertMenuState createState() => _ConvertMenuState();
}

class _ConvertMenuState extends State<ConvertMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _listTitle = ['Mass', 'Liquid', 'Temperature'];
  List<DropdownMenuItem<Model>> _dropdownMenuItemsMassaUnit,
      _dropdownMenuItemsLiquidUnit,
      _dropdownMenuItemsTempUnit = [];
  int _variabel, _unit, _unit2 = 0;
  Model _model, _model2;
  int indexCurrent;
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    Model.listMassaUnit().then((value) {
      _dropdownMenuItemsMassaUnit = [];
      buildDropdownMenuItemsMassaUnit(value);
    });

    Model.listLiquidUnit().then((value) {
      _dropdownMenuItemsLiquidUnit = [];
      buildDropdownMenuItemsLiquidUnit(value);
    });

    Model.listTempUnit().then((value) {
      _dropdownMenuItemsTempUnit = [];
      buildDropdownMenuItemsTempUnit(value);
    });
  }

  void buildDropdownMenuItemsMassaUnit(List units) {
    for (Model unit in units) {
      _dropdownMenuItemsMassaUnit.add(
        DropdownMenuItem(
          value: unit,
          child: Text(unit.name),
        ),
      );
    }
    // _dropdownMenuItemsLiquidUnit = [];
    // _dropdownMenuItemsMassaUnit = [];
  }

  void buildDropdownMenuItemsLiquidUnit(List units) {
    for (Model unit in units) {
      _dropdownMenuItemsLiquidUnit.add(
        DropdownMenuItem(
          value: unit,
          child: Text(unit.name),
        ),
      );
    }
    // _dropdownMenuItemsMassaUnit = [];
    // _dropdownMenuItemsTempUnit = [];
  }

  void buildDropdownMenuItemsTempUnit(List units) {
    for (Model unit in units) {
      _dropdownMenuItemsTempUnit.add(
        DropdownMenuItem(
          value: unit,
          child: Text(unit.name),
        ),
      );
    }
    // _dropdownMenuItemsMassaUnit = [];
    // _dropdownMenuItemsLiquidUnit = [];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConvertProv>(
      create: (context) => ConvertProv(),
      child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'Poppins',
              primaryColorDark: Colors.blue[900],
              primaryColor: Colors.lightBlue[800],
              accentColor: Colors.yellow[500]),
          home: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  title: HeaderTitle(
                    context: context,
                    title: 'Convert',
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(40),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(accentColor: ColorPalettes().accentColor),
                      child: Container(
                          height: 48,
                          child: TabBarAdapter(
                            context: context,
                            title: _listTitle,
                          )),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      //tab massa
                      Scaffold(
                        body: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
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
                                              if (value.isEmpty) {
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
                                                border: OutlineInputBorder(),
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
                                                      hint:
                                                          Text('Select a Unit'),
                                                      isExpanded: true,
                                                      value: _model,
                                                      items:
                                                          _dropdownMenuItemsMassaUnit,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _model = value;
                                                          _unit = value.id;
                                                        });
                                                        if (_unit2 != null) {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            convertValue
                                                                .setConvertMassa(
                                                                    _variabel,
                                                                    _unit,
                                                                    _unit2);
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
                                              hint: Text('Select a Unit'),
                                              isExpanded: true,
                                              value: _model2,
                                              items:
                                                  _dropdownMenuItemsMassaUnit,
                                              onChanged: (value) {
                                                setState(() {
                                                  _model2 = value;
                                                  _unit2 = value.id;
                                                });
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  convertValue.setConvertMassa(
                                                      _variabel, _unit, _unit2);
                                                }
                                              }),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Consumer<ConvertProv>(
                                      builder: (context, convertValue, _) =>
                                          Text(
                                        'Result : ' +
                                            convertValue.getResult.toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //tab liquid
                      Scaffold(
                        body: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
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
                                              if (value.isEmpty) {
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
                                                border: OutlineInputBorder(),
                                                filled: true,
                                                labelText:
                                                    'Insert Your Liquid*',
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
                                                      hint:
                                                          Text('Select a Unit'),
                                                      isExpanded: true,
                                                      value: _model,
                                                      items:
                                                          _dropdownMenuItemsLiquidUnit,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _model = value;
                                                          _unit = value.id;
                                                        });
                                                        if (_unit2 != null) {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            convertValue
                                                                .setConvertLiquid(
                                                                    _variabel,
                                                                    _unit,
                                                                    _unit2);
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
                                              hint: Text('Select a Unit'),
                                              isExpanded: true,
                                              value: _model2,
                                              items:
                                                  _dropdownMenuItemsLiquidUnit,
                                              onChanged: (value) {
                                                setState(() {
                                                  _model2 = value;
                                                  _unit2 = value.id;
                                                });
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  convertValue.setConvertLiquid(
                                                      _variabel, _unit, _unit2);
                                                }
                                              }),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Consumer<ConvertProv>(
                                      builder: (context, convertValue, _) =>
                                          Text(
                                        'Result : ' +
                                            convertValue.getResult.toString(),
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        child: Text('Convert Temperature'),
                      ),
                    ],
                  ),
                ),
                drawer: DrawerNavigation(),
              ))),
    );
  }
}
