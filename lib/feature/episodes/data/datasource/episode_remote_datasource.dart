import '../../../../core/constants/cache_keys.dart';
import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/network/api_consumer.dart';
import '../../../../core/utils/api_keys.dart';
import '../models/episodes_model.dart';
import '../models/get_episodes_prams.dart';

abstract class EpisodeRemoteDataSource {
  Future<EpisodesModel> getEpisodes(GetEpisodesParams params);
}

class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final ApiConsumer apiConsumer;

  EpisodeRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<EpisodesModel> getEpisodes(GetEpisodesParams params) async {
    try {
      final endpoint =
          '${EndpointConstants.tv}${params.seriesId}${EndpointConstants.tvSeriesSeason}${params.seasonNumber}${EndpointConstants.tvSeriesEpisode}${params.episodeNumber}';

      final response = await apiConsumer.get(
        endpoint,
        queryParameters: {
          CacheKeys.apiKey: EnvConfig.tmdbApiKey,
        }, // أضفنا API key هنا
      );

      if (response == null) {
        throw Exception('Failed to load episode details');
      }

      return EpisodesModel.fromJson(response);
    } catch (error) {
      throw Exception('Error fetching episode details: $error');
    }
  }
}
