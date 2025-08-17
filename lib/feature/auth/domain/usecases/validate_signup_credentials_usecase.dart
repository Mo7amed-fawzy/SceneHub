import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_validation_result.dart';

class ValidateSignupCredentialsUseCase implements UseCase<AuthValidationResult, AuthCredentials> {
  const ValidateSignupCredentialsUseCase();

  @override
  Future<Either<Failure, AuthValidationResult>> call(AuthCredentials credentials) async {
    final errors = <String>[];
    final fieldErrors = <String, String>{};

    // First name validation
    if (credentials.firstName == null || credentials.firstName!.isEmpty) {
      fieldErrors['firstName'] = 'First name is required';
    } else if (credentials.firstName!.length < 2) {
      fieldErrors['firstName'] = 'First name must be at least 2 characters';
    }

    // Last name validation
    if (credentials.lastName == null || credentials.lastName!.isEmpty) {
      fieldErrors['lastName'] = 'Last name is required';
    } else if (credentials.lastName!.length < 2) {
      fieldErrors['lastName'] = 'Last name must be at least 2 characters';
    }

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
    } else if (!_isStrongPassword(credentials.password)) {
      fieldErrors['password'] = 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
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

  bool _isStrongPassword(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasNumbers = password.contains(RegExp(r'[0-9]'));
    
    return hasUppercase && hasLowercase && hasNumbers;
  }
}
