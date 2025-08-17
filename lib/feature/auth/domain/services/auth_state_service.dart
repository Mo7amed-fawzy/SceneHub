import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

/// Domain service for managing authentication state
class AuthStateService {
  final AuthRepository _authRepository;

  const AuthStateService(this._authRepository);

  /// Get the current authentication state
  Future<AuthState> getCurrentAuthState() async {
    final isSignedInResult = await _authRepository.isSignedIn();

    return isSignedInResult.fold(
      (failure) => AuthState.unauthenticated(error: failure.message),
      (isSignedIn) {
        if (isSignedIn) {
          return AuthState.authenticated();
        } else {
          return AuthState.unauthenticated();
        }
      },
    );
  }

  /// Get current user if authenticated
  Future<UserEntity?> getCurrentUser() async {
    final result = await _authRepository.getCurrentUser();
    return result.fold((failure) => null, (user) => user);
  }

  /// Check if email is verified
  Future<bool> isEmailVerified() async {
    final result = await _authRepository.isEmailVerified();
    return result.fold((failure) => false, (isVerified) => isVerified);
  }
}

/// Represents the authentication state
class AuthState {
  final bool isAuthenticated;
  final String? error;
  final UserEntity? user;

  const AuthState._({required this.isAuthenticated, this.error, this.user});

  const AuthState.authenticated({UserEntity? user})
    : isAuthenticated = true,
      error = null,
      user = user;

  const AuthState.unauthenticated({String? error})
    : isAuthenticated = false,
      error = error,
      user = null;

  bool get hasError => error != null;
  bool get isUnauthenticated => !isAuthenticated;
}
