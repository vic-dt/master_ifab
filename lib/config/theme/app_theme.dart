
import 'package:flutter/material.dart';

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
    colorSchemeSeed: colorum[electusColor]
  );
}
