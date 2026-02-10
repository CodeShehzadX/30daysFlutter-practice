import 'package:flutter/material.dart';
import 'package:learnings/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        onTap: (){
          print("Item ${item.id} clicked");
        },
        leading: Image.network(item.imageURL,width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),


        title: Text(item.name) ,
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price.toString()}", style:
          TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
      ),
    );
  }
}
