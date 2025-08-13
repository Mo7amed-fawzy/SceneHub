import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/widgets/play_trailer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreenButtonsWidget extends StatelessWidget {
  const DetailsScreenButtonsWidget({super.key, this.buttonColor, this.text});
  final Color? buttonColor;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16.w,
      children: [
        PlayTrailerButton(
          buttonColor: buttonColor ?? AppColorsDark.trailerButton,
          text: text,
        ),
        CircleAvatar(
          backgroundColor: AppColorsDark.dialogBackground,
          radius: 24.r,
          child: SvgPicture.asset(
            buttonColor == null
                ? AppStyle.icons.download
                : AppStyle.icons.download2,
            width: 24.w,
            height: 24.h,
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColorsDark.dialogBackground,
          radius: 24.r,
          child: SvgPicture.asset(
            AppStyle.icons.share,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ],
    );
  }
}
