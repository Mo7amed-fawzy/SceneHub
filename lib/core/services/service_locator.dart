import 'package:ai_movie_app/feature/cast/data/datasource/cast_remote_datasource.dart';
import 'package:ai_movie_app/feature/cast/data/repository/cast_repo_impl.dart';
import 'package:ai_movie_app/feature/cast/domain/repository/cast_repo.dart';
import 'package:ai_movie_app/feature/cast/domain/usecases/get_movies_cast_usecase.dart';
import 'package:ai_movie_app/feature/movies/domain/repository/movies_repo.dart';
import 'package:ai_movie_app/feature/splash/data/repositories/supabase_auth_repository.dart';
import 'package:ai_movie_app/feature/splash/domain/repositories/auth_repository.dart';
import 'package:ai_movie_app/feature/splash/domain/use_case/decide_start_destination_usecase.dart';
import 'package:ai_movie_app/feature/splash/presentation/manager/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/movies/data/datasource/movies_remote_datasource.dart';
import '../../feature/movies/data/repository/movies_repo_impl.dart';
import '../../feature/movies/domain/usecases/get_movies_details_usecase.dart';
import '../../feature/tv_series/data/datasource/tv_series_remote_datasource.dart';
import '../../feature/tv_series/data/repository/tv_series_repo_impl.dart';
import '../../feature/tv_series/domain/repository/tv_series_repo.dart';
import '../../feature/cast/domain/usecases/get_tv_series_cast_usecase.dart';
import '../../feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import '../../feature/tv_series/domain/usecases/get_tv_series_seasons_details_usecase.dart';
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

  // splash
  sl.registerFactory(() => SplashCubit(sl()));

  sl.registerLazySingleton<DecideStartDestinationUseCase>(
    () => DecideStartDestinationUseCase(
      appPreferences: sl<AppPreferences>(),
      authRepository: sl<AuthRepository>(),
    ),
  );

  // auth
  sl.registerLazySingleton<AuthRepository>(() => SupabaseAuthRepository());

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
  sl.registerLazySingleton<GetTvSeriesSeasonsDetailsUseCase>(
    () => GetTvSeriesSeasonsDetailsUseCase(sl()),
  );

  //* Movies
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
  sl.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(sl()),
  );

  //* Cast
  sl.registerLazySingleton<GetTvSeriesCastUseCase>(
    () => GetTvSeriesCastUseCase(sl()),
  );
  sl.registerLazySingleton<GetMoviesCastUseCase>(
    () => GetMoviesCastUseCase(sl()),
  );
  sl.registerLazySingleton<CastRepository>(() => CastRepoImpl(sl()));
  sl.registerLazySingleton<CastRemoteDataSource>(
    () => CastRemoteDataSourceImpl(apiConsumer: sl()),
  );
}
