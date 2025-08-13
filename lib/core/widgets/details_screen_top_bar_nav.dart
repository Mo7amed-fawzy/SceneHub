import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../utils/app_text_styles.dart';

class DetailsScreenTopBarNav extends StatelessWidget {
  const DetailsScreenTopBarNav({
    super.key,
    required this.title,
    required this.isLoading,
  });
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32.w,
            height: 32.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              color: AppColorsDark.dialogBackground,
            ),
            child: SvgPicture.asset(
              AppStyle.icons.backArrow,
              width: 16.w,
              height: 16.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 270.w,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: CustomTextStyles.montserrat600style16.copyWith(
                color: Colors.white,
                letterSpacing: 0.12,
              ),
            ),
          ),
          Container(
            width: 32.w,
            height: 32.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              color: AppColorsDark.dialogBackground,
            ),
            child: SvgPicture.asset(
              AppStyle.icons.heart,
              width: 16.w,
              height: 16.h,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
