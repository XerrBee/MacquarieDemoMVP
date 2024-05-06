import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.black,
    secondary: Colors.grey.withOpacity(0.4),
    onSurface: Colors.black,
    surface: Color(0xFFF5F5F5),
  ),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.white,
    secondary: Colors.grey.withOpacity(0.9),
    onSurface: Colors.black,
    surface: Color(0xFF424242),
  )
);