import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/custom_btn.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_state.dart'
    // ignore: library_prefixes
    as myAuth;
import 'package:ai_movie_app/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, myAuth.AuthState>(
      listener: (context, state) async {
        if (state is myAuth.SigninSuccessState) {
          // Mock successful signin - navigate to home
          showToast("Sign in successful!");
          customReplacementNavigate(context, homeNavBar);
        } else if (state is myAuth.SigninFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                isPassword: true,
                isPasswordVisible: authCubit.isPasswordVisible!,
                labelText: AppStrings.password,
                onPassowrdPressed: () {
                  authCubit.togglePasswordVisibility();
                },
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(height: 16),
              const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is myAuth.SigninLoadingState
                  ? CircularProgressIndicator(color: AppColorsDark.primaryColor)
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          await authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn,
                    ),
            ],
          ),
        );
      },
    );
  }
}
