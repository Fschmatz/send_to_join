import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFEFCF4),
  scaffoldBackgroundColor: const Color(0xFFFEFCF4),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFEFCF4),
    primary: Color(0xff76990b),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xff84ab0c),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFEFCF4),
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Color(0xFFFEFCF4),
    color: Color(0xFFFEFCF4),
  ),
  cardTheme: const CardTheme(
    surfaceTintColor: Color(0xFFEEECE4),
    color: Color(0xFFEEECE4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFE8E8DE),
      focusColor: const Color(0xff76990b),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xff76990b),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE3E4D4),
          ),
          borderRadius: BorderRadius.circular(16.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE3E4D4),
          ),
          borderRadius: BorderRadius.circular(16.0))),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFFFEFCF4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFEFCF4),
    selectedItemColor: Color(0xff76990b),
  ),
  bottomAppBarColor: const Color(0xFFFEFCF4),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFEFCF4),
      indicatorColor: const Color(0xff76990b),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1B1B1D),
  scaffoldBackgroundColor: const Color(0xFF1B1B1D),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF1B1B1D),
    primary: Color(0xFFadd53a),
    onPrimary: Color(0xFFadd53a),
    secondary: Color(0xffb4d74f),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1B1B1D), color: Color(0xFF1B1B1D)),
  cardTheme: const CardTheme(
    surfaceTintColor: Color(0xFF2D2D2F),
    color: Color(0xFF2D2D2F),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF1B1B1D),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF1B1B1D),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2D2D2F),
      focusColor: const Color(0xFFadd53a),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFadd53a),
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2D2D2F),
          ),
          borderRadius: BorderRadius.circular(16.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2D2D2F),
          ),
          borderRadius: BorderRadius.circular(16.0))),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1B1B1D),
  ),
  bottomAppBarColor: const Color(0xFF1B1B1D),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF1B1B1D),
      indicatorColor: const Color(0xFFadd53a),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEA),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
);
