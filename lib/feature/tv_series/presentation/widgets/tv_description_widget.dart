import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../bloc/tv_series_bloc.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: context.watch<TvSeriesBloc>().state is TvSeriesDetailsLoading,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10.h,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Story Line',
              style: CustomTextStyles.montserrat600style16.copyWith(
                color: Colors.white,
                letterSpacing: 0.12.w,
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: CustomTextStyles.montserrat400style14.copyWith(
                    color: const Color(0xFFEBEBEF),
                  ),
                ),
                TextSpan(
                  text: 'More',
                  style: CustomTextStyles.montserrat600style14.copyWith(
                    color: AppColors.trailerButton,
                    letterSpacing: 0.12.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
