import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../../data/models/cast/tv_cast_model.dart';
import '../../data/models/tv_series_model.dart';

abstract class TvSeriesRepo {
  // Future<List<TvSeriesModel>> getPopularTvSeries();
  // Future<List<TvSeriesModel>> getTopRatedTvSeries();
  // Future<List<TvSeriesModel>> getOnTheAirTvSeries();
  // Future<List<TvSeriesModel>> getAiringTodayTvSeries();
  AsyncSingleDataResponse<TvSeriesDetailsModel> getTvSeriesDetails(int id);
  AsyncSingleDataResponse<TvCastModel> getTvSeriesCast(int id);
}
