
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
 
 class CartModel {
 //working code but not needed of singleton

// static final cartModel = CartModel._internal();
// CartModel._internal();
// factory CartModel() => cartModel; 

   //catalog fields
   CatalogModel? _catalog;

   //collectiomn if ID's
   final List<int> _ItemIds =[]; 

   //get catalog
   CatalogModel get catalog => _catalog!;

   //set catalog
   set catalog(CatalogModel? newCatalog){
     _catalog = newCatalog;
   }


   //get items into the cart
   List<Item> get items=> _ItemIds.map((id) => _catalog!.getById(id)).toList();

   //get total price
   num get TotalPrice =>
   items.fold(0, (total, current) => total +current.price);

   //add item in cart
   void add(Item item) {
     _ItemIds.add(item.id);
   }

    //remove item in cart
   void remove(Item item){
     _ItemIds.remove(item.id);
   }


 }