import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/repository/tv_series_repo.dart';

class PlayTrailerButton extends StatelessWidget {
  const PlayTrailerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await sl<TvSeriesRepo>().getTvSeriesDetails(244808);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF12CDD9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppStyle.icons.play, width: 24.w, height: 24.h),
          SizedBox(width: 8.w),
          Text(
            'Trailer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
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
