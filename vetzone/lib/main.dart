import 'package:flutter/material.dart';
import 'package:vetzone/views/MainMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vet Zone',
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColorDark: Colors.blue[900],
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.yellow[500]),
      home: MainMenu(),
    );
  }
}
