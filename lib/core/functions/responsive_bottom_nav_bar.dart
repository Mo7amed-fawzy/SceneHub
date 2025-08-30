import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Map<String, double> responsiveBottomNavBar(BoxConstraints constraints) {
  double screenWidth = constraints.maxWidth;

  if (screenWidth >= 1024) {
    // Desktop
    return {
      "height": 90.h,
      "iconSize": 30.sp,
      "selectedFontSize": 16.sp,
      "unselectedFontSize": 15.sp,
    };
  } else if (screenWidth >= 600) {
    // Tablet
    return {
      "height": 80.h,
      "iconSize": 28.sp,
      "selectedFontSize": 14.sp,
      "unselectedFontSize": 13.sp,
    };
  } else {
    // Mobile
    return {
      "height": 65.h,
      "iconSize": 24.sp,
      "selectedFontSize": 12.sp,
      "unselectedFontSize": 11.sp,
    };
  }
}
