import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/movies/data/models/movies_details_model.dart';

abstract class MoviesRepository {
  AsyncSingleDataResponse<MoviesDetailsModel> getMovieDetails(int movieId);
}
