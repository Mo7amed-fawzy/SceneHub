import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/season/tv_season_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/tv_series_model.dart';

import '../../../../core/constants/endpoint_constants.dart';
import '../models/cast/tv_cast_model.dart';

abstract class TvSeriesRemoteDatasource {
  // Future<List<TvSeriesModel>> getPopularTvSeries();
  // Future<List<TvSeriesModel>> getTopRatedTvSeries();
  // Future<List<TvSeriesModel>> getAiringTodayTvSeries();
  Future<TvSeriesDetailsModel> getTvSeriesDetails(int id);
  Future<TvCastModel> getTvSeriesCast(int id);
  Future<TvSeasonModel> getTvSeriesSeasonsDetails(int id, int seasonNumber);
  // Future<List<TvEpisodeModel>> getTvSeriesEpisodes(int id);
}

class TvSeriesRemoteDatasourceImpl implements TvSeriesRemoteDatasource {
  final ApiConsumer apiConsumer;

  TvSeriesRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<TvSeriesDetailsModel> getTvSeriesDetails(int id) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tvSeriesDetails}$id',
    );
    if (response == null) {
      throw Exception('Failed to load TV series details');
    }
    final tvSeriesDetails = TvSeriesDetailsModel.fromJson(response);
    return tvSeriesDetails;
  }

  @override
  Future<TvCastModel> getTvSeriesCast(int id) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tvSeriesDetails}$id${EndpointConstants.tvSeriesCast}',
    );
    if (response == null) {
      throw Exception('Failed to load TV series cast');
    }
    final tvCast = TvCastModel.fromJson(response);
    return tvCast;
  }

  @override
  Future<TvSeasonModel> getTvSeriesSeasonsDetails(
    int id,
    int seasonNumber,
  ) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tvSeriesDetails}$id${EndpointConstants.tvSeriesSeason}$seasonNumber',
    );
    if (response == null) {
      throw Exception('Failed to load TV series season');
    }
    return TvSeasonModel.fromJson(response);
  }
}
