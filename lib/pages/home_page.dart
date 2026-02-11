import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnings/models/catalog.dart';
import 'package:learnings/utils/routes.dart';
import 'package:learnings/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';

class HomePage extends StatefulWidget {
  //HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    LoadData();
  }

  Future<void> LoadData() async {
    await Future.delayed(Duration(seconds: 2));
    //json nikalne k lie
    final CatalogJSON = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodedData = jsonDecode(CatalogJSON);
    final productData = decodedData["products"];
    //final productData = decod edData["products"];
    print("Total products: ${productData.length}");

    CatalogModel.items = List.from(
      productData,
    ).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  //final dummyList = List.generate(20, (index)=> CatalogModel.items[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.CartRoute);
        },
        backgroundColor: MyTheme.darkBlue,

        child: Icon(CupertinoIcons.cart, color: Colors.white),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                ?CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
