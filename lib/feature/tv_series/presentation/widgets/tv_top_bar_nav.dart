import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvTopBarNav extends StatelessWidget {
  const TvTopBarNav({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 32.w,
          height: 32.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color(0xFF252836),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12,
            ),
          ),
        ),
        Container(
          width: 32.w,
          height: 32.h,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: const Color(0xFF252836),
          ),
          child: SvgPicture.asset(
            AppStyle.icons.heart,
            width: 16.w,
            height: 16.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
