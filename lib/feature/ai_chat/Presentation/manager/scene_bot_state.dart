import 'package:ai_movie_app/feature/ai_chat/domain/entities/communication.dart';

abstract class ScenebotState {}

class ScenebotInitial extends ScenebotState {}

class ScenebotLoading extends ScenebotState {}

class ScenebotSuccess extends ScenebotState {
  final List<Message> messages;
  ScenebotSuccess(this.messages);
}

class ScenebotFailure extends ScenebotState {
  final String error;
  ScenebotFailure(this.error);
}
