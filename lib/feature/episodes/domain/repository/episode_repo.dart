import 'package:ai_movie_app/core/constants/app_data_types.dart';

import '../../data/models/episodes_model.dart';
import '../../data/models/get_episodes_prams.dart';

abstract class EpisodesRepository {
  AsyncSingleDataResponse<EpisodesModel> getEpisodes(GetEpisodesParams params);
}
