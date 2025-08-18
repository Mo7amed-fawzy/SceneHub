import 'package:ai_movie_app/core/utils/api_keys.dart';

import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/network/api_consumer.dart';
import '../models/movies_details_model.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesDetailsModel> getMovieDetails(int movieId);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiConsumer apiConsumer;
  MoviesRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<MoviesDetailsModel> getMovieDetails(int movieId) {
    // Implementation of fetching movie details from remote source
    try {
      return apiConsumer
          .get(
            '${EndpointConstants.movie}$movieId',
            queryParameters: {'api_key': EnvConfig.tmdbApiKey},
          )
          .then((response) {
            if (response == null)
              throw Exception('Failed to load movie details');
            return MoviesDetailsModel.fromJson(response);
          });

      // .catchError((error) {
      //   throw Exception('Error fetching movie details: $error');
      // });
    } on Exception catch (e) {
      throw Exception('Failed to fetch movie details: ${e.toString()}');
    }
  }
}
