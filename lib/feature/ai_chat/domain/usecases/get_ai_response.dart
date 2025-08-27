import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/ai_response.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/failure.dart';

import '../repositories/scenebot_repository.dart';

class GetAIResponseUseCase {
  final ScenebotRepository repository;

  GetAIResponseUseCase(this.repository);

  /// Returns Result<AIResponse, Failure>
  Future<ResultBot<AIResponse, Failure>> call(String query) async {
    if (query.trim().isEmpty) {
      return ResultBot.failure(Failure(message: 'Query cannot be empty'));
    }

    return await repository.askScenebot(query);
  }
}
