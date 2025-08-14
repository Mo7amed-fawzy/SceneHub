import 'package:ai_movie_app/feature/on_bourding/domain/entities/on_boarding_entity.dart';

abstract class OnBoardingRepository {
  Future<void> setOnBoardingVisited();
  List<OnBoardingEntity> getOnBoardingData();
}
