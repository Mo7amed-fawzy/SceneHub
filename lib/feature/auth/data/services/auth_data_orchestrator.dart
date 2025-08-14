import 'package:ai_movie_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';

/// Orchestrates data fetching between local and remote sources
/// Implements smart caching strategies and offline-first approach
class AuthDataOrchestrator {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthDataOrchestrator({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  /// Smart user data fetching with offline-first approach
  Future<UserModel?> fetchUserData({
    bool forceRefresh = false,
    Duration? maxCacheAge,
  }) async {
    try {
      // If not forcing refresh, try local cache first
      if (!forceRefresh) {
        final cachedUser = await _localDataSource.getCachedUser();
        if (cachedUser != null) {
          // Check if cache is still valid
          if (maxCacheAge != null) {
            final lastCacheTime = await _localDataSource.getLastCacheTime();
            if (lastCacheTime != null) {
              final cacheAge = DateTime.now().difference(lastCacheTime);
              if (cacheAge < maxCacheAge) {
                return cachedUser;
              }
            }
          } else {
            return cachedUser;
          }
        }
      }

      // Fetch from remote and update cache
      final remoteUser = await _remoteDataSource.getCurrentUser();
      if (remoteUser != null) {
        await _localDataSource.cacheUser(remoteUser);
      }
      return remoteUser;
    } catch (e) {
      // If remote fails, return cached data as fallback
      if (!forceRefresh) {
        try {
          return await _localDataSource.getCachedUser();
        } catch (_) {
          return null;
        }
      }
      rethrow;
    }
  }

  /// Smart authentication state checking
  Future<bool> checkAuthenticationState({
    bool checkRemote = true,
    Duration? maxCacheAge,
  }) async {
    try {
      // Check local cache first
      final hasCachedUser = await _localDataSource.hasCachedUser();
      if (hasCachedUser) {
        // If we have cached user, check if cache is still valid
        if (maxCacheAge != null) {
          final lastCacheTime = await _localDataSource.getLastCacheTime();
          if (lastCacheTime != null) {
            final cacheAge = DateTime.now().difference(lastCacheTime);
            if (cacheAge < maxCacheAge) {
              return true;
            }
          }
        } else {
          return true;
        }
      }

      // If local check fails or cache is expired, check remote
      if (checkRemote) {
        final isRemoteSignedIn = await _remoteDataSource.isSignedIn();
        return isRemoteSignedIn;
      }

      return false;
    } catch (e) {
      // If remote check fails, return local state as fallback
      return await _localDataSource.hasCachedUser();
    }
  }

  /// Smart email verification checking
  Future<bool> checkEmailVerification({
    bool checkRemote = true,
    Duration? maxCacheAge,
  }) async {
    try {
      // Check local cache first
      final cachedUser = await _localDataSource.getCachedUser();
      if (cachedUser != null) {
        // If we have cached user, check if cache is still valid
        if (maxCacheAge != null) {
          final lastCacheTime = await _localDataSource.getLastCacheTime();
          if (lastCacheTime != null) {
            final cacheAge = DateTime.now().difference(lastCacheTime);
            if (cacheAge < maxCacheAge) {
              return cachedUser.isEmailVerified;
            }
          }
        } else {
          return cachedUser.isEmailVerified;
        }
      }

      // If local check fails or cache is expired, check remote
      if (checkRemote) {
        final isRemoteVerified = await _remoteDataSource.isEmailVerified();
        return isRemoteVerified;
      }

      return false;
    } catch (e) {
      // If remote check fails, return local state as fallback
      final cachedUser = await _localDataSource.getCachedUser();
      return cachedUser?.isEmailVerified ?? false;
    }
  }

  /// Batch data synchronization
  Future<void> syncUserData() async {
    try {
      final remoteUser = await _remoteDataSource.getCurrentUser();
      if (remoteUser != null) {
        await _localDataSource.cacheUser(remoteUser);
      }
    } catch (e) {
      // Log error but don't fail the sync
      // TODO: Replace with proper logging service
      print('Failed to sync user data: $e');
    }
  }

  /// Clear all cached data
  Future<void> clearAllCachedData() async {
    await _localDataSource.clearCachedUser();
    await _localDataSource.clearCachedAuthToken();
  }
}
