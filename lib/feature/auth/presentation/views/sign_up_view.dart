import 'dart:ui';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  final int _itemsCount = 5; // icon + title + subtitle + form + navigation

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _slideAnimations = List.generate(_itemsCount, (index) {
      final start = index * 0.1;
      final end = start + 0.5;
      return Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    });

    _fadeAnimations = List.generate(_itemsCount, (index) {
      final start = index * 0.1;
      final end = start + 0.5;
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeIn),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedItem(int index, Widget child) {
    return SlideTransition(
      position: _slideAnimations[index],
      child: FadeTransition(opacity: _fadeAnimations[index], child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColorsDark.backgroundColor,
      body: Stack(
        children: [
          // // الخلفية عالية الدقة
          // Positioned.fill(
          //   child: Image.asset(
          //     AppStyle.images.avengers, // أو أي صورة ثانية عالية الجودة
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),

                    // أيقونة الترحيب
                    _animatedItem(
                      0,
                      Icon(
                        Icons.person_add_alt_1_outlined,
                        size: 80,
                        color: AppColorsDark.selectedIcon,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // عنوان الترحيب
                    _animatedItem(
                      1,
                      Text(
                        AppStrings.createAccount,
                        style: CustomTextStyles.montserrat600style24.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // subtitle
                    _animatedItem(
                      2,
                      Text(
                        'Sign up to start your journey',
                        style: CustomTextStyles.montserrat500style14.copyWith(
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // الفورم مع Glassmorphism responsive
                    _animatedItem(
                      3,
                      FractionallySizedBox(
                        widthFactor: screenWidth < 600
                            ? 0.9
                            : screenWidth < 1200
                            ? 0.6
                            : 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                              ),
                              padding: const EdgeInsets.all(24),
                              child: const CustomSignUpForm(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Navigation links
                    _animatedItem(
                      4,
                      HaveAnAccountWidget(
                        text1: AppStrings.alreadyHaveAnAccount,
                        text2: AppStrings.signIn,
                        onTap: () {
                          GoRouter.of(context).go(signInPage);
                        },
                        // text1Style: CustomTextStyles.montserrat500style14
                        //     .copyWith(color: Colors.white70),
                        // text2Style: CustomTextStyles.montserrat600style14
                        //     .copyWith(color: AppColorsDark.selectedIcon),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
