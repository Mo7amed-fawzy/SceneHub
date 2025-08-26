part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class SetNameProfileEvent extends ProfileEvent {
  final String name;

  SetNameProfileEvent({required this.name});
}

class SetEmailProfileEvent extends ProfileEvent {
  final String email;

  SetEmailProfileEvent({required this.email});
}

class SetPhoneNumberProfileEvent extends ProfileEvent {
  final String phoneNumber;

  SetPhoneNumberProfileEvent({required this.phoneNumber});
}

class ClearCacheProfileEvent extends ProfileEvent {}
