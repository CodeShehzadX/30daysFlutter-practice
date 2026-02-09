class CatalogModel {
  static  List<Item>items=[];
}



class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageURL;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageURL});

  factory Item.fromMap(Map<String,dynamic> map){
    return Item(
    id: map["id"]??0,
    name : map["name"]??"",
    desc : map["desc"]??"",
    price : map["price"]??0,
    color : map["color"]??"",
      imageURL : map["imageURL"]??"".toString().trim(),
    );
  }
  toMap()=> {
    "id": id,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "imageURL": imageURL,
  };

}
