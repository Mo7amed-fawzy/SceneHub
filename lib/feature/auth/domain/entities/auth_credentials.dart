class AuthCredentials {
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;

  const AuthCredentials({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthCredentials &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
