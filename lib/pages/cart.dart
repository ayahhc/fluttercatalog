import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/provider/cart_change_notifier.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatefulWidget {
  // const CartTotal({Key? key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    // final _cart = CartModel();
    
    return Consumer<CartChangeNotifier>(
      builder:(context,cart,child)
      { 
        return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            "\$${cart.totalPrice}".text.xl5.amber500.make(),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: "Buying not supported yet".text.make(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.bluishColor)),
                    child: "BUY".text.white.xl.bold.make())
                .w32(context),
          ],
        ),
      );
      }
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<CartChangeNotifier>(builder:(context, cartChangeNotifier, _) => cartChangeNotifier.cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: cartChangeNotifier.cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    context.read<CartChangeNotifier>().removeItemFromCart(cartChangeNotifier.cart.items[index]);
                    //_cart.remove(_cart.items[index]);
                    //setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              title: cartChangeNotifier.cart.items[index].name.text.make(),
            ),
          ));
  }
}
