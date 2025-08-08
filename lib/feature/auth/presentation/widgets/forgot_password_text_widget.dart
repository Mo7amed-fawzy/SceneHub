import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
// ignore: library_prefixes
import 'package:ai_movie_app/core/routes/app_router.dart' as AppStrings;
import 'package:ai_movie_app/core/utils/app_text_styles.dart';

import 'package:flutter/material.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigate(context, forgotPassword);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins600style18.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
