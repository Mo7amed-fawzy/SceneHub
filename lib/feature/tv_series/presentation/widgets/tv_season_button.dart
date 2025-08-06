import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvSeasonButton extends StatelessWidget {
  const TvSeasonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Season 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12.w,
          ),
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () => {},
          child: SvgPicture.asset(
            AppStyle.icons.downArrow,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
