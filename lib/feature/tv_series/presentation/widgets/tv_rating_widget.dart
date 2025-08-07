import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../bloc/tv_series_bloc.dart';

class TvRatingWidget extends StatelessWidget {
  const TvRatingWidget({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: context.watch<TvSeriesBloc>().state is TvSeriesDetailsLoading,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4.w,
          children: [
            SvgPicture.asset(AppStyle.icons.star, width: 16.w, height: 16.h),
            Text(
              '$rating',
              style: CustomTextStyles.montserrat600style12.copyWith(
                color: const Color(0xFFFF8700),
                letterSpacing: 0.12.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
