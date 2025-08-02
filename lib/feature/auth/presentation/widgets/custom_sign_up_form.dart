import 'package:ai_movie_app/core/functions/custom_toast.dart';
import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/utils/app_colors.dart';
import 'package:ai_movie_app/core/utils/app_strings.dart';
import 'package:ai_movie_app/core/widgets/custom_btn.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:ai_movie_app/feature/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:ai_movie_app/feature/auth/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast('Successfully, check your email to verify your account');
          customReplacementNavigate(context, signInPage);
        } else if (state is SignUpFailureState) {
          showToast(state.errMessage, AppColors.tertiaryColor);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        bool isLoading = state is SignUpLoadingState;

        return Form(
          // بقدر من خلالو اتحكم فالفورم بتعتي
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  authCubit.firstName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
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
              const TermsAndConditionWidget(),
              const SizedBox(height: 80),
              CustomBtn(
                color: authCubit.termsAndConditionCheckValues == false
                    ? AppColors.primaryColor
                    : null,
                onPressed: () async {
                  if (authCubit.termsAndConditionCheckValues == true) {
                    if (authCubit.signUpFormKey.currentState!.validate()) {
                      await authCubit.createUserWithEmailAndPassword();
                    }
                  }
                },
                text: isLoading ? '' : AppStrings.signUp, // isLoading == false
                customWidget: isLoading
                    ? CircularProgressIndicator(color: AppColors.save)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
