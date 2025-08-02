import 'package:ai_movie_app/core/database/cache/cache_helper.dart';
import 'package:ai_movie_app/core/services/service_locator.dart';

void obBoardingVisited() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}
