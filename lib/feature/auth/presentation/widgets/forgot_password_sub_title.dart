import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Text(
        "Enter your registered email below to receive password reset instructions",
        style: TextStyle(
          color: AppColorsDark.hashedText,
          fontSize: 14,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
