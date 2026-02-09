 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnings/models/catalog.dart';
import 'package:learnings/widgets/drawer.dart';
import 'dart:convert';

import '../widgets/item_widget.dart';

 class HomePage extends StatefulWidget {
    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final int days = 30;

   final String name = 'CodeShehzadX';

   @override
  void initState() {
    super.initState();
    LoadData() async{
    //json nikalne k lie
    final CatalogJSON = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(CatalogJSON);
    final productData = decodedData["products"];

    };
  }

   final dummyList = List.generate(20, (index)=> CatalogModel.items[0]);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
title: Text("catalog" , ),
       ),
       body: Padding(
         padding: EdgeInsets.all(16),
         child: ListView.builder(
             itemCount:
             //CatalogModel.items.length,
             dummyList.length,
         itemBuilder: (context, index){
               return ItemWidget(
                 //item: CatalogModel.items[index],
                 item: dummyList[index],

               );
         },),
       ),

       drawer: MyDrawer(),
     );
   }
}
 