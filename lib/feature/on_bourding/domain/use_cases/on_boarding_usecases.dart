import 'package:ai_movie_app/feature/on_bourding/domain/entities/on_boarding_entity.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/repository/on_boarding_repository.dart';

class SetOnBoardingVisitedUseCase {
  final OnBoardingRepository repository;
  SetOnBoardingVisitedUseCase(this.repository);

  Future<void> call() async {
    await repository.setOnBoardingVisited();
  }
}

class GetOnBoardingDataUseCase {
  final OnBoardingRepository repository;
  GetOnBoardingDataUseCase(this.repository);

  List<OnBoardingEntity> call() {
    return repository.getOnBoardingData();
  }
}
