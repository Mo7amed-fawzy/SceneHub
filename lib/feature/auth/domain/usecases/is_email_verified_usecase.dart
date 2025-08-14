import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

class IsEmailVerifiedUseCase implements NoParamsUseCase<bool> {
  final AuthRepository repository;

  const IsEmailVerifiedUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await repository.isEmailVerified();
  }
}
