import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/play_trailer_button.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_cast_and_crew_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_episode_details_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_rating_widget.dart';
import 'package:ai_movie_app/feature/tv_series/presentation/widgets/tv_info_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TvSeriesDetailsScreen extends StatelessWidget {
  const TvSeriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Opacity(
                  opacity: 0.24,
                  child: Container(
                    height: 450.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppStyle.images.avengers),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 450.h,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.50, 0.00),
                      end: Alignment(0.50, 1.00),
                      colors: [Color(0x911F1D2B), Color(0xFF1F1D2B)],
                    ),
                  ),
                ),
                Positioned(
                  left: 95.w,
                  top: 80.h,
                  child: Container(
                    width: 190.w,
                    height: 270.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppStyle.images.avengers),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50.w,
                  bottom: 50.h,
                  child: const TvInfoNavWidget(),
                ),
                Positioned(
                  left: 165.w,
                  bottom: 25.h,
                  child: const TvRatingWidget(),
                ),
                Positioned(
                  top: 40.h,
                  left: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: const Color(0xFF252836),
                        ),
                        child: SvgPicture.asset(
                          AppStyle.icons.backArrow,
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 270.w,
                        child: Text(
                          'Riverdale',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ),
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: const Color(0xFF252836),
                        ),
                        child: SvgPicture.asset(
                          AppStyle.icons.heart,
                          width: 16.w,
                          height: 16.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  Row(
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
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Story Line',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12.w,
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
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Cast and Crew',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.12.w,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      const TvCastAndCrewWidget(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Episode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.12.w,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Season 2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.12.w,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      SvgPicture.asset(
                        AppStyle.icons.downArrow,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: const TvEpisodeDetailsWidget(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
