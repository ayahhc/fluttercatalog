import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart.dart';
import 'package:catalog_app/pages/home.dart';
import 'package:catalog_app/pages/login.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      themeMode: ThemeMode.system,
      theme:MyTheme.LightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

    // routes
  initialRoute: "/home",
    routes: {
      MyRoute.loginroute:(context)=>Login(),
      MyRoute.homeroute : (context) => Home(),
      MyRoute.cartroute : (context) => CartPage()
    
    }
    );
  }
}
