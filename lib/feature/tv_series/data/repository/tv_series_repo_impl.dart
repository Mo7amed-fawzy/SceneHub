import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/season_entities.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/tv_series_repo.dart';
import '../datasource/tv_series_remote_datasource.dart';

class TvSeriesRepoImpl implements TvSeriesRepo {
  final TvSeriesRemoteDatasource remoteDatasource;
  TvSeriesRepoImpl({required this.remoteDatasource});
  @override
  AsyncSingleDataResponse<TvSeriesDetailsEntity> getTvSeriesDetails(
    int id,
  ) async {
    try {
      final response = await remoteDatasource.getTvSeriesDetails(id);
      return Right(response); // Model extends Entity, so can be cast
    } on FormatException catch (_) {
      return Left(FormatFailure('Invalid data format received'));
    } on Exception catch (_) {
      return Left(ServerFailure('Failed to fetch TV series details'));
    }
  }

  @override
  AsyncSingleDataResponse<TvSeasonEntity> getTvSeriesSeasonsDetails(
    int id,
    int seasonNumber,
  ) async {
    try {
      final response = await remoteDatasource.getTvSeriesSeasonsDetails(
        id,
        seasonNumber,
      );
      return Right(response); // Model extends Entity, so can be cast
    } on FormatException catch (_) {
      return Left(FormatFailure('Invalid data format received'));
    } on Exception catch (_) {
      return Left(ServerFailure('Failed to fetch TV series season'));
    }
  }
}
