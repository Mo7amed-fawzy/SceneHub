import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // مدير للصفحات
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.secondaryColor,
        dotHeight: 7,
        dotWidth: 10,
      ),
    );
  }
}
