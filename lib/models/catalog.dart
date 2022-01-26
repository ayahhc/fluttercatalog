import 'dart:convert';

import 'cart_page.dart';

class CatalogModel{

// wrong way of code (but correct)

// static final catalogModel = CatalogModel._internal();
// CatalogModel._internal();
// factory CatalogModel() =>  catalogModel;

  static List<Item>? items;

  final cartModel = CartModel();

  //get item by id
   Item getById(int id)=> 
  items!.firstWhere((element) => element.id == id, orElse: null);

//get item by position
   Item getByPosition(int pos)=>items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String Image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.Image,
  });



  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? Image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      Image: Image ?? this.Image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'Image': Image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price'] ?? 0,
      color: map['color'] ?? '',
      Image: map['Image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, Image: $Image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.Image == Image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      Image.hashCode;
  }
}
