import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scene_bot_state.dart';
import 'package:ai_movie_app/feature/ai_chat/data/datasource/scenebot_remote_data_source.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/communication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScenebotCubit extends Cubit<ScenebotState> {
  final ScenebotRemoteDataSource remoteDataSource;

  List<Message> messages = [];

  ScenebotCubit({required this.remoteDataSource}) : super(ScenebotInitial());

  void sendUserMessage(String text) async {
    final userMessage = Message(text: text, sender: Sender.user);
    messages.add(userMessage);
    emit(ScenebotSuccess(List.from(messages)));

    emit(ScenebotLoading());
    try {
      final aiText = await remoteDataSource.getAIResponse(text);
      final botMessage = Message(text: aiText, sender: Sender.bot);
      messages.add(botMessage);
      emit(ScenebotSuccess(List.from(messages)));
    } catch (e) {
      emit(ScenebotFailure(e.toString()));
    }
  }

  void sendPredefinedMessage(String text) {
    sendUserMessage(text);
  }
}
