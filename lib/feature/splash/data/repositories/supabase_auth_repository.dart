import 'package:ai_movie_app/feature/splash/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }
}
