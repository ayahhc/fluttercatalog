import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      drawer: Drawer(),
      body:Center(
         child: Container(
            child:Text("hello i am text here"),
         ),
      ),
    );
  }

} 