import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:ai_movie_app/feature/splash/domain/use_case/decide_start_destination_usecase.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateAfterSplash();
  }

  Future<void> _navigateAfterSplash() async {
    final nextRoute = await sl<DecideStartDestinationUseCase>()();
    if (!mounted) return;
    customReplacementNavigate(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.poppins600style18,
        ),
      ),
    );
  }
}
