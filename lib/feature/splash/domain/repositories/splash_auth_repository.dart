import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SplashAuthRepository {
  /// Returns the currently authenticated user, or null if not signed in.
  User? getCurrentUser();
}
