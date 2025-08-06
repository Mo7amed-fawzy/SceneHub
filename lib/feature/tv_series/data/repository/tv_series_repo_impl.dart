import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/errors/failures.dart';

import 'package:ai_movie_app/feature/tv_series/data/models/tv_series_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/tv_series_repo.dart';
import '../datasource/tv_series_remote_datasource.dart';

class TvSeriesRepoImpl implements TvSeriesRepo {
  final TvSeriesRemoteDatasource remoteDatasource;
  TvSeriesRepoImpl({required this.remoteDatasource});
  @override
  AsyncSingleDataResponse<TvSeriesDetailsModel> getTvSeriesDetails(
    int id,
  ) async {
    try {
      final response = await remoteDatasource.getTvSeriesDetails(id);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch TV series details'));
    }
  }
}
