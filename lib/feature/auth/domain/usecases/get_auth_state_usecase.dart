import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/services/auth_state_service.dart';

class GetAuthStateUseCase implements NoParamsUseCase<AuthState> {
  final AuthStateService _authStateService;

  const GetAuthStateUseCase(this._authStateService);

  @override
  Future<Either<Failure, AuthState>> call() async {
    try {
      final authState = await _authStateService.getCurrentAuthState();
      return Right(authState);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
