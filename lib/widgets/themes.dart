import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.lato().fontFamily,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}
