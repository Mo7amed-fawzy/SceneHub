import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/play_trailer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvDetailsButtonsWidget extends StatelessWidget {
  const TvDetailsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.w,
      children: [
        const PlayTrailerButton(),
        CircleAvatar(
          backgroundColor: const Color(0xFF252836),
          radius: 24.r,
          child: SvgPicture.asset(
            AppStyle.icons.download,
            width: 24.w,
            height: 24.h,
          ),
        ),
        CircleAvatar(
          backgroundColor: const Color(0xFF252836),
          radius: 24.r,
          child: SvgPicture.asset(
            AppStyle.icons.share,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ],
    );
  }
}
