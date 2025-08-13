import 'package:ai_movie_app/feature/on_bourding/data/models/local_data_source.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/repository/on_boarding_repository.dart';

import '../../domain/entities/on_boarding_entity.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingLocalDataSource localDataSource;
  OnBoardingRepositoryImpl(this.localDataSource);

  @override
  Future<void> setOnBoardingVisited() async {
    await localDataSource.cacheOnBoardingVisited();
  }

  @override
  List<OnBoardingEntity> getOnBoardingData() {
    return localDataSource.getOnBoardingLocalData();
  }
}
