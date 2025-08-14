import 'package:flutter/material.dart';

/// dark theme
abstract class AppColorsDark {
  static Color primaryColor = const Color(0xFF242A32);
  static Color secondaryColor = const Color(0xFF3A3F47);
  static Color tertiaryColor = const Color(0xFF67686D);
  static Color text = const Color(0xFFFFFFFF);
  static Color save = const Color(0xFFEEEEEE);
  static Color titles = const Color(0xFFECECEC);
  static Color selectedIcon = const Color(0xFF0296E5);
  static Color hashedText = const Color(0xFF92929D);
  static Color rating = const Color(0xFFFF8700);
  static Color trailerButton = const Color(0xFF12CDD9);
  static Color dialogBackground = const Color(0xFF252836);
  static Color dialogText = const Color(0xFFEBEBEF);
  static Color dialogBorder = const Color(0xFF1F1D2B);
  static List<Color> gradientColors = const [
    Color(0x911F1D2B),
    Color(0xFF1F1D2B),
  ];
  static Color disabled = const Color(0xFF696974);
  static Color backgroundColor = const Color(0xFF1F1D2B);
}

/// light theme
abstract class AppColorsLight {
  static Color primaryColor = const Color(0xFFF5F7FB);
  static Color secondaryColor = const Color(0xFFE4E6EB);
  static Color tertiaryColor = const Color(0xFFB0B3B8);
  static Color text = const Color(0xFF1E1E2F);
  static Color save = const Color(0xFF4A4A4A);
  static Color titles = const Color(0xFF2E2E3E);
  static Color selectedIcon = const Color(0xFF0296E5);
  static Color hashedText = const Color(0xFF6D6D78);
  static Color rating = const Color(0xFFFF8700);
  static Color trailerButton = const Color(0xFF12CDD9);
  static Color dialogBackground = const Color(0xFFFFFFFF);
  static Color dialogText = const Color(0xFF1E1E2F);
  static Color dialogBorder = const Color(0xFFDADCE0);
  static List<Color> gradientColors = const [
    Color(0x33FFFFFF),
    Color(0xFFFFFFFF),
  ];
  static Color disabled = const Color(0xFFC0C0C0);
  static Color backgroundColor = const Color(0xFFFFFFFF);
}
