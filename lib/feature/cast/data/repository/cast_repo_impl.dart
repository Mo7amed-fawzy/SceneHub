import 'package:ai_movie_app/feature/cast/data/datasource/cast_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_data_types.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cast_entities.dart';
import '../../domain/repository/cast_repo.dart';

class CastRepoImpl implements CastRepository {
  final CastRemoteDataSource remoteDatasource;
  CastRepoImpl(this.remoteDatasource);
  @override
  AsyncSingleDataResponse<TvCastEntity> getTvSeriesCast(int id) async {
    try {
      final response = await remoteDatasource.getTvSeriesCast(id);
      return Right(response); // Model extends Entity, so can be cast
    } on FormatException catch (_) {
      return Left(FormatFailure('Invalid data format received'));
    } on Exception catch (_) {
      return Left(ServerFailure('Failed to fetch TV series cast'));
    }
  }

  @override
  AsyncSingleDataResponse<TvCastEntity> getMovieCast(int id) async {
    try {
      final response = await remoteDatasource.getMovieCast(id);
      return Right(response); // Model extends Entity, so can be cast
    } on FormatException catch (_) {
      return Left(FormatFailure('Invalid data format received'));
    } on Exception catch (_) {
      return Left(ServerFailure('Failed to fetch movie cast'));
    }
  }
}
