import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/movies/domain/entities/movies_details_entity.dart';

abstract class MoviesRepository {
  AsyncSingleDataResponse<MoviesDetailsEntity> getMovieDetails(int movieId);
}
