import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

abstract class HomeMoviesRemoteDataSource {
  Future<HomeMoviesDetailsModel> getMovieDetails(int movieId);
  Future<List<HomeMoviesDetailsModel>> getNowPlayingMovies();
}

class HomeMoviesRemoteDataSourceImpl implements HomeMoviesRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeMoviesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<HomeMoviesDetailsModel> getMovieDetails(int movieId) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.movieDetails}$movieId',
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );
    return HomeMoviesDetailsModel.fromJson(response);
  }

  @override
  Future<List<HomeMoviesDetailsModel>> getNowPlayingMovies() async {
    final response = await apiConsumer.get(
      '${EndpointConstants.movieDetails}${EndpointConstants.nowPlaying}',
      queryParameters: {CacheKeys.apiKey: EnvConfig.tmdbApiKey},
    );
    final results = response[CacheKeys.results] as List;
    return results
        .map((json) => HomeMoviesDetailsModel.fromJson(json))
        .toList();
  }
}
