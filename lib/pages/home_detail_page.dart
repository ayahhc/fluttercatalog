
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart'; 

class HomeDetail extends StatelessWidget {
 final Item? catalog;

  const HomeDetail({Key? key, @required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:   ButtonBar(
              buttonPadding: EdgeInsets.all(0),
              alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog!.price}".text.bold.xl4.red800.make(),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.bluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder(),
                  )),
                    child: "Buy".text.make()
                    ).wh(100, 50),
                 

                ],
            ).p32().pOnly(right: 12.0),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id.toString()),
              child: Image.network(catalog!.Image).p16(),
            ).h32(context),
            Expanded(child: VxArc(
              height: 10.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
             child: Container(
               color: Colors.white,
               width: context.screenWidth,
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                     catalog!.name.text.lg.bold.xl3.color(MyTheme.bluishColor).make(),
                      catalog!.desc.text.xl.color(MyTheme.greyColor).make().p16(),
                 ],
               ).py64(),
             )))
          ],
        ),
        
      ),
    );
  }
}