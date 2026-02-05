import 'package:flutter/material.dart';
import 'package:learnings/home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

double pi =3.142;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }}