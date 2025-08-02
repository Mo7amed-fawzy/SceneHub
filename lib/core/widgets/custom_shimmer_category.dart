import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 164.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.secondaryColor,
            highlightColor: Colors.white,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 164.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.secondaryColor,
            highlightColor: Colors.white,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
