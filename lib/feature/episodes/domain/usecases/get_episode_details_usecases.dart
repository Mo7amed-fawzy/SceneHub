import '../../../../core/constants/app_data_types.dart';
import '../../data/models/episodes_model.dart';
import '../../data/models/get_episodes_prams.dart';
import '../repository/episode_repo.dart';

class GetEpisodeDetailsUseCase {
  final EpisodesRepository repository;

  GetEpisodeDetailsUseCase(this.repository);

  AsyncSingleDataResponse<EpisodesModel> call(GetEpisodesParams params) async {
    return await repository.getEpisodes(params);
  }
}
