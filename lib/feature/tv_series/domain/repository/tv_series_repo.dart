import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../entities/season_entities.dart';
import '../entities/tv_series_entities.dart';

abstract class TvSeriesRepo {
  // Future<List<TvSeriesModel>> getPopularTvSeries();
  // Future<List<TvSeriesModel>> getTopRatedTvSeries();
  // Future<List<TvSeriesModel>> getOnTheAirTvSeries();
  // Future<List<TvSeriesModel>> getAiringTodayTvSeries();
  AsyncSingleDataResponse<TvSeriesDetailsEntity> getTvSeriesDetails(int id);
  AsyncSingleDataResponse<TvSeasonEntity> getTvSeriesSeasonsDetails(
    int id,
    int seasonNumber,
  );
}
