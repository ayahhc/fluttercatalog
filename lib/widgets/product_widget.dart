import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
class ProductWidget extends StatelessWidget {
  final Item? item;

  const ProductWidget({Key? key, @required this.item}) :super(key: key);
  // const ProductWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
       
      child: ListTile(
        leading: Image.network(item?.Image ?? ""),
        title: Text(item?.name ?? ""),
        subtitle:Text(item?.desc ?? ""),
        
        trailing: Text("\$${item?. price.toString()  ?? ""}",
        textScaleFactor: 1.5 ,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
        ),
      ),
    );
  }
}