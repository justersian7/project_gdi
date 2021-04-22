import 'package:flutter/material.dart';

import './constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder normalInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 5,
  );
  OutlineInputBorder activeInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: kErrorColor),
    gapPadding: 5,
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: kErrorColor),
    gapPadding: 5,
  );
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    labelStyle: TextStyle(fontSize: 18),
    enabledBorder: normalInputBorder,
    border: activeInputBorder,
    errorBorder: errorInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: kTextColor,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        height: 1,
      ),
    ),
  );
}
