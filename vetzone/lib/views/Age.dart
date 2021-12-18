import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vetzone/providers/AgeProv.dart';
import 'package:vetzone/widgets/DrawerNavigation.dart';
import 'package:vetzone/widgets/HeaderTitle.dart';
import 'package:intl/intl.dart';

class AgeMenu extends StatefulWidget {
  @override
  _AgeMenuState createState() => _AgeMenuState();
}

class _AgeMenuState extends State<AgeMenu> {
  DateTime _birthDate;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 400,
      height: 810,
      allowFontScaling: true,
    )..init(context);
    return ChangeNotifierProvider<AgeProv>(
      create: (context) => AgeProv(),
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorDark,
            title: HeaderTitle(
              context: context,
              title: 'Calculate Age',
            )),
        body: SafeArea(
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(ScreenUtil.instance.setWidth(7)),
                  child: Consumer<AgeProv>(
                    builder: (context, valueAge, _) => DateTimeField(
                      validator: (value) {
                        if (value == null) {
                          return 'Please, fill this field';
                        }
                        // _startDate = value;
                        return null;
                      },
                      style: TextStyle(fontSize: ScreenUtil.instance.setSp(17)),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          labelText: 'Birth Date*',
                          hintStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          errorStyle: TextStyle(
                            color: Colors.redAccent[700],
                          )),
                      format: DateFormat('dd-MMM-yyyy'),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        valueAge.setAge(value);
                      },
                      onChanged: (value) {
                        valueAge.setAge(value);
                      },
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                          initialDate: DateTime(1994),
                          lastDate: DateTime(DateTime.now().year),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData.light(),
                              child: child,
                            );
                          },
                        );
                        return date;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(20),
                ),
                Container(
                    margin: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
                    child: Consumer<AgeProv>(
                      builder: (context, ageValue, _) => Text(
                        ageValue.getResultAge.toString(),
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(17),
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark),
                      ),
                    )),
              ],
            ),
          ),
        ),
        drawer: DrawerNavigation(),
      ),
    );
  }
}
