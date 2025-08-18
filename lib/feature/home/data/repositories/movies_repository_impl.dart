import 'package:ai_movie_app/feature/home/data/datasource/movies_remote_datasource.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';
import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';

abstract class HomeHomeMoviesRepository {
  Future<List<HomeMoviesDetailsModel>> getNowPlayingMovies();
  Future<HomeMoviesDetailsModel> getMovieDetails(int movieId);
}

class HomeMoviesRepositoryImpl implements HomeMoviesRepository {
  final HomeMoviesRemoteDataSource remoteDataSource;

  HomeMoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<HomeMoviesDetailsModel>> getNowPlayingMovies() {
    return remoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<HomeMoviesDetailsModel> getMovieDetails(int movieId) {
    return remoteDataSource.getMovieDetails(movieId);
  }
}
