import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_data_types.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repository/episode_repo.dart';
import '../datasource/episode_remote_datasource.dart';
import '../models/episodes_model.dart';
import '../models/get_episodes_prams.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodeRemoteDataSource remoteDataSource;

  EpisodesRepositoryImpl(this.remoteDataSource);

  @override
  AsyncSingleDataResponse<EpisodesModel> getEpisodes(
    GetEpisodesParams params,
  ) async {
    try {
      final response = await remoteDataSource.getEpisodes(params);
      return Right(response);
    } catch (e) {
      return Left(
        ServerFailure('Failed to fetch episode details: ${e.toString()}', 500),
      );
    }
  }
}
