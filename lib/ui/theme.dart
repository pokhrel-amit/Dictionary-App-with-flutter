import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customTheme = ThemeData(
  // brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade900,

  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    shadowColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline1: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
    headline3: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic, 
    ),
    headline4: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey.shade800,
   
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
  ),
);
