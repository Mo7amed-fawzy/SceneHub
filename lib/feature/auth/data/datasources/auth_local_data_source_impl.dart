import 'package:ai_movie_app/core/database/cache/app_shared_preferences.dart';
import 'package:ai_movie_app/core/constants/cache_keys.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AppPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      // Cache user data
      await sharedPreferences.saveModel(
        CacheKeys.user,
        user,
        (user) => user.toJson(),
      );

      // Cache user ID separately for quick access
      await sharedPreferences.setData(CacheKeys.userId, user.id);

      // Cache user email for quick access
      await sharedPreferences.setData(CacheKeys.userEmail, user.email);

      // Set last cache timestamp
      await sharedPreferences.setData(
        CacheKeys.lastCacheTime,
        DateTime.now().millisecondsSinceEpoch,
      );
    } catch (e) {
      throw Exception('Failed to cache user: $e');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      // Check if cache is expired (24 hours)
      final lastCacheTime =
          sharedPreferences.getData(CacheKeys.lastCacheTime) as int?;
      if (lastCacheTime != null) {
        final cacheAge = DateTime.now().millisecondsSinceEpoch - lastCacheTime;
        const maxCacheAge = 24 * 60 * 60 * 1000; // 24 hours in milliseconds

        if (cacheAge > maxCacheAge) {
          // Cache expired, clear it
          await clearCachedUser();
          return null;
        }
      }

      return sharedPreferences.getModel(
        CacheKeys.user,
        (json) => UserModel.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to get cached user: $e');
    }
  }

  @override
  Future<void> clearCachedUser() async {
    try {
      await sharedPreferences.removeData(CacheKeys.user);
      await sharedPreferences.removeData(CacheKeys.userId);
      await sharedPreferences.removeData(CacheKeys.userEmail);
      await sharedPreferences.removeData(CacheKeys.lastCacheTime);
    } catch (e) {
      throw Exception('Failed to clear cached user: $e');
    }
  }

  @override
  Future<void> cacheAuthToken(String token) async {
    try {
      await sharedPreferences.setData(CacheKeys.authToken, token);

      // Set token expiry (e.g., 1 hour from now)
      final expiryTime = DateTime.now()
          .add(const Duration(hours: 1))
          .millisecondsSinceEpoch;
      await sharedPreferences.setData(CacheKeys.tokenExpiry, expiryTime);
    } catch (e) {
      throw Exception('Failed to cache auth token: $e');
    }
  }

  @override
  Future<String?> getCachedAuthToken() async {
    try {
      final token = sharedPreferences.getData(CacheKeys.authToken) as String?;
      if (token == null) return null;

      // Check if token is expired
      final expiryTime =
          sharedPreferences.getData(CacheKeys.tokenExpiry) as int?;
      if (expiryTime != null &&
          DateTime.now().millisecondsSinceEpoch > expiryTime) {
        // Token expired, clear it
        await clearCachedAuthToken();
        return null;
      }

      return token;
    } catch (e) {
      throw Exception('Failed to get cached auth token: $e');
    }
  }

  @override
  Future<void> clearCachedAuthToken() async {
    try {
      await sharedPreferences.removeData(CacheKeys.authToken);
      await sharedPreferences.removeData(CacheKeys.tokenExpiry);
    } catch (e) {
      throw Exception('Failed to clear cached auth token: $e');
    }
  }

  @override
  /// Get cached user ID for quick access
  Future<String?> getCachedUserId() async {
    try {
      return sharedPreferences.getData(CacheKeys.userId) as String?;
    } catch (e) {
      return null;
    }
  }

  @override
  /// Get cached user email for quick access
  Future<String?> getCachedUserEmail() async {
    try {
      return sharedPreferences.getData(CacheKeys.userEmail) as String?;
    } catch (e) {
      return null;
    }
  }

  @override
  /// Check if user data is cached
  Future<bool> hasCachedUser() async {
    try {
      final userId = await getCachedUserId();
      return userId != null;
    } catch (e) {
      return false;
    }
  }

  @override
  /// Get last cache timestamp
  Future<DateTime?> getLastCacheTime() async {
    try {
      final timestamp =
          sharedPreferences.getData(CacheKeys.lastCacheTime) as int?;
      if (timestamp != null) {
        return DateTime.fromMillisecondsSinceEpoch(timestamp);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
