// predefined_option.dart
import 'package:ai_movie_app/feature/ai_chat/domain/entities/message.dart';

class PredefinedOption {
  final String text;
  final MediaType? type; // optional, for media selection
  final bool sendsToAI; // true if this option should trigger AI response

  PredefinedOption({required this.text, this.type, this.sendsToAI = false});
}
