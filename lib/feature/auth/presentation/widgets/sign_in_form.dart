import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/widgets/custom_btn.dart';
import 'package:ai_movie_app/feature/auth/presentation/base/base_auth_form.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/forgot_password_link.dart';

class SignInForm extends BaseAuthForm {
  const SignInForm({super.key});

  @override
  BaseAuthFormState createState() => _SignInFormState();
}

class _SignInFormState extends BaseAuthFormState {
  @override
  bool get isLoading => false; // Will be managed by cubit state

  @override
  List<Widget> buildFormFields() {
    return [
      buildFormField(
        child: AuthTextField(
          labelText: AppStrings.emailAddress,
          onChanged: (email) {
            context.read<AuthCubit>().emailAddress = email;
          },
        ),
      ),
      buildFormField(
        child: AuthTextField(
          labelText: AppStrings.password,
          isPassword: true,
          onChanged: (password) {
            context.read<AuthCubit>().password = password;
          },
        ),
      ),
      buildFormField(child: const ForgotPasswordLink()),
    ];
  }

  @override
  Widget buildSubmitButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          presentationManager.handleAuthSuccess(context, 'Sign in successful!');
        } else if (state is SigninFailureState) {
          presentationManager.handleAuthFailure(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is SigninLoadingState) {
          return presentationManager.buildLoadingIndicator(
            AppColorsDark.primaryColor,
          );
        }

        return CustomBtn(
          onPressed: () async {
            if (validateForm()) {
              await context.read<AuthCubit>().sigInWithEmailAndPassword();
            }
          },
          text: AppStrings.signIn,
        );
      },
    );
  }

  @override
  Future<void> handleSubmit() async {
    if (validateForm()) {
      await context.read<AuthCubit>().sigInWithEmailAndPassword();
    }
  }
}
