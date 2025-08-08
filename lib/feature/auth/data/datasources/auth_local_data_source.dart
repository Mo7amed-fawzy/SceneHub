import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Cache user data locally
  Future<void> cacheUser(UserModel user);

  /// Get cached user data
  Future<UserModel?> getCachedUser();

  /// Clear cached user data
  Future<void> clearCachedUser();

  /// Cache auth token
  Future<void> cacheAuthToken(String token);

  /// Get cached auth token
  Future<String?> getCachedAuthToken();

  /// Clear cached auth token
  Future<void> clearCachedAuthToken();

  /// Get cached user ID for quick access
  Future<String?> getCachedUserId();

  /// Get cached user email for quick access
  Future<String?> getCachedUserEmail();

  /// Check if user data is cached
  Future<bool> hasCachedUser();

  /// Get last cache timestamp
  Future<DateTime?> getLastCacheTime();
}
