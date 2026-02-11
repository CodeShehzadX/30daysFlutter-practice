import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
     cardColor: Colors.white,
     canvasColor: MyTheme.creamColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkBlue,
      primary: darkBlue,
      secondary: LightBlue, // 👈 ACCENT COLOR
      background: creamColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyTheme.darkBlue,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
      ),
    ),

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
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,

    canvasColor: MyTheme.DarkCreamColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkBlue,
      brightness: Brightness.dark,
      primary: Colors.white,
      secondary: LightBlue, // 👈 SAME accent color
      background: DarkCreamColor,
    ),

    secondaryHeaderColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyTheme.LightBlue,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),  );


  static Color creamColor = Color(0xfff5f5f5);
  static Color DarkCreamColor = Vx.gray900;
  static Color darkBlue = Color(0xff00008B);
  static Color LightBlue = Vx.indigo500;
}
