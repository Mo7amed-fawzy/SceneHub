import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/feature/on_bourding/data/models/local_data_source.dart';
import 'package:ai_movie_app/feature/on_bourding/data/repo_impl/on_boarding_repo_impl.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/repository/on_boarding_repository.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/use_cases/on_boarding_usecases.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';

Future<void> initOnBoardingDependencies(GetIt sl) async {
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
    () => OnBoardingLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<OnBoardingRepository>(
    () => OnBoardingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetOnBoardingDataUseCase(sl()));
  sl.registerLazySingleton(() => SetOnBoardingVisitedUseCase(sl()));
  sl.registerFactory(() => OnBoardingCubit(sl(), sl()));
}
