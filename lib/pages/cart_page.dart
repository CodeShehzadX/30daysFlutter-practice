import 'package:flutter/material.dart';
import 'package:learnings/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
           _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$999".text.xl5.color(MyTheme.darkBlue).make(),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:"Buyng Not Supported yet".text.make() ));
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyTheme.darkBlue,
              shape: StadiumBorder(),
            ) ,
            child: "Buy".text.white. make(),).w32(context)
        ],
      ),

    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context , index){
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(onPressed: (){},
                icon: Icon(Icons.remove_circle_outline)),
            title: "Item 1".text.white.make(),
          );
        });
  }
}
