// ignore_for_file: avoid_print

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/product_widget.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
loadData() async{
  await Future.delayed(Duration(seconds: 2));
 final catalogJson =await rootBundle.loadString("assest/files/catalog.json");
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
              Center(
                child: CircularProgressIndicator(),
              )
          ],
          ),
        ),
      ),
    );
  }
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               "Catalog App".text.xl5.bold.color(MyTheme.bluishColor).make(),
               "Trending Products".text.xl2.make(),
          ],
          );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
     itemCount: CatalogModel.items?.length,
     itemBuilder: (context,index){
       final catalog = CatalogModel.items?[index];
       return CatalogItem(catalog: catalog);
     }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, @required this.catalog}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         CatalogImage(
           image: catalog!.Image,
         ),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog!.name.text.lg.bold.color(MyTheme.bluishColor).make(),
            catalog!.desc.text.color(MyTheme.greyColor).make(),
           10.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.all(0),
              alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog!.price}".text.bold.xl2.make(),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder(),
                  )),
                    child: "Buy".text.make()),
                 

                ],
            ).pOnly(right: 12.0),
          ],
         ),
         ),
          ],
          ),
    ).white.roundedLg.square(180).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String? image;

  const CatalogImage({Key? key, @required this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (
          Image.network(image!,)
          .box.rounded.p12.color(MyTheme.creamColor).make().p16().w32(context)
    );
          
  }
}