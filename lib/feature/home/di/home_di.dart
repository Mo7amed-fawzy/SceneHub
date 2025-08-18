import 'package:ai_movie_app/feature/home/data/datasource/movies_remote_datasource.dart';
import 'package:ai_movie_app/feature/home/data/repositories/movies_repository_impl.dart';
import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> homeInit() async {
  sl.registerLazySingleton<HomeMoviesRemoteDataSource>(
    () => HomeMoviesRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerLazySingleton<HomeMoviesRepository>(
    () => HomeMoviesRepositoryImpl(remoteDataSource: sl()),
  );
}
