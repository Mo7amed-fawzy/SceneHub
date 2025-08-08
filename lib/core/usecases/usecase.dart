import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';

/// Base class for all use cases
/// T is the return type, P is the parameter type
abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

/// Use case that doesn't require parameters
abstract class NoParamsUseCase<T> {
  Future<Either<Failure, T>> call();
}
