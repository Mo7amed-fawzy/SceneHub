import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/home/data/datasource/home_media_remote_data_source.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

class HomeMediaRemoteDataSourceImpl implements HomeMediaRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeMediaRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<HomeMoviesDetailsModel> getDetails({
    required int id,
    required String mediaType,
  }) async {
    final type = mediaType.toLowerCase();
    final endpoint = type == "movie"
        ? "${EndpointConstants.movie}$id"
        : "${EndpointConstants.tv}$id";

    final response = await apiConsumer.get(
      endpoint,
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );

    if (response == null) {
      throw Exception('Failed to load details');
    }

    return HomeMoviesDetailsModel.fromJson(response, mediaType: type);
  }

  @override
  Future<List<HomeMoviesDetailsModel>> getNowPlaying({
    required String mediaType,
  }) async {
    final type = mediaType.toLowerCase();
    final endpoint = type == "movie"
        ? EndpointConstants
              .nowPlayingMovies // /movie/now_playing
        : EndpointConstants.airingTodayTv; // /tv/on_the_air

    final response = await apiConsumer.get(
      endpoint,
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );

    if (response == null || response[CacheKeys.results] == null) {
      return [];
    }

    final results = response[CacheKeys.results] as List;

    return results
        .map((json) => HomeMoviesDetailsModel.fromJson(json, mediaType: type))
        .where((item) => item.id != null)
        .toList();
  }

  @override
  Future<List<HomeMoviesDetailsModel>> getMixedNowPlaying() async {
    final results = await Future.wait([
      getNowPlaying(mediaType: "movie"),
      getNowPlaying(mediaType: "tv"),
    ]);

    final mixed = [...results[0], ...results[1]];

    final filtered = mixed.where((item) => item.id != null).toList();

    filtered.shuffle();

    return filtered;
  }
}
