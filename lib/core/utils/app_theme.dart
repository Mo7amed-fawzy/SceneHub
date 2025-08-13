import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData darkNeoFuturisticTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsDark.backgroundColor,
    primaryColor: AppColorsDark.primaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColorsDark.selectedIcon,
      secondary: AppColorsDark.trailerButton,
      onPrimary: AppColorsDark.text,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDark.backgroundColor,
      foregroundColor: AppColorsDark.text,
      centerTitle: true,
      elevation: 4,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColorsDark.text,
      ),
    ),
    cardColor: AppColorsDark.secondaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsDark.secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsDark.trailerButton),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsDark.selectedIcon, width: 2),
      ),
      hintStyle: TextStyle(color: AppColorsDark.hashedText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsDark.selectedIcon,
        foregroundColor: AppColorsDark.text,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsDark.trailerButton,
        backgroundColor: AppColorsDark.trailerButton.withValues(alpha: 0.1),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: AppColorsDark.text),
      bodyMedium: TextStyle(fontSize: 14, color: AppColorsDark.hashedText),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColorsDark.text,
      ),
    ),
  );

  static ThemeData lightNeoFuturisticTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsLight.backgroundColor,
    primaryColor: AppColorsLight.primaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColorsLight.selectedIcon,
      secondary: AppColorsLight.trailerButton,
      onPrimary: AppColorsLight.text,
      surface: AppColorsLight.backgroundColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLight.primaryColor,
      foregroundColor: AppColorsLight.text,
      elevation: 4,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColorsLight.text,
      ),
    ),
    cardColor: AppColorsLight.secondaryColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsLight.secondaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsLight.trailerButton),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsLight.selectedIcon, width: 2),
      ),
      hintStyle: TextStyle(color: AppColorsLight.hashedText),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.selectedIcon,
        foregroundColor: AppColorsLight.text,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsLight.trailerButton,
        backgroundColor: AppColorsLight.trailerButton.withValues(alpha: 0.1),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: AppColorsLight.text),
      bodyMedium: TextStyle(fontSize: 14, color: AppColorsLight.hashedText),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColorsLight.text,
      ),
    ),
  );
}
