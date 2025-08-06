import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/tv_series_model.dart';

import '../../../../core/constants/endpoint_constants.dart';

abstract class TvSeriesRemoteDatasource {
  // Future<List<TvSeriesModel>> getPopularTvSeries();
  // Future<List<TvSeriesModel>> getTopRatedTvSeries();
  // Future<List<TvSeriesModel>> getAiringTodayTvSeries();
  Future<TvSeriesDetailsModel> getTvSeriesDetails(int id);
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

  // Other methods can be implemented similarly
}
