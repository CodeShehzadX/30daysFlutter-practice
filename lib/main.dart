import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnings/pages/cart_page.dart';
import 'package:learnings/pages/home_page.dart';
import 'package:learnings/pages/login_page.dart';
import 'package:learnings/utils/routes.dart';
import 'package:learnings/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,

      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.CartRoute: (context) => CartPage(),
      },
    );
  }
}
