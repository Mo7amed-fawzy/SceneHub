import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../bloc/tv_series_bloc.dart';

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
    return Skeletonizer(
      enabled: context.watch<TvSeriesBloc>().state is TvSeriesDetailsLoading,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppStyle.icons.calendar,
              width: 16.w,
              height: 16.h,
            ),
            4.horizontalSpace,
            Text(
              year ?? 'N/A',
              style: CustomTextStyles.montserrat500style12.copyWith(
                color: const Color(0xFF92929D),
                letterSpacing: 0.12.w,
              ),
            ),
            12.horizontalSpace,
            SvgPicture.asset(AppStyle.icons.vector),
            12.horizontalSpace,
            SvgPicture.asset(AppStyle.icons.clock, width: 16.w, height: 16.h),
            4.horizontalSpace,
            Text(
              duration ?? 'N/A',
              style: CustomTextStyles.montserrat500style12.copyWith(
                color: const Color(0xFF92929D),
                letterSpacing: 0.12.w,
              ),
            ),
            12.horizontalSpace,
            SvgPicture.asset(AppStyle.icons.vector),
            12.horizontalSpace,
            SvgPicture.asset(AppStyle.icons.film, width: 16.w, height: 16.h),
            4.horizontalSpace,
            Text(
              genre ?? 'N/A',
              style: CustomTextStyles.montserrat500style12.copyWith(
                color: const Color(0xFF92929D),
                letterSpacing: 0.12.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
