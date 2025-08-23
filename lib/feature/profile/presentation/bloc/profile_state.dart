part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  ProfileLoaded({required this.profile});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}

class SetNameProfileLoading extends ProfileState {}

class SetNameProfileSuccess extends ProfileState {}

class SetNameProfileError extends ProfileState {
  final String message;

  SetNameProfileError({required this.message});
}

class SetEmailProfileLoading extends ProfileState {}

class SetEmailProfileSuccess extends ProfileState {}

class SetEmailProfileError extends ProfileState {
  final String message;

  SetEmailProfileError({required this.message});
}

class SetPhoneNumberProfileLoading extends ProfileState {}

class SetPhoneNumberProfileSuccess extends ProfileState {}

class SetPhoneNumberProfileError extends ProfileState {
  final String message;

  SetPhoneNumberProfileError({required this.message});
}

class ClearCacheProfileLoading extends ProfileState {}

class ClearCacheProfileSuccess extends ProfileState {}

class ClearCacheProfileError extends ProfileState {
  final String message;

  ClearCacheProfileError({required this.message});
}
