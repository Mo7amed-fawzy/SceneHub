import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswrodImage extends StatelessWidget {
  const ForgotPasswrodImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 235,
      child: Image.asset(AppStyle.images.forgotPassword),
    );
  }
}
