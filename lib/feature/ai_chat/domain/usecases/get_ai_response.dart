import 'package:ai_movie_app/feature/ai_chat/data/datasource/scenebot_remote_data_source.dart';
import 'package:ai_movie_app/feature/home/data/datasource/home_media_remote_data_source.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

class GetAIResponse {
  final ScenebotRemoteDataSource repository;

  GetAIResponse(this.repository);

  Future<String> call(String prompt) async {
    return await repository.getAIResponse(prompt);
  }
}

class GetNowPlayingMedia {
  final HomeMediaRemoteDataSource repository;

  GetNowPlayingMedia(this.repository);

  Future<List<HomeMoviesDetailsModel>> call(String mediaType) async {
    return await repository.getNowPlaying(mediaType: mediaType);
  }
}
