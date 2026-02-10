 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnings/models/catalog.dart';
import 'package:learnings/widgets/drawer.dart';
import 'package:learnings/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
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
       backgroundColor: MyTheme.creamColor,
//        backgroundColor: Colors.white,
//        appBar: AppBar(
// title: Text("catalog" , ),
//        ),
//        body: Padding(
//          padding: EdgeInsets.all(16),
//          child: (CatalogModel.items.isNotEmpty)?
//              GridView.builder(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16,),
//                  itemBuilder: (context, index){
//                    final items= CatalogModel.items[index];
//                    return Card(
//                      clipBehavior: Clip.antiAlias,
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                      child: GridTile(
//                        header: Container(
//                            child:
//                            Text(items.name, style: TextStyle(
//                              color: Colors.white,
//                            ),),
//                          padding: const EdgeInsets.all(12),
//                        decoration: BoxDecoration(
//                          color: Colors.deepPurple,
//                        ),
//                        ),
//                        child: Image.network(items.imageURL,),
//                        footer: Container(
//                            child: Text(items.price.toString(),style: TextStyle(
//                              color: Colors.white,
//                            ),),
//                                padding: const EdgeInsets.all(0),
//                          decoration: BoxDecoration(
//                            color: Colors.deepPurple,
//                          ),
//                        ),
//
//                      ),
//
//
//                    );
//                  },
//              itemCount: CatalogModel.items.length,)
//              :Center(
//            child: CircularProgressIndicator(),
//          )
//        ),
//
//        drawer: MyDrawer(),
     body: SafeArea(
       child: Container(
        padding:  Vx.m32,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)?
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ]
           ),
       ),
     ),


     );
   }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ["Catalog App".text.xl5.bold.color(MyTheme.darkBlue).make(),
          "Trending Products".text.xl2.make(),

        ]
    );
  }
  
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
final catalog = CatalogModel.items[index];
        return CatalogItem(catalog:  catalog);
        }


    );
  }
}
class CatalogItem extends StatelessWidget {
final Item catalog;
const CatalogItem({
  required this.catalog,
});
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children:[
          CatalogImage(image: catalog.imageURL),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBlue).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              Padding(
                padding: EdgeInsets.zero,
                child: OverflowBar(
                alignment: MainAxisAlignment.spaceBetween,



                  children: [

                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.darkBlue,
                        shape: StadiumBorder(),
                      ) ,
                        child: "Buy".text.white. make(),)
                  ],
                ).pOnly(right: 8),
              )

            ],
          ))
    ]),

    )
        .white
        .roundedLg
        .square(150)
    .alignCenterLeft
        .make()
      .py16()
        ;
  }
}

class CatalogImage extends StatelessWidget {
final String  image;
CatalogImage({
  required this.image
});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      // width: 50,
      // height: 50,
      //fit: BoxFit.cover,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
