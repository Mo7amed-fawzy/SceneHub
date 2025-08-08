import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase implements NoParamsUseCase<void> {
  final AuthRepository repository;

  const SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
