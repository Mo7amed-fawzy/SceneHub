import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_data_types.dart';
import '../../domain/repository/movies_repo.dart';
import '../datasorce/movies_remote_datasource.dart';
import '../models/movies_details_model.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl(this.remoteDataSource);

  @override
  AsyncSingleDataResponse<MoviesDetailsModel> getMovieDetails(
    int movieId,
  ) async {
    try {
      var response = await remoteDataSource.getMovieDetails(movieId);
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure('Failed to fetch movie details: ${e.toString()}', 500),
      );
    }
  }
}
