import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/network/api_consumer.dart';
import '../models/episodes_model.dart';
import '../models/get_episodes_prams.dart';

abstract class EpisodeRemoteDataSource {
  Future<EpisodesModel> getEpisodes(GetEpisodesParams params);
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final ApiConsumer apiConsumer;
  EpisodeRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<EpisodesModel> getEpisodes(GetEpisodesParams params) {
    try {
      return apiConsumer
          .get(
            '${EndpointConstants.tvSeriesDetails}${params.seriesId}${EndpointConstants.tvSeriesSeason}${params.seasonNumber}${EndpointConstants.tvSeriesEpisode}${params.episodeNumber}',
          )
          .then((response) {
            if (response == null) {
              throw Exception('Failed to load episode details');
            }
            return EpisodesModel.fromJson(response);
          })
          .catchError((error) {
            throw Exception('Error fetching episode details: $error');
          });
    } on Exception catch (e) {
      throw Exception('Failed to fetch episode details: ${e.toString()}');
    }
  }
}
