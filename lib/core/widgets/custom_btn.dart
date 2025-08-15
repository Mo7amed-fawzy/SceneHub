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
    this.textStyle,
  });

  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final Widget? customWidget;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColorsDark.primaryColor, // صح
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child:
            customWidget ??
            Text(
              text,
              style:
                  textStyle ??
                  CustomTextStyles.poppins600style18.copyWith(
                    color: AppColorsDark.save,
                  ),
            ),
      ),
    );
  }
}
