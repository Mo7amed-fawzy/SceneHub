import 'package:ai_movie_app/core/network/api_consumer.dart';
import 'package:ai_movie_app/core/constants/endpoint_constants.dart';
import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';

/// Service responsible for all authentication-related API calls
class AuthApiService {
  final ApiConsumer _apiConsumer;

  AuthApiService(this._apiConsumer);

  /// Sign up a new user
  Future<UserModel> signUp(AuthCredentials credentials) async {
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
  }

  /// Sign in an existing user
  Future<UserModel> signIn(AuthCredentials credentials) async {
    final response = await _apiConsumer.post(
      EndpointConstants.signIn,
      body: {'email': credentials.email, 'password': credentials.password},
    );

    return UserModel.fromJson(response);
  }

  /// Sign out the current user
  Future<void> signOut() async {
    await _apiConsumer.post(EndpointConstants.signOut);
  }

  /// Reset password by sending email
  Future<void> resetPassword(String email) async {
    await _apiConsumer.post(
      EndpointConstants.resetPassword,
      body: {'email': email},
    );
  }

  /// Get current user information
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiConsumer.get(EndpointConstants.currentUser);
      return UserModel.fromJson(response);
    } catch (e) {
      // Return null if user is not authenticated
      return null;
    }
  }

  /// Check if user is signed in
  Future<bool> isSignedIn() async {
    try {
      await _apiConsumer.get(EndpointConstants.currentUser);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if email is verified
  Future<bool> isEmailVerified() async {
    try {
      final response = await _apiConsumer.get(EndpointConstants.currentUser);
      final user = UserModel.fromJson(response);
      return user.isEmailVerified;
    } catch (e) {
      return false;
    }
  }

  /// Send email verification
  Future<void> sendEmailVerification() async {
    await _apiConsumer.post(EndpointConstants.verifyEmail);
  }

  /// Refresh authentication token
  Future<void> refreshToken() async {
    await _apiConsumer.post(EndpointConstants.refreshToken);
  }
}
