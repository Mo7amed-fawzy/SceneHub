import 'package:ai_movie_app/feature/ai_chat/Presentation/manager/scene_bot_state.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/communication.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/failure.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/get_ai_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScenebotCubit extends Cubit<ScenebotState> {
  final GetAIResponseUseCase getAIResponse;

  final List<Message> _messages = [];
  List<Message> get messages => List.unmodifiable(_messages);

  final Set<String> selectedSuggestions = {};
  final Set<int> selectedMessageIndexes = {};
  bool selectionMode = false;

  final TextEditingController queryController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  ScenebotCubit(this.getAIResponse) : super(ScenebotInitial());

  void sendUserMessage([String? text]) {
    final messageText = text ?? queryController.text.trim();
    if (messageText.isEmpty) return;

    _messages.add(Message(text: messageText, sender: Sender.user));
    emit(ScenebotLoading());
    queryController.clear();
    askScenebot(messageText);
  }

  Future<void> askScenebot(String query) async {
    emit(ScenebotLoading());
    final result = await getAIResponse(query);

    if (result.isSuccess) {
      final aiMessage = Message(
        text: result.data!.message,
        sender: Sender.ai,
        suggestions: result.data!.suggestions,
      );
      _messages.add(aiMessage);
      emit(ScenebotLoaded(result.data!));
    } else {
      final error = result.error as Failure;
      _messages.add(Message(text: error.message, sender: Sender.ai));
      emit(ScenebotError(error.message));
    }
  }

  // Clear Chat
  void clearChat() {
    _messages.clear();
    selectedMessageIndexes.clear();
    selectionMode = false;
    emit(ScenebotInitial());
  }

  // Toggle Selection Mode
  void enterSelectionMode() {
    selectionMode = true;
    selectedMessageIndexes.clear();
    emit(state);
  }

  void exitSelectionMode() {
    selectionMode = false;
    selectedMessageIndexes.clear();
    emit(state);
  }

  void toggleMessageSelection(int index) {
    if (selectedMessageIndexes.contains(index)) {
      selectedMessageIndexes.remove(index);
    } else {
      selectedMessageIndexes.add(index);
    }
    emit(state);
  }

  void toggleSuggestion(String suggestion) {
    if (selectedSuggestions.contains(suggestion)) {
      selectedSuggestions.remove(suggestion);
    } else {
      selectedSuggestions.add(suggestion);
    }
    sendSuggestions(selectedSuggestions.toList());
  }

  void sendSuggestions(List<String> suggestions) {
    if (suggestions.isEmpty) return;
    sendUserMessage(suggestions.join(' '));
    selectedSuggestions.clear();
  }
}
