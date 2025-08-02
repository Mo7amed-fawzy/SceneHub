import 'package:ai_movie_app/core/routes/app_router.dart' as AppStrings;
import 'package:ai_movie_app/feature/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/forgot_password_image.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/forgot_password_sub_title.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPassword),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswrodImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    );
  }
}
