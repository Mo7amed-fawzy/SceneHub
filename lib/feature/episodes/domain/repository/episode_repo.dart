import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../entities/episode_entities.dart';
import '../../data/models/get_episodes_prams.dart';

abstract class EpisodesRepository {
  AsyncSingleDataResponse<EpisodeEntity> getEpisodes(GetEpisodesParams params);
}
