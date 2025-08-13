import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/entities/on_boarding_entity.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.controller,
    required this.data,
    this.onPageChanged,
  });

  final PageController controller;
  final List<OnBoardingEntity> data;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.75.sw,
              height: 0.45.sh,
              child: Image.asset(data[index].imagePath, fit: BoxFit.contain),
            ),
            SizedBox(height: 13.h),
            CustomSmoothPageIndicator(controller: controller),
            SizedBox(height: 13.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                data[index].title,
                key: ValueKey(data[index].title),
                style: CustomTextStyles.poppins400style16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                data[index].subTitle,
                key: ValueKey(data[index].subTitle),
                style: CustomTextStyles.poppins400style14,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
