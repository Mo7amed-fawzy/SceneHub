class AIResponse {
  final String message;
  final List<String>? suggestions;
  final String? source; // e.g. "Gemini" or "TMDB"

  AIResponse({required this.message, this.suggestions, this.source});

  factory AIResponse.fromJson(Map<String, dynamic> json) {
    return AIResponse(
      message: json['message'] as String,
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((s) => s as String)
          .toList(),
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'suggestions': suggestions, 'source': source};
  }
}
