import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../../data/models/movies_details_model.dart';
import '../repository/movies_repo.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository repository;

  GetMovieDetailsUseCase(this.repository);

  AsyncSingleDataResponse<MoviesDetailsModel> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
