import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';

class AITypingIndicator extends StatelessWidget {
  const AITypingIndicator({super.key, this.dotSize = 8.0, this.spacing = 4.0});

  final double dotSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 1),
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
          builder: (context, value, child) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: AppColorsDark.selectedIcon.withOpacity(1),
                shape: BoxShape.circle,
              ),
            );
          },
          onEnd: () {},
        );
      }),
    );
  }
}
