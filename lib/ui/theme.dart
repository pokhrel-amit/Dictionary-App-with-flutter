import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData customTheme = ThemeData(
  // brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade900,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    shadowColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
  ),
);
