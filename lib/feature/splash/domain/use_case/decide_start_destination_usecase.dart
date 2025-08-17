import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/feature/splash/domain/repositories/splash_auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DecideStartDestinationUseCase {
  final AppPreferences appPreferences;
  final SplashAuthRepository authRepository;

  DecideStartDestinationUseCase({
    required this.appPreferences,
    required this.authRepository,
  });

  Future<String> call() async {
    final isVisited = appPreferences.getData('isOnBoardingVisited') ?? false;
    final user = authRepository.getCurrentUser();

    return _decideNextRoute(isVisited, user);
  }

  String _decideNextRoute(bool isVisited, User? user) {
    if (isVisited) {
      return user != null ? homeNavBar : signInPage;
    } else {
      return toOnbourding;
    }
  }
}
