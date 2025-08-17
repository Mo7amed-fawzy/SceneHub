import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';

/// Service responsible for network operations with retry logic and error handling
class AuthNetworkService {
  final ApiConsumer _apiConsumer;
  final int _maxRetries;
  final Duration _retryDelay;

  AuthNetworkService(
    this._apiConsumer, {
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  })  : _maxRetries = maxRetries,
        _retryDelay = retryDelay;

  /// Fetch user data with retry logic
  Future<UserModel?> fetchUserDataWithRetry() async {
    return await _executeWithRetry(() async {
      final response = await _apiConsumer.get(EndpointConstants.currentUser);
      return UserModel.fromJson(response);
    });
  }

  /// Check authentication status with retry logic
  Future<bool> checkAuthStatusWithRetry() async {
    return await _executeWithRetry(() async {
      await _apiConsumer.get(EndpointConstants.currentUser);
      return true;
    }, defaultValue: false);
  }

  /// Check email verification with retry logic
  Future<bool> checkEmailVerificationWithRetry() async {
    return await _executeWithRetry(() async {
      final response = await _apiConsumer.get(EndpointConstants.currentUser);
      final user = UserModel.fromJson(response);
      return user.isEmailVerified;
    }, defaultValue: false);
  }

  /// Sign up with retry logic
  Future<UserModel> signUpWithRetry(AuthCredentials credentials) async {
    return await _executeWithRetry(() async {
      final response = await _apiConsumer.post(
        EndpointConstants.signUp,
        body: {
          'email': credentials.email,
          'password': credentials.password,
          if (credentials.firstName != null) 'firstName': credentials.firstName,
          if (credentials.lastName != null) 'lastName': credentials.lastName,
        },
      );
      return UserModel.fromJson(response);
    });
  }

  /// Sign in with retry logic
  Future<UserModel> signInWithRetry(AuthCredentials credentials) async {
    return await _executeWithRetry(() async {
      final response = await _apiConsumer.post(
        EndpointConstants.signIn,
        body: {
          'email': credentials.email,
          'password': credentials.password,
        },
      );
      return UserModel.fromJson(response);
    });
  }

  /// Reset password with retry logic
  Future<void> resetPasswordWithRetry(String email) async {
    await _executeWithRetry(() async {
      await _apiConsumer.post(
        EndpointConstants.resetPassword,
        body: {'email': email},
      );
    });
  }

  /// Send email verification with retry logic
  Future<void> sendEmailVerificationWithRetry() async {
    await _executeWithRetry(() async {
      await _apiConsumer.post(EndpointConstants.verifyEmail);
    });
  }

  /// Refresh token with retry logic
  Future<void> refreshTokenWithRetry() async {
    await _executeWithRetry(() async {
      await _apiConsumer.post(EndpointConstants.refreshToken);
    });
  }

  /// Generic retry logic for network operations
  Future<T> _executeWithRetry<T>(
    Future<T> Function() operation, {
    T? defaultValue,
  }) async {
    int attempts = 0;
    Exception? lastException;

    while (attempts < _maxRetries) {
      try {
        return await operation();
      } catch (e) {
        lastException = e is Exception ? e : Exception(e.toString());
        attempts++;

        if (attempts < _maxRetries) {
          // Wait before retrying
          await Future.delayed(_retryDelay * attempts);
        }
      }
    }

    // If we have a default value, return it
    if (defaultValue != null) {
      return defaultValue;
    }

    // Otherwise, rethrow the last exception
    throw lastException ?? Exception('Operation failed after $_maxRetries attempts');
  }

  /// Check network connectivity
  Future<bool> isNetworkAvailable() async {
    try {
      // Simple network check - try to make a lightweight request
      await _apiConsumer.get(EndpointConstants.currentUser);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get network latency
  Future<Duration> getNetworkLatency() async {
    final stopwatch = Stopwatch()..start();
    try {
      await _apiConsumer.get(EndpointConstants.currentUser);
      stopwatch.stop();
      return stopwatch.elapsed;
    } catch (e) {
      stopwatch.stop();
      return Duration.zero;
    }
  }
}
