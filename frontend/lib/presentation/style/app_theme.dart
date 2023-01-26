import 'package:flutter/material.dart';

final myAppTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF1E1F24),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1E1F24),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1E1F24),
    onPrimary: Color(0xFF1E1F24),
    secondary: Colors.red,
  ),
  cardTheme: const CardTheme(
    color: Color(0xFF1E1F24),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    ),
  ),
);