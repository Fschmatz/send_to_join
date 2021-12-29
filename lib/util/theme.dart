import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color(0xFFFFFFFF),//0xFFFFFFFF
    canvasColor: const Color(0xFFFFFFFF),
    colorScheme: ColorScheme.light(
      background: const Color(0xFFFFFFFF),
      primary: Colors.green.shade700,
      secondary: Colors.green.shade600,
      secondaryVariant: Colors.green.shade600,
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: IconThemeData(
            color: Color(0xFF050505)
        ),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF000000))),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardTheme: const CardTheme(
      color: Color(0xFFFAFBFB),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green.shade500,
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFFFFFFF),
        focusColor: Colors.green.shade700,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green.shade700,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
            borderRadius: BorderRadius.circular(12.0))),
    bottomAppBarColor: const Color(0xFFFFFFFF),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Colors.green.shade700),
      selectedLabelStyle: TextStyle(color: Colors.green.shade700),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xFFFFFFFF),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFFFFFFFF),
        indicatorColor:  Colors.green.shade700,
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFF050505),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFFFFFFFF)));


ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.light,
    primaryColor: const Color(0xFF1C1C1D),
    scaffoldBackgroundColor: const Color(0xFF1C1C1D),
    canvasColor: const Color(0xFF1C1C1D),
    colorScheme: const ColorScheme.dark(
        background: Color(0xFF1C1C1D),
        primary:  Color(0xFF66BF72),
        secondary: Color(0xFF6fb378),
        secondaryVariant: Color(0xFF66BF72)
    ),
    appBarTheme: const AppBarTheme(
        color: Color(0xFF1C1C1D),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFFCACACA)),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF))),
    cardTheme: const CardTheme(
      color: Color(0xFF2C2C2D),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF1C1C1D),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFF353537),
        focusColor: const Color(0xFF66BF72),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF66BF72),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
            borderRadius: BorderRadius.circular(12.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(color: Color(0xFF66BF72)),
      selectedLabelStyle: TextStyle(color: Color(0xFF66BF72)),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      backgroundColor: Color(0xFF1C1C1D),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF66BF72),
    ),
    navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF1C1C1D),
        indicatorColor: const Color(0xFF66BF72),
        iconTheme: MaterialStateProperty.all(
            const IconThemeData(color: Color(0xFFCACACA),)
        ),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFCACACA), fontWeight: FontWeight.w500))),
    dividerColor: const Color(0x2FFFFFFF),
    bottomAppBarColor: const Color(0xFF1C1C1D),
    bottomSheetTheme:
    const BottomSheetThemeData(modalBackgroundColor: Color(0xFF1C1C1D)));

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}