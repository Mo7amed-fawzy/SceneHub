import 'package:ai_movie_app/core/database/cache/cache_helper.dart';
import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/functions/print_statement.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    checkFirstVisitOrNot(
      context,
      'isOnBoardingVisited',
      signInPage,
      toOnbourding,
    );
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

void checkFirstVisitOrNot(
  BuildContext context,
  String key,
  String ifFirstContinue,
  String ifNoTToOnBoarding,
) {
  bool isVisited = getIt<CacheHelper>().getData(key: key) ?? false;

  Future.delayed(const Duration(seconds: 2), () async {
    if (!context.mounted) return;

    final user = Supabase.instance.client.auth.currentUser;
    printHere('Supabase User: $user');

    if (isVisited) {
      if (user != null) {
        checkEmailVerifiedOrNotSupabase(context, homeNavBar, signInPage);
      } else {
        customReplacementNavigate(context, signInPage);
      }
    } else {
      customReplacementNavigate(context, ifNoTToOnBoarding);
    }
  });
}

void checkEmailVerifiedOrNotSupabase(
  BuildContext context,
  String home,
  String signIn,
) {
  final user = Supabase.instance.client.auth.currentUser;

  if (user != null) {
    customReplacementNavigate(context, home);
  } else {
    customReplacementNavigate(context, signIn);
  }
}

// void checkEmailVerifiedOrNot(
//     BuildContext context, String homePage, String signInPage) {
//   FirebaseAuth.instance.currentUser?.emailVerified == false
//       ? customReplacementNavigate(context, signInPage)
//       : customReplacementNavigate(context, homePage);
// }
