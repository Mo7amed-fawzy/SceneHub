import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase implements NoParamsUseCase<UserEntity?> {
  final AuthRepository repository;

  const GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call() async {
    return await repository.getCurrentUser();
  }
}
