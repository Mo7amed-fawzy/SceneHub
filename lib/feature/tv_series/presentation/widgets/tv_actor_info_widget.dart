import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvActorInfoWidget extends StatelessWidget {
  const TvActorInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage("https://placehold.co/40x40"),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Actor Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.12.w,
              ),
            ),
            Text(
              'Character Name',
              style: TextStyle(
                color: Color(0xFF92929D),
                fontSize: 10.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.12.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
