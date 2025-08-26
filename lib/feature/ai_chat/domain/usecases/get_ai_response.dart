import 'package:ai_movie_app/feature/ai_chat/datasource/bot_remote_data_source.dart';

class GetAIResponse {
  final ScenebotRemoteDataSource repository;

  GetAIResponse(this.repository);

  Future<String> call(String prompt) async {
    return await repository.getAIResponse(prompt);
  }
}
