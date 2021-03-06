import 'package:catalog_app/pages/home.dart';
import 'package:catalog_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
       primarySwatch: Colors.green,
     fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.light,
      ),


    // routes
  initialRoute: "/",
    routes: {
      "/":(context)=>Login(),
    "/home" : (context) => Home()
    
    }
    );
  }
}
