import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 10.h,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Story Line',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.12.w,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    'Originally a story from Archie Comics which started in 1941, Riverdale centres around a group of high school students who are shocked by the death of classmate, Jason Blossom. Together theyunravel the secrets of Riverdale and who ',
                style: TextStyle(
                  color: const Color(0xFFEBEBEF),
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.12.w,
                ),
              ),
              TextSpan(
                text: 'More',
                style: TextStyle(
                  color: const Color(0xFF12CDD9),
                  fontSize: 14.sp,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.12.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
