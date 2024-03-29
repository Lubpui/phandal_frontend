// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.uiColor]) => OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 3),
        borderRadius: BorderRadius.circular(15),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: AppPallete.appBarColor,
    ),
    searchBarTheme: SearchBarThemeData(),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: _border(AppPallete.transparentColor),
      focusedBorder: _border(AppPallete.transparentColor),
    ),
  );
}
