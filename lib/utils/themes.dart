import 'package:flutter/material.dart';

const accentColor = Color(0xFFF06292);
///////////////////////////////////////////////////////////////////
const lightMainColor = Color(0xFFFFF4F7);
const lightOnPrimaryColor = Color(0xFF0F020A);
const lightNeutralColor = Color(0xFF8D8385);
///////////////////////////////////////////////////////////////////
const darkMainColor = Color(0xFF2f4858);
const darkOnPrimaryColor = Color(0xFFFFF4F7);
const darkNeutralColor = Color(0xFF8D8385);

///////////////////////////////////////////////////////////////////
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Font1",
  primaryColor: lightMainColor,
  drawerTheme: const DrawerThemeData(backgroundColor: lightMainColor),
  scaffoldBackgroundColor: lightMainColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightMainColor,
  ),
  colorScheme: const ColorScheme.light(
    primary: lightMainColor,
    onPrimary: lightOnPrimaryColor,
    tertiary: lightNeutralColor,
    secondary: accentColor,
  ),
);
///////////////////////////////////////////////////////////////
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: "Font1",
  drawerTheme: const DrawerThemeData(backgroundColor: darkMainColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkMainColor,
  ),
  primaryColor: darkMainColor,
  scaffoldBackgroundColor: darkMainColor,
  colorScheme: const ColorScheme.dark(
    primary: darkMainColor,
    onPrimary: darkOnPrimaryColor,
    tertiary: darkNeutralColor,
    secondary: accentColor,
  ),
);
