import 'package:flutter/material.dart';

int responsiveGridCount(BoxConstraints constraints) {
  double screenWidth = constraints.maxWidth;

  if (screenWidth >= 1200) return 7; // Desktop Large
  if (screenWidth >= 1000) return 6; // Desktop
  if (screenWidth >= 800) return 5; // Tablet
  if (screenWidth >= 600) return 4; // Large phone
  return 3; // Small phone
}
