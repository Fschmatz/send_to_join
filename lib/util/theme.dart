import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFAFAFA),
  scaffoldBackgroundColor: const Color(0xFFFAFAFA),
  colorScheme: ColorScheme.light(
    background: const Color(0xFFFAFAFA),
    primary: Colors.yellow.shade700,
    onPrimary: const Color(0xFFFFFFFF),
    secondary: Colors.yellow.shade700,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFAFAFA),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFAFAFA),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF000000)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF0F0F0),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF0F0F0),
      focusColor: Colors.yellow.shade700,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.yellow.shade700,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF2F2F2),
          ),
          borderRadius: BorderRadius.circular(12.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF2F2F2),
          ),
          borderRadius: BorderRadius.circular(12.0))),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFFFAFAFA),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xFFFAFAFA),
    selectedItemColor: Colors.yellow.shade700,
  ),
  bottomAppBarColor: const Color(0xFFFAFAFA),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFAFAFA),
      indicatorColor: Colors.yellow.shade700,
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF202022),
  scaffoldBackgroundColor: const Color(0xFF202022),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF202022),
    primary: Color(0xFFe8c74a),
    onPrimary: Color(0xFFe8c74a),
    secondary: Color(0xFFe8c74a),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF202022),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF2D2D2F),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF202022),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF202022),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2D2D2F),
      focusColor: const Color(0xFFe8c74a),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFe8c74a),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2A2A2C),
          ),
          borderRadius: BorderRadius.circular(12.0)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: const Color(0xFF2A2A2C),
          ),
          borderRadius: BorderRadius.circular(12.0))),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF202022),
  ),
  bottomAppBarColor: const Color(0xFF202022),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF202022),
      indicatorColor: const Color(0xFFe8c74a),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEA),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
);
