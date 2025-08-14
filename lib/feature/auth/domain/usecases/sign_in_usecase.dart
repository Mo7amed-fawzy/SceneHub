import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<UserEntity, AuthCredentials> {
  final AuthRepository repository;

  const SignInUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(AuthCredentials credentials) async {
    return await repository.signIn(credentials);
  }
}
