import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/season/tv_season_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/tv_series_model.dart';

import '../../../../core/constants/endpoint_constants.dart';

abstract class TvSeriesRemoteDatasource {
  Future<TvSeriesDetailsModel> getTvSeriesDetails(int id);
  Future<TvSeasonModel> getTvSeriesSeasonsDetails(int id, int seasonNumber);
}

class TvSeriesRemoteDatasourceImpl implements TvSeriesRemoteDatasource {
  final ApiConsumer apiConsumer;

  TvSeriesRemoteDatasourceImpl({required this.apiConsumer});

  @override
  Future<TvSeriesDetailsModel> getTvSeriesDetails(int id) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tv}$id',
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );
    if (response == null) {
      throw Exception('Failed to load TV series details');
    }
    final tvSeriesDetails = TvSeriesDetailsModel.fromJson(response);
    return tvSeriesDetails;
  }

  @override
  Future<TvSeasonModel> getTvSeriesSeasonsDetails(
    int id,
    int seasonNumber,
  ) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tv}$id${EndpointConstants.tvSeriesSeason}$seasonNumber',
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );
    if (response == null) {
      throw Exception('Failed to load TV series season');
    }
    return TvSeasonModel.fromJson(response);
  }
}
