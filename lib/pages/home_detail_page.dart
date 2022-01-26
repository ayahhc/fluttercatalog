
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
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
                    child: "Add to cart".text.make()
                    ).wh(120, 50),
                 

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
                      "It is a long established fact when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.".text.color(MyTheme.greyColor).make().p8()
                 ],
               ).py16(),
             )))
          ],
        ),
        
      ),
    );
  }
}