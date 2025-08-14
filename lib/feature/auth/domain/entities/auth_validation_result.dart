class AuthValidationResult {
  final bool isValid;
  final List<String> errors;
  final Map<String, String> fieldErrors;

  const AuthValidationResult({
    required this.isValid,
    this.errors = const [],
    this.fieldErrors = const {},
  });

  const AuthValidationResult.success()
    : isValid = true,
      errors = const [],
      fieldErrors = const {};

  const AuthValidationResult.failure({
    List<String> errors = const [],
    Map<String, String> fieldErrors = const {},
  }) : isValid = false,
       errors = errors,
       fieldErrors = fieldErrors;

  bool get hasFieldErrors => fieldErrors.isNotEmpty;
  bool get hasGeneralErrors => errors.isNotEmpty;
}
