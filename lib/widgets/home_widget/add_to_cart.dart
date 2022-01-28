
import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/provider/cart_change_notifier.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class AddtoCart extends StatefulWidget {
  final Item? catalog;

  const AddtoCart({Key? key,  this.catalog}) : super(key: key);
  // const _AddtoCart({ Key? key }) : super(key: key);

  @override
  State<AddtoCart> createState() =>_AddtoCartState();
}

class AddtoCartState {
}

class _AddtoCartState extends State<AddtoCart> {
   final _cart = CartModel();
   bool isInCart = false;
  @override
  Widget build(BuildContext context) {
isInCart = _cart.items.contains(widget.catalog);
    return  Column(
      children: [
        ElevatedButton(onPressed: (){
          if(!isInCart){
          isInCart = isInCart.toggle();

         

        context.read<CartChangeNotifier>().addItemInCart(widget.catalog!);
        }
        },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),
                      )),
                        child:Consumer<CartChangeNotifier>(
                          builder:(context, cart, _) {
                            isInCart = cart.cart.items.contains(widget.catalog);
                    return isInCart?Icon(Icons.done):"Add to cart".text.make();
                          }

                        ) 
                        ),
      ],
    );
  }
}