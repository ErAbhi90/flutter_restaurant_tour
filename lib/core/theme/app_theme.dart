import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: Colors.white, elevation: 1),
  );

  static final ThemeData darkTheme = ThemeData.dark();
}
