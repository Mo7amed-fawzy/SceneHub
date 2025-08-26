// conversation_step.dart

import 'package:ai_movie_app/feature/ai_chat/domain/entities/predefined_option.dart';

class ConversationStep {
  final String botMessage;
  final List<PredefinedOption> options;

  ConversationStep({required this.botMessage, this.options = const []});
}
