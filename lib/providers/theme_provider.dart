import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // ✅ start dark mode

  ThemeMode get themeMode => _themeMode;
  bool get isLight => _themeMode == ThemeMode.light;

  void toggleTheme() {
    _themeMode = isLight ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
    scaffoldBackgroundColor: const Color(0xFFF8F4FA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black87,
    ),
    cardTheme: const CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );

  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: const Color(0xFF12121A),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}
