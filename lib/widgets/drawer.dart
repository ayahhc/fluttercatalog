import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Imageurl ="https://p.imgci.com/db/PICTURES/CMS/323000/323036.square.png";
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text("CHHAYA SINGH"),
               accountEmail: Text("chhaya@gmail.com"),
               currentAccountPicture:CircleAvatar(backgroundImage: NetworkImage(Imageurl)),
               ),
               ListTile(
                 leading: Icon(CupertinoIcons.home,
                  color: Colors.white,
                 ),
                 title: Text(
                   "Home",
                   textScaleFactor: 1.3,
                 style: TextStyle(
                   color: Colors.white,
                  
                 ),
                 ),
                
               ),
               ListTile(
                 leading:Icon(CupertinoIcons.lightbulb,
                 color: Colors.white,
                 ),

                 title: Text("About us",
                 textScaleFactor: 1.3,
                 style: TextStyle(
                   color: Colors.white,
                 ),
                 ),
               ),
                 ListTile(
                 leading:Icon(CupertinoIcons.mail,
                 color: Colors.white,
                 ),

                 title: Text("Email",
                 textScaleFactor: 1.3,
                 style: TextStyle(
                   color: Colors.white,
                 ),
                 ),
               ),
                ListTile(
                 leading:Icon(CupertinoIcons.person_crop_circle_badge_checkmark,
                 color: Colors.white,
                 ),

                 title: Text("Contact us",
                 textScaleFactor: 1.3,
                 style: TextStyle(
                   color: Colors.white,
                 ),
                 ),
               ),
        ],),
      ),
    );
  }
}