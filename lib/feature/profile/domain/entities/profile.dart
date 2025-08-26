import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String email;
  final String? phoneNumber;

  const Profile({required this.name, required this.email, this.phoneNumber});

  const Profile.empty() : this(name: "", email: "", phoneNumber: "");

  @override
  List<Object> get props => [name, email];
}
