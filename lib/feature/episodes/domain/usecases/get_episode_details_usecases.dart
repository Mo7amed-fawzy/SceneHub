import '../../../../core/constants/app_data_types.dart';
import '../entities/episode_entities.dart';
import '../../data/models/get_episodes_prams.dart';
import '../repository/episode_repo.dart';

class GetEpisodeDetailsUseCase {
  final EpisodesRepository repository;

  GetEpisodeDetailsUseCase(this.repository);

  AsyncSingleDataResponse<EpisodeEntity> call(GetEpisodesParams params) async {
    return await repository.getEpisodes(params);
  }
}
