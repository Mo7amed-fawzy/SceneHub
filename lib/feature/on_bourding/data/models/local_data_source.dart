import 'package:ai_movie_app/core/constants/app_style.dart';
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
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
      OnBoardingModel(
        imagePath: AppStyle.images.details1,
        title: "Discover Movies Tailored For You",
        subTitle:
            "Explore a vast collection of movies and series curated to your taste using AI-powered recommendations.",
      ),
      OnBoardingModel(
        imagePath: AppStyle.images.details2,
        title: "From Classics to Latest Releases",
        subTitle:
            "Find blockbusters, hidden gems, and trending titles from all around the world.",
      ),
      OnBoardingModel(
        imagePath: AppStyle.images.details3,
        title: "Smart AI Recommendations",
        subTitle:
            "Let our AI guide your movie journey by suggesting films you’ll love and tracking your favorites.",
      ),
    ];
  }
}
