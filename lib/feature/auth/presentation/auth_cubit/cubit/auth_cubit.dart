import 'package:ai_movie_app/feature/auth/domain/entities/auth_credentials.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/is_email_verified_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/is_signed_in_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/send_email_verification_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/signup_with_validation_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/signin_with_validation_usecase.dart';
import 'package:ai_movie_app/feature/auth/domain/usecases/map_auth_failure_to_message_usecase.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_state.dart'
    as auth_state;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<auth_state.AuthState> {
  final SignupWithValidationUseCase signupWithValidationUseCase;
  final SigninWithValidationUseCase signinWithValidationUseCase;
  final SignOutUseCase signOutUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final IsSignedInUseCase isSignedInUseCase;
  final IsEmailVerifiedUseCase isEmailVerifiedUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final MapAuthFailureToMessageUseCase mapFailureToMessageUseCase;

  AuthCubit({
    required this.signupWithValidationUseCase,
    required this.signinWithValidationUseCase,
    required this.signOutUseCase,
    required this.resetPasswordUseCase,
    required this.getCurrentUserUseCase,
    required this.isSignedInUseCase,
    required this.isEmailVerifiedUseCase,
    required this.sendEmailVerificationUseCase,
    required this.mapFailureToMessageUseCase,
  }) : super(auth_state.AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  bool? termsAndConditionCheckValues = false;
  bool? isPasswordVisible = false;

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(auth_state.SignUpLoadingState());

      final credentials = AuthCredentials(
        email: emailAddress!,
        password: password!,
        firstName: firstName,
        lastName: lastName,
      );

      final result = await signupWithValidationUseCase(credentials);

      result.fold(
        (failure) async {
          final errorMessage = await mapFailureToMessageUseCase(failure);
          errorMessage.fold(
            (errorFailure) => emit(
              auth_state.SignUpFailureState(
                errMessage: 'Error mapping failure',
              ),
            ),
            (message) =>
                emit(auth_state.SignUpFailureState(errMessage: message)),
          );
        },
        (user) {
          emit(auth_state.SignUpSuccessState());
        },
      );
    } catch (e) {
      emit(auth_state.SignUpFailureState(errMessage: 'Signup failed: $e'));
    }
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(auth_state.SigninLoadingState());

      final credentials = AuthCredentials(
        email: emailAddress!,
        password: password!,
      );

      final result = await signinWithValidationUseCase(credentials);

      result.fold(
        (failure) async {
          final errorMessage = await mapFailureToMessageUseCase(failure);
          errorMessage.fold(
            (errorFailure) => emit(
              auth_state.SigninFailureState(
                errMessage: 'Error mapping failure',
              ),
            ),
            (message) =>
                emit(auth_state.SigninFailureState(errMessage: message)),
          );
        },
        (user) {
          emit(auth_state.SigninSuccessState());
        },
      );
    } catch (e) {
      emit(auth_state.SigninFailureState(errMessage: 'Signin failed: $e'));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(auth_state.ResetPasswordLoadingState());

      final result = await resetPasswordUseCase(emailAddress!);

      result.fold(
        (failure) async {
          final errorMessage = await mapFailureToMessageUseCase(failure);
          errorMessage.fold(
            (errorFailure) => emit(
              auth_state.ResetPasswordFailureState(
                errMessage: 'Error mapping failure',
              ),
            ),
            (message) =>
                emit(auth_state.ResetPasswordFailureState(errMessage: message)),
          );
        },
        (_) {
          emit(auth_state.ResetPasswordSuccessState());
        },
      );
    } catch (e) {
      emit(
        auth_state.ResetPasswordFailureState(
          errMessage: 'Password reset failed: $e',
        ),
      );
    }
  }

  void updatesTermsAndConditionsCeckBox({required bool newValue}) {
    termsAndConditionCheckValues = newValue;
    emit(auth_state.TermsAndConditionUpdateState());
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible!;
    emit(auth_state.TogglePasswordVisibilityState());
  }

  Future<bool> isEmailVerified() async {
    final result = await isEmailVerifiedUseCase();
    return result.fold((failure) => false, (isVerified) => isVerified);
  }
}
