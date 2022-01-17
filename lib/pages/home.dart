import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      drawer: MyDrawer(),
      body:Center(
         child: Container(
            child:Text("hello i am text here"),
         ),
      ),
    );
  }

} 