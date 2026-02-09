 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnings/models/catalog.dart';
import 'package:learnings/widgets/drawer.dart';
import 'dart:convert';

import '../widgets/item_widget.dart';

 class HomePage extends StatefulWidget {
    //HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final int days = 30;

   final String name = 'CodeShehzadX';

   @override
  void initState() {
    super.initState();
    LoadData();
    }
    Future <void> LoadData() async{
await Future.delayed(Duration(seconds: 2),);
      //json nikalne k lie
    final CatalogJSON = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(CatalogJSON);
    final productData = decodedData["products"];
    //final productData = decodedData["products"];
    print("Total products: ${productData.length}");

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
setState(() {});
   }


   //final dummyList = List.generate(20, (index)=> CatalogModel.items[0]);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
title: Text("catalog" , ),
       ),
       body: Padding(
         padding: EdgeInsets.all(16),
         child: (CatalogModel.items.isNotEmpty)?
             GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16,),
                 itemBuilder: (context, index){
                   final items= CatalogModel.items[index];
                   return Card(
                     clipBehavior: Clip.antiAlias,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                     child: GridTile(
                       header: Container(
                           child:
                           Text(items.name, style: TextStyle(
                             color: Colors.white,
                           ),),
                         padding: const EdgeInsets.all(12),
                       decoration: BoxDecoration(
                         color: Colors.deepPurple,
                       ),
                       ),
                       child: Image.network(items.imageURL,),
                       footer: Container(
                           child: Text(items.price.toString(),style: TextStyle(
                             color: Colors.white,
                           ),),
                               padding: const EdgeInsets.all(0),
                         decoration: BoxDecoration(
                           color: Colors.deepPurple,
                         ),
                       ),

                     ),


                   );
                 },
             itemCount: CatalogModel.items.length,)
             :Center(
           child: CircularProgressIndicator(),
         )
       ),

       drawer: MyDrawer(),
     );
   }
}
