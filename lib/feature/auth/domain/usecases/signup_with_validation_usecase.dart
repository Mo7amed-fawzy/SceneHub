import 'package:dartz/dartz.dart';
import 'package:ai_movie_app/core/errors/failures.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/entities/user_entity.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/validate_signup_credentials_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/sign_up_usecase.dart';

class SignupWithValidationUseCase
    implements UseCase<UserEntity, AuthCredentials> {
  final ValidateSignupCredentialsUseCase validateUseCase;
  final SignUpUseCase signUpUseCase;

  const SignupWithValidationUseCase({
    required this.validateUseCase,
    required this.signUpUseCase,
  });

  @override
  Future<Either<Failure, UserEntity>> call(AuthCredentials credentials) async {
    // First validate the credentials
    final validationResult = await validateUseCase(credentials);

    return validationResult.fold((failure) => Left(failure), (validation) {
      if (!validation.isValid) {
        // Create a validation failure with the first error message
        final errorMessage = validation.fieldErrors.isNotEmpty
            ? validation.fieldErrors.values.first
            : validation.errors.isNotEmpty
            ? validation.errors.first
            : 'Validation failed';
        return Left(AuthFailure(errorMessage));
      }

      // If validation passes, proceed with signup
      return signUpUseCase(credentials);
    });
  }
}
