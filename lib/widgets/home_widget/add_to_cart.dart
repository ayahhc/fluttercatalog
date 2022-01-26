
import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  final Item? catalog;

  const AddtoCart({Key? key,  this.catalog}) : super(key: key);
  // const AddtoCart({ Key? key }) : super(key: key);

  @override
  State<AddtoCart> createState() => AddtoCartState();
}

class AddtoCartState extends State<AddtoCart> {
   final _cart = CartModel();


  @override
  Widget build(BuildContext context) {
     bool IsinCart =_cart.items.contains(widget.catalog) ?? false;
    return  Column(
      children: [
        ElevatedButton(onPressed: (){
          if(!IsinCart){
          IsinCart = IsinCart.toggle();
          final _catalog = CatalogModel();
           _cart.catalog = _catalog;
          _cart.add(widget.catalog!);
          setState(() {});
        }
        },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),
                      )),
                        child: IsinCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus)
                        ),
      ],
    );
  }
}