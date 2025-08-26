import 'package:ai_movie_app/feature/ai_chat/domain/entities/communication.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/entities/conversation_step.dart';
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

  // Context to store previous user selections
  final List<MediaType> selectedMediaTypes = [];
  final Set<int> shownMediaIds = {}; // To avoid repeating movies/TV shows

  // Pagination
  final int pageSize = 5;

  ScenebotController({
    required this.getAIResponse,
    required this.getNowPlayingMedia,
  });

  ConversationStep get currentStep => steps[currentStepIndex];

  // Send a predefined option or media type
  Future<void> sendPredefinedOption(PredefinedOption option) async {
    if (option.sendsToAI) {
      await sendUserMessage(option.text);
    } else if (option.type != null) {
      await fetchMedia(option.type!);
      selectedMediaTypes.add(option.type!);
    }

    // Dynamic options: add new options based on context
    _updateDynamicOptions();

    // Move to next step if exists
    if (currentStepIndex + 1 < steps.length) currentStepIndex++;
  }

  // Send user's message to AI
  Future<void> sendUserMessage(String text) async {
    messages.add(Message(text: text, sender: Sender.user));

    try {
      final aiText = await getAIResponse(text);
      messages.add(Message(text: aiText, sender: Sender.bot));
    } catch (e) {
      messages.add(
        Message(
          text: "Error occurred while contacting AI: $e",
          sender: Sender.bot,
        ),
      );
    }
  }

  // Fetch media with pagination and avoid duplicates
  Future<void> fetchMedia(MediaType type) async {
    try {
      List<HomeMoviesDetailsModel> mediaList = await getNowPlayingMedia(
        type == MediaType.movie ? "movie" : "tv",
      );

      // Filter items already shown
      mediaList = mediaList
          .where((item) => !shownMediaIds.contains(item.id))
          .toList();

      // Apply pagination
      final pagedList = mediaList.take(pageSize).toList();
      pagedList.forEach((item) => shownMediaIds.add(item.id!));

      if (pagedList.isEmpty) {
        messages.add(
          Message(
            text:
                "No new suggestions for ${type == MediaType.movie ? "movies" : "TV shows"}.",
            sender: Sender.bot,
          ),
        );
      } else {
        messages.add(
          Message(
            text:
                "Suggestions for ${type == MediaType.movie ? "movies" : "TV shows"}:\n" +
                pagedList.map((e) => e.title ?? "Unknown").join("\n"),
            sender: Sender.bot,
          ),
        );
      }
    } catch (e) {
      messages.add(
        Message(
          text:
              "Error occurred while fetching ${type == MediaType.movie ? "movies" : "TV shows"}: $e",
          sender: Sender.bot,
        ),
      );
    }
  }

  // Update ConversationStep options dynamically based on context
  void _updateDynamicOptions() {
    // Example: if a mediaType was previously selected, add a "Show more" option for that type
    if (selectedMediaTypes.isNotEmpty) {
      final lastType = selectedMediaTypes.last;
      currentStep.options.add(
        PredefinedOption(
          text:
              "Show more ${lastType == MediaType.movie ? "movies" : "TV shows"}",
          type: lastType,
        ),
      );
    }
  }
}
