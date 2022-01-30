// ignore_for_file: avoid_print

import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widget/catalog_header.dart';
import 'package:catalog_app/widgets/home_widget/catalog_list.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//api is not working here
// final url ="https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }
loadData() async{
  await Future.delayed(Duration(seconds: 2));
 final catalogJson =await rootBundle.loadString("assest/files/catalog.json");
 //api is not workinh here
  // final response =await http.get(Uri.parse(url));
  // final catalogJson = response.body;
final decodedData  = jsonDecode(catalogJson);
final productsData = decodedData["products"];
CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
setState(() {
  
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
       floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, MyRoute.cartroute),
        backgroundColor: MyTheme.bluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding : Vx.m32,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items?.isNotEmpty == true)
              CatalogList().expand()
              else
             CircularProgressIndicator().centered().py16().expand(),
             
          ],
          ),
        ),
      ),
    );
  }
}




