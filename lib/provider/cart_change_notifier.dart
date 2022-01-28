import 'package:catalog_app/models/cart_page.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/cart.dart';
import 'package:flutter/widgets.dart';

class CartChangeNotifier extends ChangeNotifier {
final _catalog = CatalogModel();
 final cart = CartModel();
 double totalPrice = 0;

 void addItemInCart(Item catalog) {
   cart.catalog = _catalog;
    cart.add(catalog);
   totalPrice  =totalPrice + catalog.price;
    notifyListeners();
 }


 void removeItemFromCart(Item catalog) {
  cart.catalog = _catalog;
    cart.remove(catalog);

// remove price from cart
totalPrice = totalPrice - catalog.price;

  notifyListeners();
 }
bool checkInCart(Item catalog){
  return cart.contains(catalog);
}




}