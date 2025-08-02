import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/custom_btn.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/login_now_style.dart';
import 'package:ai_movie_app/feature/on_bourding/data/models/on_boarding_model.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/functions/if_on_boarding.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            onPressed: () {
              obBoardingVisited();
              customReplacementNavigate(context, signUpPage);
            },
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              obBoardingVisited();
              customReplacementNavigate(context, signInPage);
            },
            child: const LoginNowStyle(),
          ),
        ],
      );
    } else {
      return CustomBtn(
        onPressed: () {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceIn,
          );
        },
        text: AppStrings.next,
      );
    }
  }
}
