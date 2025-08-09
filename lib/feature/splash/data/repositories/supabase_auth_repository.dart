import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/repositories/auth_repository.dart';

class SupabaseAuthRepository implements AuthRepository {
  @override
  dynamic getCurrentUser() {
    return Supabase.instance.client.auth.currentUser;
  }
}
