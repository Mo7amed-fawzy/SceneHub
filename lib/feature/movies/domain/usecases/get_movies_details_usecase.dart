import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../entities/movies_details_entity.dart';
import '../repository/movies_repo.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository repository;

  GetMovieDetailsUseCase(this.repository);

  AsyncSingleDataResponse<MoviesDetailsEntity> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
