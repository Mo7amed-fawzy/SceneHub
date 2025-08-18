import 'package:ai_movie_app/feature/movies/data/datasource/movies_remote_datasource.dart';
import 'package:ai_movie_app/feature/movies/data/repository/movies_repo_impl.dart';
import 'package:ai_movie_app/feature/movies/domain/repository/movies_repo.dart';
import 'package:ai_movie_app/feature/movies/domain/usecases/get_movies_details_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initMoviesDependencies() async {
  sl.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(apiConsumer: sl()),
  );
  sl.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(sl()));
  sl.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(sl()),
  );
}
