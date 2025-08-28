// features/scenebot/domain/repositories/scenebot_repository.dart

// Use Either-like pattern: Here we use Future<Result<T, Failure>> pattern.
// If you prefer the `dartz` package you can replace Result with Either.

import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/ai_response.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/movie_image.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/failure.dart';

abstract class ScenebotRepository {
  /// Ask the scenebot a query and receive an AIResponse
  Future<ResultBot<AIResponse, Failure>> askScenebot(String query);

  /// Optionally fetch movie image/poster by title or id
  Future<ResultBot<MovieImage, Failure>> fetchMovieImage(String query);
}
