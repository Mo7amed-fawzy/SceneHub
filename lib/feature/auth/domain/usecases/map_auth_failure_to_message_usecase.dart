import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';

class MapAuthFailureToMessageUseCase implements UseCase<String, Failure> {
  const MapAuthFailureToMessageUseCase();

  @override
  Future<Either<Failure, String>> call(Failure failure) async {
    final message = _mapFailureToMessage(failure);
    return Right(message);
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is CacheFailure) {
      return failure.message;
    } else if (failure is AuthFailure) {
      return 'Authentication error: ${failure.message}';
    } else {
      return 'Unexpected error occurred';
    }
  }
}
