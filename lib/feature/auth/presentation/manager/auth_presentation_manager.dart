import 'package:flutter/material.dart';
import 'package:ai_movie_app/core/functions/navigation.dart';
import 'package:ai_movie_app/core/routes/app_router.dart';
import 'package:ai_movie_app/core/functions/custom_toast.dart';

/// Manages presentation logic for the authentication feature
class AuthPresentationManager {
  static final AuthPresentationManager _instance =
      AuthPresentationManager._internal();
  factory AuthPresentationManager() => _instance;
  AuthPresentationManager._internal();

  /// Navigate to sign up page
  void navigateToSignUp(BuildContext context) {
    customReplacementNavigate(context, signUpPage);
  }

  /// Navigate to sign in page
  void navigateToSignIn(BuildContext context) {
    customReplacementNavigate(context, signInPage);
  }

  /// Navigate to forgot password page
  void navigateToForgotPassword(BuildContext context) {
    customReplacementNavigate(context, forgotPassword);
  }

  /// Navigate to home page after successful authentication
  void navigateToHome(BuildContext context) {
    customReplacementNavigate(context, homeNavBar);
  }

  /// Navigate back to previous page
  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  /// Show success message
  void showSuccessMessage(String message) {
    showToast(message);
  }

  /// Show error message
  void showErrorMessage(String message) {
    showToast(message);
  }

  /// Show loading indicator
  Widget buildLoadingIndicator(Color color) {
    return CircularProgressIndicator(color: color);
  }

  /// Build error text widget
  Widget buildErrorText(String error, {Color? color}) {
    return Text(
      error,
      style: TextStyle(
        color: color ?? Colors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// Build success text widget
  Widget buildSuccessText(String message, {Color? color}) {
    return Text(
      message,
      style: TextStyle(
        color: color ?? Colors.green,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// Handle authentication success
  void handleAuthSuccess(BuildContext context, String message) {
    showSuccessMessage(message);
    navigateToHome(context);
  }

  /// Handle authentication failure
  void handleAuthFailure(BuildContext context, String error) {
    showErrorMessage(error);
  }

  /// Validate form and show error if invalid
  bool validateForm(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() == true) {
      return true;
    }
    return false;
  }

  /// Build responsive padding based on screen size
  EdgeInsets buildResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return const EdgeInsets.symmetric(horizontal: 32.0);
    } else if (screenWidth > 400) {
      return const EdgeInsets.symmetric(horizontal: 24.0);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16.0);
    }
  }

  /// Build responsive spacing based on screen size
  double buildResponsiveSpacing(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight > 800) {
      return 32.0;
    } else if (screenHeight > 600) {
      return 24.0;
    } else {
      return 16.0;
    }
  }
}
