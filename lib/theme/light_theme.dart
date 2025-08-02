import 'package:flutter/material.dart';

ThemeData light = ThemeData(

 // brightness: Brightness.dark,
  primaryColor: const Color(0xFFf9763b),
  secondaryHeaderColor: const Color(0xFFffb43a),
  cardColor: Colors.white,
  canvasColor: const Color(0xffffffff),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFBFACE2),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF3E54AC),
    secondary: Color(0xFF655DBB),
  )
      .copyWith(background: const Color(0xffffffff))
      .copyWith(error: const Color(0xFFE84D4F)),
);
