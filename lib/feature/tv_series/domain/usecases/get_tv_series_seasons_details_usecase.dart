import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/tv_series/domain/repository/tv_series_repo.dart';

import '../../data/models/season/tv_season_model.dart';

class GetTvSeriesSeasonsDetailsUseCase {
  final TvSeriesRepo _repository;

  GetTvSeriesSeasonsDetailsUseCase(this._repository);

  AsyncSingleDataResponse<TvSeasonModel> call({
    required int id,
    required int seasonNumber,
  }) {
    return _repository.getTvSeriesSeasonsDetails(id, seasonNumber);
  }
}
