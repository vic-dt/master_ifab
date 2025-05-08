
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<Color> colorum = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int electusColor;

  AppTheme({this.electusColor=0});

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorum[electusColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserratAlternates(),
      titleMedium: GoogleFonts.montserratAlternates(fontSize: 35),
      bodyLarge: GoogleFonts.montserratAlternates(fontSize: 19),
      bodyMedium: GoogleFonts.russoOne(fontSize: 16),
    )
  );
}
