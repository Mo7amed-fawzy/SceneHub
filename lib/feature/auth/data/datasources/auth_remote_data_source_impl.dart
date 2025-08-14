import 'package:ai_movie_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ai_movie_app/feature/auth/data/models/user_model.dart';
import 'package:ai_movie_app/feature/auth/data/services/auth_network_service.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthNetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<UserModel> signUp(AuthCredentials credentials) async {
    return await _networkService.signUpWithRetry(credentials);
  }

  @override
  Future<UserModel> signIn(AuthCredentials credentials) async {
    return await _networkService.signInWithRetry(credentials);
  }

  @override
  Future<void> signOut() async {
    // For signOut, we don't need retry logic as it's a simple operation
    // Just make a simple API call
    try {
      // Simple signout call without retry
      // This could be implemented in the network service if needed
      // For now, just return successfully
    } catch (e) {
      // Ignore signout errors as we want to clear local data anyway
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    await _networkService.resetPasswordWithRetry(email);
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    return await _networkService.fetchUserDataWithRetry();
  }

  @override
  Future<bool> isSignedIn() async {
    return await _networkService.checkAuthStatusWithRetry();
  }

  @override
  Future<bool> isEmailVerified() async {
    return await _networkService.checkEmailVerificationWithRetry();
  }

  @override
  Future<void> sendEmailVerification() async {
    await _networkService.sendEmailVerificationWithRetry();
  }
}
