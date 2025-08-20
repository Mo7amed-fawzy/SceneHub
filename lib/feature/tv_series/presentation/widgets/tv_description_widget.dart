import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class TvDescriptionWidget extends StatelessWidget {
  const TvDescriptionWidget({
    super.key,
    required this.description,
    required this.isLoading,
  });
  final String description;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10.h,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.storyLine,
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
                  text: description == ''
                      ? AppStrings.noDescriptionAvailable
                      : description,
                  style: CustomTextStyles.montserrat400style14.copyWith(
                    color: AppColorsDark.dialogText,
                  ),
                ),
                description == ''
                    ? const TextSpan()
                    : TextSpan(
                        text: AppStrings.more,
                        style: CustomTextStyles.montserrat600style14.copyWith(
                          color: AppColorsDark.trailerButton,
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
