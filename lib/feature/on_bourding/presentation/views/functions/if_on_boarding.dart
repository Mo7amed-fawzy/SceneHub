import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';

void obBoardingVisited() {
  sl<AppPreferences>().setData('isOnBoardingVisited', true);
}
