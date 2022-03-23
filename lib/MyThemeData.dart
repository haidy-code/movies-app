import 'package:flutter/material.dart';

class MyThemeData {
  static final primarycolor =Color.fromRGBO(18, 19, 18, 1.0);
  static final secondcolor =Color.fromRGBO(40, 42, 40, 1.0);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
          headline3: TextStyle(color: Colors.white, fontSize: 26),
          headline4: TextStyle(color: Colors.white, fontSize: 22),
          headline5: TextStyle(color: Colors.white, fontSize: 18),
          headline6: TextStyle( fontSize: 15)
      ));
}