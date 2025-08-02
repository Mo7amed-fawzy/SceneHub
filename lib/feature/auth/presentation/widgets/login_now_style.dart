import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class LoginNowStyle extends StatelessWidget {
  const LoginNowStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        AppStrings.loginNow,
        style: CustomTextStyles.poppins400style14.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
