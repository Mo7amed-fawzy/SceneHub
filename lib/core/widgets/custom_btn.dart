import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.color,
    this.text = '',
    this.onPressed,
    this.customWidget,
  });

  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // show customWidget if found and if not show and last
        child:
            customWidget ??
            Text(
              text,
              style: CustomTextStyles.poppins600style18.copyWith(
                color: AppColors.save,
              ),
            ),
      ),
    );
  }
}
