import 'dart:convert';

import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/feature/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.name,
    required super.email,
    super.phoneNumber,
  });

  const ProfileModel.empty()
    : this(name: "name", email: 'email', phoneNumber: "phoneNumber");

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  ProfileModel copyWith({String? name, String? email, String? phoneNumber}) {
    return ProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  DataMap toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'phoneNumber': this.phoneNumber,
    };
  }

  ProfileModel.fromMap(DataMap map)
    : this(
        name: map['name'] as String,
        email: map['email'] as String,
        phoneNumber: map['phoneNumber'] as String,
      );

  @override
  List<Object> get props => [name, email];
}
