import 'package:ai_movie_app/feature/splash/domain/repositories/splash_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

// Core
import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/network/dio_consumer.dart';
import 'package:ai_movie_app/core/utils/theme_cubit.dart';

import 'package:ai_movie_app/feature/splash/data/repositories/supabase_auth_repository.dart'; // For supabase auth
import 'package:ai_movie_app/feature/splash/domain/use_case/decide_start_destination_usecase.dart';

// OnBoarding Feature
import 'package:ai_movie_app/feature/on_bourding/data/models/local_data_source.dart';
import 'package:ai_movie_app/feature/on_bourding/data/repo_impl/on_boarding_repo_impl.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/repository/on_boarding_repository.dart';
import 'package:ai_movie_app/feature/on_bourding/domain/use_cases/on_boarding_usecases.dart';
import 'package:ai_movie_app/feature/on_bourding/presentation/cubit/on_boarding_cubit.dart';

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
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //     () => AuthRemoteDataSourceImpl());
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //     () => AuthLocalDataSourceImpl(sharedPreferences: sl()));
  // sl.registerLazySingleton<AuthRepository>(() =>
  //     AuthRepositoryImpl(
  //         remoteDataSource: sl(),
  //         localDataSource: sl()
  //     ));

  // // UseCases
  // sl.registerLazySingleton(() => SignUpUseCase(sl()));
  // sl.registerLazySingleton(() => SignInUseCase(sl()));
  // sl.registerLazySingleton(() => SignOutUseCase(sl()));
  // sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  // sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  // sl.registerLazySingleton(() => IsSignedInUseCase(sl()));
  // sl.registerLazySingleton(() => IsEmailVerifiedUseCase(sl()));
  // sl.registerLazySingleton(() => SendEmailVerificationUseCase(sl()));

  // // Cubit
  // sl.registerFactory(() => AuthCubit(
  //       signUpUseCase: sl(),
  //       signInUseCase: sl(),
  //       signOutUseCase: sl(),
  //       resetPasswordUseCase: sl(),
  //       getCurrentUserUseCase: sl(),
  //       isSignedInUseCase: sl(),
  //       isEmailVerifiedUseCase: sl(),
  //       sendEmailVerificationUseCase: sl(),
  //     ));

  // ===================== OnBoarding =====================
  sl.registerLazySingleton<OnBoardingLocalDataSource>(
    () => OnBoardingLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<OnBoardingRepository>(
    () => OnBoardingRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetOnBoardingDataUseCase(sl()));
  sl.registerLazySingleton(() => SetOnBoardingVisitedUseCase(sl()));
  sl.registerFactory(() => OnBoardingCubit(sl(), sl()));

  // ===================== Splash =====================
  sl.registerLazySingleton<SplashAuthRepository>(
    () => SupabaseAuthRepository(),
  );
  sl.registerLazySingleton<DecideStartDestinationUseCase>(
    () => DecideStartDestinationUseCase(
      appPreferences: sl(),
      authRepository: sl(),
    ),
  );

  // ===================== Movies =====================
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
  sl.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(sl()),
  );

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
}
