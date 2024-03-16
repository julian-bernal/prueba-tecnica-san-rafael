import 'package:flutter/material.dart';

class ThemeConstants {
  
  var ligthTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff582C5F),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lobster',
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff582C5F),
      secondary: Color(0xff1D9CD8)
    ),
    textTheme: const TextTheme(
    )
  );


  var darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF232223),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xff1D9CD8),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lobster',
      ),
      
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff1D9CD8),
      secondary: Color(0xff582C5F),

    ),
  );

}