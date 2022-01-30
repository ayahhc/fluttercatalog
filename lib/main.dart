import 'package:catalog_app/pages/cart.dart';
import 'package:catalog_app/pages/home.dart';
import 'package:catalog_app/pages/login.dart';
import 'package:catalog_app/provider/cart_change_notifier.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartChangeNotifier(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // home: Home(),
        themeMode: ThemeMode.system,
        theme: MyTheme.LightTheme(context),
        darkTheme: MyTheme.darkTheme(context),

        // routes
        initialRoute: "/login",
        routes: {
          MyRoute.loginroute: (context) => Login(),
          MyRoute.homeroute: (context) => Home(),
          MyRoute.cartroute: (context) => CartPage()
        });
  }
}
