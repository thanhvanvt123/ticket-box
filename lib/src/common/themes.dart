import 'package:flutter/material.dart';

const accent_green = Color(0xFF33AB7B);
const accent_green_tint = Color(0xf0286053);
const dark_background = Color(0xFF1F2E35);
const float_element_color = Color(0xFF30444E);
const secondary_color = Color(0xFF96A7AF);
const dark_green_50percent = Color(0xa0286053);

class MyAppTheme {
  static ThemeData appThemeData() {
    return ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: secondary_color,
        accentColor: accent_green,
        backgroundColor: dark_background,
        textTheme: TextTheme(
          button: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87, fontSize: 16),
            bodyText1: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
            subtitle1: TextStyle(fontSize: 14, color: secondary_color)
        )
    );
  }
}
