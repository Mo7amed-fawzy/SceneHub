import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/functions/if_on_boarding.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/get_buttons.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 25),
              CustomNavBar(
                onTap: () {
                  obBoardingVisited();
                  customReplacementNavigate(context, signUpPage);
                },
              ),
              OnBoardingBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controler: _pageController,
              ),
              const SizedBox(height: 88),
              GetButtons(
                currentIndex: currentIndex,
                pageController: _pageController,
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
