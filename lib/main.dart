import 'package:flutter/material.dart';
import 'package:learnings/pages/home_page.dart';
import 'package:learnings/pages/login_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

double pi =3.142;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context)=>HomePage(),
        "/login": (context)=>LoginPage(),
      },
    );
  }}