import 'package:ai_movie_app/core/functions/print_statement.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_state.dart'
    as myAuth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthCubit extends Cubit<myAuth.AuthState> {
  AuthCubit() : super(myAuth.AuthInitial());

  final supabase = Supabase.instance.client;

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
      emit(myAuth.SignUpLoadingState());

      final response = await supabase.auth.signUp(
        email: emailAddress!,
        password: password!,
        data: {'first_name': firstName, 'last_name': lastName},
      );

      await addUserProfile(response.user?.id ?? '');

      emit(myAuth.SignUpSuccessState());
    } on AuthException catch (e) {
      emit(myAuth.SignUpFailureState(errMessage: e.message));
    } catch (e) {
      emit(myAuth.SignUpFailureState(errMessage: e.toString()));
    }
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(myAuth.SigninLoadingState());

      await supabase.auth.signInWithPassword(
        email: emailAddress!,
        password: password!,
      );

      emit(myAuth.SigninSuccessState());
    } on AuthException catch (e) {
      emit(myAuth.SigninFailureState(errMessage: e.message));
    } catch (e) {
      emit(myAuth.SigninFailureState(errMessage: e.toString()));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(myAuth.ResetPasswordLoadingState());

      await supabase.auth.resetPasswordForEmail(emailAddress!);

      emit(myAuth.ResetPasswordSuccessState());
    } catch (e) {
      emit(myAuth.ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  Future<void> addUserProfile(String userId) async {
    try {
      await supabase.from('users').insert({
        'id': userId,
        'email': emailAddress,
        'first_name': firstName,
        'last_name': lastName,
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      printHere('Error adding user profile: $e');
    }
  }

  void updatesTermsAndConditionsCeckBox({required bool newValue}) {
    termsAndConditionCheckValues = newValue;
    emit(myAuth.TermsAndConditionUpdateState());
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible!;
    emit(myAuth.TogglePasswordVisibilityState());
  }

  Future<bool> isEmailVerified() async {
    final user = supabase.auth.currentUser;
    return user?.emailConfirmedAt != null;
  }
}
