import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  /// Returns the currently authenticated user, or null if not signed in.
  User? getCurrentUser();
}
