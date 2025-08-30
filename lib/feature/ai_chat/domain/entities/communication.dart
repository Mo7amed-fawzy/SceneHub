class AIResponse {
  final String message;
  final List<String>? suggestions;
  final String? source; // optional (e.g. "Gemini" or "TMDB")

  AIResponse({required this.message, this.suggestions, this.source});
}

enum Sender { user, ai }

class Message {
  final String text;
  final Sender sender;
  final List<String>? suggestions;
  Message({required this.text, required this.sender, this.suggestions});
}
