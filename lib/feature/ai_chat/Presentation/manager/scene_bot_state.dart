import 'package:ai_movie_app/feature/ai_chat/data/model/ai_response.dart';

abstract class ScenebotState {}

class ScenebotInitial extends ScenebotState {}

class ScenebotLoading extends ScenebotState {}

class ScenebotLoaded extends ScenebotState {
  final AIResponse response;
  ScenebotLoaded(this.response);
}

class ScenebotError extends ScenebotState {
  final String message;
  ScenebotError(this.message);
}
