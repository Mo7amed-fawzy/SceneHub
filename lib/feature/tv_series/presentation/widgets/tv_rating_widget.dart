import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvRatingWidget extends StatelessWidget {
  const TvRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4.w,
        children: [
          SvgPicture.asset(AppStyle.icons.star, width: 16.w, height: 16.h),
          Text(
            '4.5',
            style: TextStyle(
              color: const Color(0xFFFF8700),
              fontSize: 12.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12.w,
            ),
          ),
        ],
      ),
    );
  }
}
