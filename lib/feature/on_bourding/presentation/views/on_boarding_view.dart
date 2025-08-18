import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/get_buttons.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBourdingView extends StatelessWidget {
  OnBourdingView({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    context.read<OnBoardingCubit>().loadOnBoardingData();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorsDark.backgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 25.h),

              CustomNavBar(
                onTap: () {
                  context.read<OnBoardingCubit>().completeOnBoarding();
                  customReplacementNavigate(context, RouterPath.signUpPage);
                },
              ),

              SizedBox(height: 10.h),

              Expanded(
                child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  builder: (context, state) {
                    if (state is OnBoardingLoaded) {
                      return OnBoardingBody(
                        onPageChanged: (index) {
                          _currentIndex.value = index;
                        },
                        controller: _pageController,
                        data: state.data,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),

              SizedBox(height: 40.h),

              ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, index, _) {
                  return GetButtons(
                    currentIndex: index,
                    pageController: _pageController,
                  );
                },
              ),

              SizedBox(height: 17.h),
            ],
          ),
        ),
      ),
    );
  }
}
