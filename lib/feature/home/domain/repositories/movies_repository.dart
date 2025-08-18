import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';

abstract class HomeMoviesRepository {
  Future<List<HomeMoviesDetailsEntity>> getNowPlayingMovies();
  Future<HomeMoviesDetailsEntity> getMovieDetails(int movieId);
}
