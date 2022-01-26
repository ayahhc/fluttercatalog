import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData LightTheme(BuildContext context) => ThemeData(
       primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.light,
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),

        appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
          
          
        )
      );





       static ThemeData darkTheme(BuildContext context) => ThemeData(      
            primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        brightness: Brightness.light,
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),

        appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
          
          
        ),
      );

      //color
      static final creamColor = Color(0xfff5f5f5);
      static final bluishColor = Color(0xff403b58);
      static final greyColor = Color(0xFF757575);
}