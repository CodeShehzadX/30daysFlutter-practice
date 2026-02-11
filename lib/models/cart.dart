import 'package:flutter/material.dart';
import 'package:learnings/models/catalog.dart';

class CartModel{

  //catalog field
  late CatalogModel _catalog;

  //all id, store id for each item
  final List <int> _itemId = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
 set catalog(CatalogModel newCatalog){
   _catalog = newCatalog;
 }

 //get items in cart
List <Item?> get items=>_itemId.map((id)=>_catalog.getById(id)).toList();

 //get total price
num get totalPrice => items.fold(0, (total, current)=> total + current!.price);

//add item
void addItem(Item item){
  _itemId.add(item.id);
}

//remove item
  void removeItem(Item item){
    _itemId.remove(item.id);
  }


}