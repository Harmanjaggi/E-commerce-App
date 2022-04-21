import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        buttonColor: darkBluishColor,
        canvasColor: creamColor,
        indicatorColor: Colors.white70,
        accentColor: Colors.red.shade700,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
        brightness: Brightness.light,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.black,
        buttonColor: Colors.blueGrey,
        canvasColor: Colors.white10,
        indicatorColor: Colors.white70,
        accentColor: Colors.red.shade900,
        appBarTheme: AppBarTheme(
          color: Colors.black87,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white70),
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(headline6: TextStyle(color: Colors.white)),
        ),
        brightness: Brightness.dark,
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
}
