// scenebot_logic.dart
import 'package:ai_movie_app/feature/ai_chat/domain/entities/conversation_step.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/message.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/predefined_option.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/conversation_flow.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/get_ai_response.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

class ScenebotController {
  final GetAIResponse getAIResponse;
  final GetNowPlayingMedia getNowPlayingMedia;

  List<Message> messages = [];
  int currentStepIndex = 0;
  final List<ConversationStep> steps = ConversationFlow.initialFlow();

  ScenebotController({
    required this.getAIResponse,
    required this.getNowPlayingMedia,
  });

  ConversationStep get currentStep => steps[currentStepIndex];

  void sendPredefinedOption(PredefinedOption option) async {
    if (option.sendsToAI == true) {
      await sendUserMessage(option.text);
    } else if (option.type != null) {
      await fetchMedia(option.type!);
    }
    // Move to the next step if available
    if (currentStepIndex + 1 < steps.length) currentStepIndex++;
  }

  Future<void> sendUserMessage(String text) async {
    messages.add(Message(text: text, sender: Sender.user));

    // AI response
    final aiText = await getAIResponse(text);
    messages.add(Message(text: aiText, sender: Sender.bot));
  }

  Future<void> fetchMedia(MediaType type) async {
    List<HomeMoviesDetailsModel> mediaList = await getNowPlayingMedia(
      type == MediaType.movie ? "movie" : "tv",
    );

    messages.add(
      Message(
        text:
            "Suggestions for ${type == MediaType.movie ? "movies" : "TV shows"}:\n" +
            mediaList.map((e) => e.title ?? "Unknown").join("\n"),
        sender: Sender.bot,
      ),
    );
  }
}
