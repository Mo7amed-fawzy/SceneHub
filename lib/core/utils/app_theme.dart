import 'package:flutter/material.dart';

class AppTheme {
  static const _backgroundDark = Color(0xFF1E1E2F);
  static const _purpleAccentDark = Color(0xFF6C63FF);
  static const _skyBlueDark = Color(0xFF00C9FF);
  static const _textColorDark = Color(0xFFF5F5F5);

  static const _backgroundLight = Color(0xFFF5F7FB);
  static const _cardColor = Color(0xFFFFFFFF);
  static const _purpleAccentLight = Color(0xFF6C63FF);
  static const _skyBlueLight = Color(0xFF00C9FF);
  static const _textColorLight = Color(0xFF1E1E2F);

  static ThemeData darkNeoFuturisticTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _backgroundDark,
    primaryColor: _purpleAccentDark,
    colorScheme: const ColorScheme.dark(
      primary: _purpleAccentDark,
      secondary: _skyBlueDark,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _backgroundDark,
      foregroundColor: _textColorDark,
      centerTitle: true,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _textColorDark,
      ),
    ),
    cardColor: const Color(0xFF2C2C3C),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2A2A3A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _skyBlueDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _purpleAccentDark, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _purpleAccentDark,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _skyBlueDark,
        backgroundColor: _skyBlueDark.withValues(alpha: 0.1),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: _textColorDark),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _textColorDark,
      ),
    ),
  );

  static ThemeData lightNeoFuturisticTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _backgroundLight,
    primaryColor: _purpleAccentLight,
    colorScheme: const ColorScheme.light(
      primary: _purpleAccentLight,
      secondary: _skyBlueLight,
      onPrimary: Colors.white,
      surface: _backgroundLight,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _purpleAccentLight,
      foregroundColor: Colors.white,
      elevation: 4,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    cardColor: _cardColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _skyBlueLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _purpleAccentLight, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _purpleAccentLight,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _skyBlueLight,
        backgroundColor: _skyBlueLight.withValues(alpha: 0.1),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: _textColorLight),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _textColorLight,
      ),
    ),
  );
}
