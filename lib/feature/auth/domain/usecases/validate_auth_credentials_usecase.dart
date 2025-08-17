import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_validation_result.dart';

class ValidateAuthCredentialsUseCase implements UseCase<AuthValidationResult, AuthCredentials> {
  const ValidateAuthCredentialsUseCase();

  @override
  Future<Either<Failure, AuthValidationResult>> call(AuthCredentials credentials) async {
    final errors = <String>[];
    final fieldErrors = <String, String>{};

    // Email validation
    if (credentials.email.isEmpty) {
      fieldErrors['email'] = 'Email is required';
    } else if (!_isValidEmail(credentials.email)) {
      fieldErrors['email'] = 'Please enter a valid email address';
    }

    // Password validation
    if (credentials.password.isEmpty) {
      fieldErrors['password'] = 'Password is required';
    } else if (credentials.password.length < 6) {
      fieldErrors['password'] = 'Password must be at least 6 characters';
    }

    // Check if there are any field errors
    if (fieldErrors.isNotEmpty) {
      return Right(AuthValidationResult.failure(fieldErrors: fieldErrors));
    }

    // Check if there are any general errors
    if (errors.isNotEmpty) {
      return Right(AuthValidationResult.failure(errors: errors));
    }

    return const Right(AuthValidationResult.success());
  }

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }
}
