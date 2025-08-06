import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/tv_series/data/datasource/tv_series_remote_datasource.dart';
import '../../feature/tv_series/data/repository/tv_series_repo_impl.dart';
import '../../feature/tv_series/domain/repository/tv_series_repo.dart';
import '../../feature/tv_series/domain/usecases/get_tv_series_cast_usecase.dart';
import '../../feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import '../database/cache/app_shared_preferences.dart';
import '../network/api_consumer.dart';
import '../network/dio_consumer.dart';

final GetIt sl = GetIt.instance;

Future<void> initSl() async {
  // Register your services, repositories, and other dependencies here
  // Example:
  // sl.registerLazySingleton<Auth>(() => SomeServiceImpl());
  // sl.registerFactory<SomeRepository>(() => SomeRepositoryImpl());

  // Initialize and register AppPreferences as a singleton
  final appPreferences = AppPreferences();
  await appPreferences.init();
  sl.registerSingleton(appPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //* Tv Series
  sl.registerLazySingleton<TvSeriesRemoteDatasource>(
    () => TvSeriesRemoteDatasourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<TvSeriesRepo>(
    () => TvSeriesRepoImpl(remoteDatasource: sl()),
  );
  sl.registerLazySingleton<GetTvSeriesDetailsUseCase>(
    () => GetTvSeriesDetailsUseCase(sl()),
  );
  sl.registerLazySingleton<GetTvSeriesCastUseCase>(
    () => GetTvSeriesCastUseCase(sl()),
  );
}
