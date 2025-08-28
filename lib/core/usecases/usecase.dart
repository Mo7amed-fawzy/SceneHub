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

class ResultBot<T, E> {
  final T? data;
  final E? error;
  final bool isSuccess;

  ResultBot._({this.data, this.error, required this.isSuccess});

  factory ResultBot.success(T data) => ResultBot._(data: data, isSuccess: true);
  factory ResultBot.failure(E error) =>
      ResultBot._(error: error, isSuccess: false);
}

// abstract class UseCaseBot<Type, Params> {
//   Future<Type> call(Params params);
// }

// class NoParams {}
