import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvInfoNavWidget extends StatelessWidget {
  const TvInfoNavWidget({
    super.key,
    required this.year,
    required this.duration,
    required this.genre,
  });
  final String? year;
  final String? duration;
  final String? genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppStyle.icons.calendar, width: 16.w, height: 16.h),
          SizedBox(width: 4.w),
          Text(
            year ?? 'N/A',
            style: TextStyle(
              color: const Color(0xFF92929D),
              fontSize: 12.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12.w,
            ),
          ),
          SizedBox(width: 12.w),
          SvgPicture.asset(AppStyle.icons.vector),
          SizedBox(width: 12.w),
          SvgPicture.asset(AppStyle.icons.clock, width: 16.w, height: 16.h),
          SizedBox(width: 4.w),
          Text(
            duration ?? 'N/A',
            style: TextStyle(
              color: const Color(0xFF92929D),
              fontSize: 12.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12.w,
            ),
          ),
          SizedBox(width: 12.w),
          SvgPicture.asset(AppStyle.icons.vector),
          SizedBox(width: 12.w),
          SvgPicture.asset(AppStyle.icons.film, width: 16.w, height: 16.h),
          SizedBox(width: 4.w),
          Text(
            genre ?? 'N/A',
            style: TextStyle(
              color: const Color(0xFF92929D),
              fontSize: 12.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.12.w,
            ),
          ),
        ],
      ),
    );
  }
}
