import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'app_text_styles.dart';

class DetailsScreenRatingWidget extends StatelessWidget {
  const DetailsScreenRatingWidget({
    super.key,
    required this.rating,
    required this.isLoading,
  });
  final double rating;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4.w,
          children: [
            SvgPicture.asset(AppStyle.icons.star, width: 16.w, height: 16.h),
            Text(
              '$rating',
              style: CustomTextStyles.montserrat600style12.copyWith(
                color: AppColorsDark.rating,
                letterSpacing: 0.12.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
