import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Core
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/network/dio_consumer.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';

import 'package:ai_movie_app/feature/cast/data/datasource/cast_remote_datasource.dart';
import 'package:ai_movie_app/feature/cast/data/repository/cast_repo_impl.dart';
import 'package:ai_movie_app/feature/cast/domain/repository/cast_repo.dart';
import 'package:ai_movie_app/feature/cast/domain/usecases/get_movies_cast_usecase.dart';
import 'package:ai_movie_app/feature/episodes/domain/repository/episode_repo.dart';
import 'package:ai_movie_app/feature/movies/domain/repository/movies_repo.dart';




import '../../feature/episodes/data/datasource/episode_remote_datasource.dart';
import '../../feature/episodes/data/repository/episodes_repo_impl.dart';
import '../../feature/episodes/domain/usecases/get_episode_details_usecases.dart';
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

// Movies & Tv Series
import 'package:ai_movie_app/feature/movies/data/datasource/movies_remote_datasource.dart';
import 'package:ai_movie_app/feature/movies/data/repository/movies_repo_impl.dart';
import 'package:ai_movie_app/feature/movies/domain/repository/movies_repo.dart';
import 'package:ai_movie_app/feature/movies/domain/usecases/get_movies_details_usecase.dart';

import 'package:ai_movie_app/feature/tv_series/data/datasource/tv_series_remote_datasource.dart';
import 'package:ai_movie_app/feature/tv_series/data/repository/tv_series_repo_impl.dart';
import 'package:ai_movie_app/feature/tv_series/domain/repository/tv_series_repo.dart';
import 'package:ai_movie_app/feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import 'package:ai_movie_app/feature/tv_series/domain/usecases/get_tv_series_seasons_details_usecase.dart';

import 'package:ai_movie_app/feature/cast/data/datasource/cast_remote_datasource.dart';
import 'package:ai_movie_app/feature/cast/data/repository/cast_repo_impl.dart';
import 'package:ai_movie_app/feature/cast/domain/repository/cast_repo.dart';
import 'package:ai_movie_app/feature/cast/domain/usecases/get_movies_cast_usecase.dart';
import 'package:ai_movie_app/feature/cast/domain/usecases/get_tv_series_cast_usecase.dart';

final sl = GetIt.instance;

Future<void> initSl() async {
  // ===================== Core =====================
  final appPreferences = AppPreferences();
  await appPreferences.init();
  sl.registerSingleton<AppPreferences>(appPreferences);

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit()..loadTheme());

  // // ===================== Auth =====================

  // ===================== OnBoarding =====================

  // ===================== Splash =====================

  // ===================== Movies =====================

  // ===================== Tv Series =====================
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

  // ===================== Cast =====================
  sl.registerLazySingleton<CastRemoteDataSource>(
    () => CastRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<CastRepository>(() => CastRepoImpl(sl()));
  sl.registerLazySingleton<GetMoviesCastUseCase>(
    () => GetMoviesCastUseCase(sl()),
  );
  sl.registerLazySingleton<GetTvSeriesCastUseCase>(
    () => GetTvSeriesCastUseCase(sl()),
  );

  //* Episodes
  sl.registerLazySingleton<EpisodeRemoteDataSource>(
    () => EpisodeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<EpisodesRepository>(
    () => EpisodesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<GetEpisodeDetailsUseCase>(
    () => GetEpisodeDetailsUseCase(sl()),
  );
}
