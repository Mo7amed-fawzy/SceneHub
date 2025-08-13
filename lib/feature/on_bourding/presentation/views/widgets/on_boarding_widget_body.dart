import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/on_bourding/data/models/on_boarding_model.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/custom_smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.controler,
    this.onPageChanged,
  });

  final PageController controler;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: onPageChanged,
      physics: const BouncingScrollPhysics(),
      controller: controler,
      itemCount: onBoardingData.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.75.sw,
              height: 0.45.sh,
              child: Image.asset(
                onBoardingData[index].imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 13.h),
            CustomSmoothPageIndicator(controller: controler),
            SizedBox(height: 13.h),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                onBoardingData[index].title,
                key: ValueKey(onBoardingData[index].title),
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
                onBoardingData[index].subTitle,
                key: ValueKey(onBoardingData[index].subTitle),
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
