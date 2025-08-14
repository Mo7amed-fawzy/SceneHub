import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/custom_btn.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/login_now_style.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        if (state is OnBoardingLoaded) {
          final totalPages = state.data.length;

          if (currentIndex == totalPages - 1) {
            return Column(
              children: [
                CustomBtn(
                  text: AppStrings.createAccount,
                  onPressed: () {
                    context.read<OnBoardingCubit>().completeOnBoarding();
                    customReplacementNavigate(context, signUpPage);
                  },
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    context.read<OnBoardingCubit>().completeOnBoarding();
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
        return const SizedBox.shrink();
      },
    );
  }
}
