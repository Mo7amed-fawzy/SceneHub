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
}
