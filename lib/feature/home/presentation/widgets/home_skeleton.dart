import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

ListView buildSkeletonLoading() {
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    children: [
      Skeletonizer(
        child: Container(
          height: 30.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorsDark.primaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
      ),
      SizedBox(height: 12.h),

      Skeletonizer(
        child: Container(
          height: 220.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorsDark.primaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      SizedBox(height: 12.h),

      Skeletonizer(
        child: Container(
          height: 35.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorsDark.primaryColor.withValues(alpha: .3),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      SizedBox(height: 12.h),

      // Small poster grid skeleton
      Skeletonizer(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: AppColorsDark.primaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
            );
          },
        ),
      ),
    ],
  );
}
