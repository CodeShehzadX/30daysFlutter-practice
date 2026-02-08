 import 'package:flutter/material.dart';
import 'package:learnings/widgets/drawer.dart';

 class HomePage extends StatelessWidget {
   const HomePage({super.key});
   final int days = 30;
   final String name = 'CodeShehzadX';
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
title: Text("catalog" , ),
       ),
       body: Center(
           child: Container(
             child: Text("$days days flutter challenge of $name."),
           )
       ),
       drawer: MyDrawer(),
     );
   }
 }
 