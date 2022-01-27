

import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, @required this.catalog}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(
           tag: Key(catalog!.id.toString()),
           child: CatalogImage(
             image: catalog!.Image,
           ),
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
                  _AddtoCart(catalog:catalog!)
                  // ElevatedButton(onPressed: (){},
                  // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluishColor),
                  // shape: MaterialStateProperty.all(StadiumBorder(),
                  // )),
                  //   child: "Add to cart".text.make()),
                 

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

class _AddtoCart extends StatefulWidget {
  final Item? catalog;

  const _AddtoCart({Key? key,  this.catalog}) : super(key: key);
  // const _AddtoCart({ Key? key }) : super(key: key);

  @override
  State<_AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<_AddtoCart> {
 bool IsinCart = ;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ElevatedButton(onPressed: (){
          IsinCart = IsinCart.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
           _cart.catalog = _catalog;
          _cart.add(widget.catalog!);
          setState(() {});
        },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluIsinCarthColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),
                      )),
                        child: IsinCart?Icon(Icons.done):"Add to cart".text.make()
                        ),
      ],
    );
  }
}