import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
        color: const Color(0xFF252836),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                            'https://image.tmdb.org/t/p/w500/$episodeImageUrl',
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
              SizedBox(width: 16.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.h,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      'Episode $episodeNumber',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFFEBEBEF),
                        fontSize: 14.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.12.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      episodeDuration,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF92929D),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.12.w,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: const Color(0xFF1F1D2B),
                radius: 24.r,
                child: SvgPicture.asset(
                  AppStyle.icons.download2,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            episodeDescription,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFFEBEBEF),
              fontSize: 14.sp,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 1.1.h,
              letterSpacing: 0.12.w,
            ),
          ),
        ],
      ),
    );
  }
}
