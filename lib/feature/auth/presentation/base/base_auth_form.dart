import 'package:flutter/material.dart';
import 'package:ai_movie_app/feature/auth/presentation/manager/auth_presentation_manager.dart';

/// Base class for all authentication forms
abstract class BaseAuthForm extends StatefulWidget {
  const BaseAuthForm({super.key});

  @override
  BaseAuthFormState createState();
}

abstract class BaseAuthFormState extends State<BaseAuthForm> {
  /// Get the presentation manager instance
  AuthPresentationManager get presentationManager => AuthPresentationManager();

  /// Form key for validation
  late GlobalKey<FormState> formKey;

  /// Loading state
  bool get isLoading;

  /// Build the form fields
  List<Widget> buildFormFields();

  /// Build the submit button
  Widget buildSubmitButton();

  /// Build additional widgets below the form
  List<Widget> buildAdditionalWidgets() => [];

  /// Handle form submission
  Future<void> handleSubmit();

  /// Validate form before submission
  bool validateForm() {
    return presentationManager.validateForm(formKey);
  }

  /// Show loading state
  void showLoading() {
    // This will be handled by the cubit state
  }

  /// Hide loading state
  void hideLoading() {
    // This will be handled by the cubit state
  }

  /// Show success message
  void showSuccess(String message) {
    presentationManager.showSuccessMessage(message);
  }

  /// Show error message
  void showError(String message) {
    presentationManager.showErrorMessage(message);
  }

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Form fields
          ...buildFormFields(),
          
          // Additional widgets
          ...buildAdditionalWidgets(),
          
          // Submit button
          const SizedBox(height: 24),
          buildSubmitButton(),
        ],
      ),
    );
  }

  /// Build a form field with common styling
  Widget buildFormField({
    required Widget child,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: child,
    );
  }

  /// Build a section divider
  Widget buildDivider({
    String? text,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          if (text != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ],
      ),
    );
  }

  /// Build a link button
  Widget buildLinkButton({
    required String text,
    required VoidCallback onPressed,
    TextStyle? style,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style ?? const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  /// Build a social login button
  Widget buildSocialButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: textColor ?? Colors.white),
        label: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
