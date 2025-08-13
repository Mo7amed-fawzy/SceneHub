import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/utils/app_assets.dart';
import 'package:ai_movie_app/feature/on_bourding/data/models/on_boarding_model.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> cacheOnBoardingVisited();
  List<OnBoardingModel> getOnBoardingLocalData();
}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final AppPreferences preferences;
  OnBoardingLocalDataSourceImpl(this.preferences);

  @override
  Future<void> cacheOnBoardingVisited() async {
    await preferences.setData('isOnBoardingVisited', true);
  }

  @override
  List<OnBoardingModel> getOnBoardingLocalData() {
    return [
      const OnBoardingModel(
        imagePath: Assets.imagesDetails1,
        title: "Discover Movies Tailored For You",
        subTitle:
            "Explore a vast collection of movies and series curated to your taste using AI-powered recommendations.",
      ),
      const OnBoardingModel(
        imagePath: Assets.imagesDetails2,
        title: "From Classics to Latest Releases",
        subTitle:
            "Find blockbusters, hidden gems, and trending titles from all around the world.",
      ),
      const OnBoardingModel(
        imagePath: Assets.imagesOnBoarding,
        title: "Smart AI Recommendations",
        subTitle:
            "Let our AI guide your movie journey by suggesting films you’ll love and tracking your favorites.",
      ),
    ];
  }
}
