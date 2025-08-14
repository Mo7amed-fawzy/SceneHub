class UserEntity {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final bool isEmailVerified;
  final DateTime? createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.isEmailVerified = false,
    this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
