import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////////
const lightMainColor = Color.fromARGB(255, 255, 244, 247);
const lightSecondaryColor = Color(0xFF220618);
const lightThirdlyColor = Color.fromARGB(255, 224, 224, 224);
///////////////////////////////////////////////////////////////////
const darkMainColor = Color(0xFF0F0F0F);
const darkSecondaryColor = Color(0xFFF2F2F2);
const darkThirdlyColor = Color(0xFF9E9E9E);
///////////////////////////////////////////////////////////////////
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Font1",
  appBarTheme: const AppBarTheme(
    color: lightMainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: lightSecondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  primaryColor: lightMainColor,
  scaffoldBackgroundColor: lightMainColor,
  colorScheme: const ColorScheme.light(
    primary: lightMainColor,
    secondary: lightSecondaryColor,
    tertiary: lightThirdlyColor,
  ),
);
ThemeData darkMode = ThemeData(
  //fontFamily: "NewFont",
  appBarTheme: const AppBarTheme(
    color: darkMainColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: darkSecondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: darkMainColor,
  scaffoldBackgroundColor: darkMainColor,
  colorScheme: const ColorScheme.dark(
    primary: darkMainColor,
    secondary: darkSecondaryColor,
    tertiary: darkThirdlyColor,
  ),
);
