import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import './views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CoviSafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: HexColor('#3FEF97'),
        //secondary color
        accentColor: HexColor('#54F0A2'),

        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline4: TextStyle(fontSize: 12.0, color: Colors.white),
           headline5: TextStyle(
              fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}
