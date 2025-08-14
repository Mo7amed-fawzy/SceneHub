import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';

class TvEpisodeDetailsWidget extends StatelessWidget {
  const TvEpisodeDetailsWidget({
    super.key,
    required this.episodeDuration,
    required this.episodeTitle,
    required this.episodeDescription,
    required this.episodeImageUrl,
    required this.episodeNumber,
  });
  final String episodeDuration;
  final String episodeTitle;
  final String episodeDescription;
  final String episodeImageUrl;
  final int episodeNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: AppColorsDark.dialogBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${EndpointConstants.imageBaseUrl}$episodeImageUrl',
                        width: 121.w,
                        height: 83.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SvgPicture.asset(
                      AppStyle.icons.group,
                      width: 121.w,
                      height: 83.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.h,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      '${AppStrings.episode} $episodeNumber',
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.montserrat400style14.copyWith(
                        color: AppColorsDark.dialogText,
                        height: 1.1.h,
                        letterSpacing: 0.12.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      episodeTitle,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.montserrat600style12.copyWith(
                        color: Colors.white,
                        letterSpacing: 0.12.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      episodeDuration,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.montserrat500style12.copyWith(
                        color: AppColorsDark.hashedText,
                        letterSpacing: 0.12.w,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColorsDark.dialogBorder,
                radius: 24.r,
                child: SvgPicture.asset(
                  AppStyle.icons.download2,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Text(
            episodeDescription,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.montserrat400style14.copyWith(
              color: AppColorsDark.dialogText,
              height: 1.1.h,
              letterSpacing: 0.12.w,
            ),
          ),
        ],
      ),
    );
  }
}
