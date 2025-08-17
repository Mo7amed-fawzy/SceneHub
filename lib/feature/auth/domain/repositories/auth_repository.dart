import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';

abstract class AuthRepository {
  /// Sign up a new user with email and password
  Future<Either<Failure, UserEntity>> signUp(AuthCredentials credentials);

  /// Sign in an existing user with email and password
  Future<Either<Failure, UserEntity>> signIn(AuthCredentials credentials);

  /// Sign out the current user
  Future<Either<Failure, void>> signOut();

  /// Reset password by sending email
  Future<Either<Failure, void>> resetPassword(String email);

  /// Get current user
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Check if user is signed in
  Future<Either<Failure, bool>> isSignedIn();

  /// Check if email is verified
  Future<Either<Failure, bool>> isEmailVerified();

  /// Send email verification
  Future<Either<Failure, void>> sendEmailVerification();
}
