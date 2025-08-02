import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTextStyles {
  static final poppins600style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: "Poppins",
  );
  static final poppins400style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryColor,
    fontFamily: "Poppins",
  );
  static final poppins400style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    fontFamily: "Poppins",
  );
  static final poppins500style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: "Poppins",
  );
  static final poppins400style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
    fontFamily: "Poppins",
  );
  static final poppins500style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
    fontFamily: "Poppins",
  );
  static final roboto500style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.tertiaryColor,
    fontFamily: "Roboto",
  );
  static final roboto500style12Selected = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.selectedIcon,
    fontFamily: "Roboto",
  );
  static final montserrat500style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.hashedText,
    fontFamily: "Montserrat",
  );
  static final montserrat600style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.rating,
    fontFamily: "Montserrat",
  );
  static final montserrat600style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.titles,
    fontFamily: "Montserrat",
  );
}
