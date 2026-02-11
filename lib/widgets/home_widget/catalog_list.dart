import 'package:flutter/material.dart';
import 'package:learnings/pages/home_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalog = CatalogModel.getByPosition(index)!;
          return InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context)=>HomeDetailPage(
                            catalog: catalog),),);
              },
              child: CatalogItem(catalog:  catalog));
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
            Hero(
              tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.imageURL)),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.theme.colorScheme.secondary,).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                Padding(
                  padding: EdgeInsets.zero,
                  child:
                  OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,



                    children: [

                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.darkBlue,
                          shape: StadiumBorder(),
                        ) ,
                        child: "Add to Cart".text.white. make(),)
                    ],
                  ).pOnly(right: 8),
                )

              ],
            ))
          ]),

    )
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .alignCenterLeft
        .make()
        .py16()
    ;
  }
}
