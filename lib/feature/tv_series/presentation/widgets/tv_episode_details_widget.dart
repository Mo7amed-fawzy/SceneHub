import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvEpisodeDetailsWidget extends StatelessWidget {
  const TvEpisodeDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: const Color(0xFF252836),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        AppStyle.images.avengers,
                        width: 123.w,
                        height: 85.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SvgPicture.asset(
                      AppStyle.icons.group,
                      width: 121.w,
                      height: 83.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1h30m',
                    style: TextStyle(
                      color: const Color(0xFF92929D),
                      fontSize: 12.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.12.w,
                    ),
                  ),
                  Text(
                    'Episode 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12.w,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: const Color(0xFF1F1D2B),
                radius: 24.r,
                child: SvgPicture.asset(
                  AppStyle.icons.download2,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Football player who longs to write his own music. It’s not all smiles for this hunk though after he gets involved with his music teacher.',
            style: TextStyle(
              color: const Color(0xFFEBEBEF),
              fontSize: 14.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 1.1.h,
              letterSpacing: 0.12.w,
            ),
          ),
        ],
      ),
    );
  }
}
