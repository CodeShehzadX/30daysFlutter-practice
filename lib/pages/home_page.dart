 import 'package:flutter/material.dart';
import 'package:learnings/models/catalog.dart';
import 'package:learnings/widgets/drawer.dart';

import '../widgets/item_widget.dart';

 class HomePage extends StatelessWidget {
    HomePage({super.key});
   final int days = 30;
   final String name = 'CodeShehzadX';

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
 