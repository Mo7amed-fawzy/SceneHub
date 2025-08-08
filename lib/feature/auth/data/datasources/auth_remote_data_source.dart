import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';

abstract class AuthRemoteDataSource {
  /// Sign up a new user with email and password
  Future<UserModel> signUp(AuthCredentials credentials);
  
  /// Sign in an existing user with email and password
  Future<UserModel> signIn(AuthCredentials credentials);
  
  /// Sign out the current user
  Future<void> signOut();
  
  /// Reset password by sending email
  Future<void> resetPassword(String email);
  
  /// Get current user
  Future<UserModel?> getCurrentUser();
  
  /// Check if user is signed in
  Future<bool> isSignedIn();
  
  /// Check if email is verified
  Future<bool> isEmailVerified();
  
  /// Send email verification
  Future<void> sendEmailVerification();
}
