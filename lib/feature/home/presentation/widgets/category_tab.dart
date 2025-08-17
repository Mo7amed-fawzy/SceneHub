import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTab extends StatelessWidget {
  final String text;
  final bool selected;

  const CategoryTab({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        showToast('$text category coming soon!');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          border: selected
              ? Border(
                  bottom: BorderSide(
                    color: AppColorsDark.selectedIcon,
                    width: 2.w,
                  ),
                )
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected
                ? AppColorsDark.selectedIcon
                : AppColorsDark.hashedText,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
