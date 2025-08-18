import 'package:ai_movie_app/feature/home/data/datasource/home_media_remote_data_source.dart';
import 'package:ai_movie_app/feature/home/data/datasource/home_media_remote_data_source_impl.dart';
import 'package:ai_movie_app/feature/home/data/repositories/movies_repository_impl.dart';
import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_details_usecase.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_mixed_now_playing_use_case.dart';
import 'package:ai_movie_app/feature/home/domain/use_cases/get_now_playing_use_case.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/home_media_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';

final sl = GetIt.instance;

Future<void> homeInit() async {
  sl.registerLazySingleton<HomeMediaRemoteDataSource>(
    () => HomeMediaRemoteDataSourceImpl(apiConsumer: sl<ApiConsumer>()),
  );

  sl.registerLazySingleton<HomeMediaRepository>(
    () => HomeMediaRepositoryImpl(sl<HomeMediaRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => GetDetailsUseCase(sl<HomeMediaRepository>()));
  sl.registerLazySingleton(
    () => GetNowPlayingUseCase(sl<HomeMediaRepository>()),
  );
  sl.registerLazySingleton(
    () => GetMixedNowPlayingUseCase(sl<HomeMediaRepository>()),
  );

  sl.registerFactory(
    () => HomeMediaBloc(
      getDetailsUseCase: sl(),
      getNowPlayingUseCase: sl(),
      getMixedNowPlayingUseCase: sl(),
    ),
  );
}
