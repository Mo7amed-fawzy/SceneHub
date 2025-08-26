// conversation_flow.dart
import 'package:ai_movie_app/feature/ai_chat/domain/entities/conversation_step.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/message.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/predefined_option.dart';

class ConversationFlow {
  static List<ConversationStep> initialFlow() {
    return [
      ConversationStep(
        botMessage: "Hello! How are you?",
        options: [
          PredefinedOption(text: "Good", sendsToAI: true),
          PredefinedOption(text: "Not so good", sendsToAI: true),
          PredefinedOption(text: "Type your reply", sendsToAI: true),
        ],
      ),
      ConversationStep(
        botMessage: "Do you want to start with a movie or a TV show?",
        options: [
          PredefinedOption(
            text: "Movie",
            type: MediaType.movie,
            sendsToAI: false,
          ),
          PredefinedOption(
            text: "TV Show",
            type: MediaType.tv,
            sendsToAI: false,
          ),
        ],
      ),
      ConversationStep(
        botMessage:
            "You can choose from the options or type the name of the movie/TV show you like:",
        options: [
          PredefinedOption(text: "Type a movie name", sendsToAI: true),
          PredefinedOption(text: "Type a TV show name", sendsToAI: true),
        ],
      ),
    ];
  }
}
