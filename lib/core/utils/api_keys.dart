import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static final String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static final String supabaseServiceKey =
      dotenv.env['SUPABASE_SERVICE_KEY'] ?? '';

  static final String weatherApiBaseUrl =
      dotenv.env['WEATHER_API_BASE_URL'] ?? '';
  static final String weatherApiKey = dotenv.env['WEATHER_API_KEY'] ?? '';

  static final String localServerUrl = dotenv.env['LOCAL_SERVER_URL'] ?? '';

  // TMDB API Configuration
  static final String movieApiBaseUrl = dotenv.env['MOVIE_API_BASE_URL'] ?? '';
  static final String tmdbApiKey =
      dotenv.env['MOVIE_API_KEY'] ?? ''; // v3 API key
  static final String movieApiReadAccessToken =
      dotenv.env['MOVIE_API_READ_ACCESS_TOKEN'] ?? ''; // v4 access token
}
