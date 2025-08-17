import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/feature/auth/presentation/base/base_auth_view.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/sign_in_form.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends BaseAuthView {
  const SignInView({super.key});

  @override
  String get pageTitle => AppStrings.welcomeBack;

  @override
  String? get pageSubtitle => 'Sign in to continue your journey';

  @override
  String? get backgroundImage => 'assets/images/auth_background.jpg';

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Welcome section (if no background image)
          if (backgroundImage == null) ...[
            _buildWelcomeSection(),
            const SizedBox(height: 32),
          ],

          // Sign in form
          const SignInForm(),

          // Navigation links
          const SizedBox(height: 24),
          HaveAnAccountWidget(
            text1: AppStrings.dontHaveAnAccount,
            text2: AppStrings.signUp,
            onTap: () => _navigateToSignUp(context),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      children: [
        const Icon(Icons.lock_outline, size: 64, color: Colors.blue),
        const SizedBox(height: 16),
        Text(
          pageTitle,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        if (pageSubtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            pageSubtitle!,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  void _navigateToSignUp(BuildContext context) {
    presentationManager.navigateToSignUp(context);
  }
}
