import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/functions/calculate_grid_count.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/cards.dart';
import 'package:ai_movie_app/feature/home/presentation/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // Header + Search
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you want to watch?",
                  style: CustomTextStyles.poppins600style18.copyWith(
                    color: AppColorsDark.text,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    showToast("Search feature coming soon!");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColorsDark.secondaryColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColorsDark.hashedText,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: AppColorsDark.hashedText,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Big posters horizontal list
          SizedBox(
            height: 220.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                interactiveBigPoster(AppStyle.images.frame1),
                interactiveBigPoster(AppStyle.images.frame2),
                interactiveBigPoster(AppStyle.images.frame3),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Tabs
          SizedBox(
            height: 35.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: const [
                CategoryTab(text: "Now playing", selected: true),
                CategoryTab(text: "Upcoming"),
                CategoryTab(text: "Top rated"),
                CategoryTab(text: "Popular"),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Small posters grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = responsiveGridCount(constraints);

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 0.65,
                  children: [
                    interactiveSmallPoster(AppStyle.images.details1),
                    interactiveSmallPoster(AppStyle.images.details2),
                    interactiveSmallPoster(AppStyle.images.details3),
                    interactiveSmallPoster(AppStyle.images.homeIconActive),
                    interactiveSmallPoster(AppStyle.images.forgotPassword),
                    interactiveSmallPoster(AppStyle.images.onBoarding),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
