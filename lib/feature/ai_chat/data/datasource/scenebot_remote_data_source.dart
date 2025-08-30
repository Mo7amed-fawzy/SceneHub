import 'dart:convert';
import 'package:ai_movie_app/core/utils/api_keys.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/ai_response.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/movie_image.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ScenebotRemoteDatasource {
  late final GenerativeModel _gemini;

  ScenebotRemoteDatasource() {
    _gemini = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: EnvConfig.googleCloudApiKey,
    );
  }

  String _extractJson(String responseText) {
    final jsonStart = responseText.indexOf('{');
    final jsonEnd = responseText.lastIndexOf('}');
    if (jsonStart == -1 || jsonEnd == -1) {
      throw Exception('JSON data not found in the response');
    }
    return responseText.substring(jsonStart, jsonEnd + 1);
  }

  /// Ask Gemini (Scenebot AI) any movie-related question
  Future<AIResponse> askScenebot(String query) async {
    try {
      final prompt =
          '''
      You are an AI assistant called "Scenebot".
      You help users with movie-related information (recommendations, cast details, summaries, trivia).
      Return the response ONLY in JSON with this structure:
      {
        "message": "main answer text",
        "suggestions": ["option1", "option2"],
        "source": "Gemini"
      }

      Question: $query
      ''';

      final response = await _gemini.generateContent([Content.text(prompt)]);
      final jsonString = _extractJson(response.text!.trim());
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return AIResponse.fromJson(jsonMap);
    } catch (e) {
      throw Exception('Error fetching AI response: $e');
    }
  }

  /// (Optional) Get movie poster (from TMDB API)
  Future<MovieImage> getMoviePoster(Map<String, dynamic> json) async {
    return MovieImage.fromJson(json);
  }
}
