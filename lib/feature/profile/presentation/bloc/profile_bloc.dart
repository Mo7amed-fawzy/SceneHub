import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile.dart';
import '../../domain/usecase/clear_cache_use_case.dart';
import '../../domain/usecase/get_user_use_case.dart';
import '../../domain/usecase/set_email_use_case.dart';
import '../../domain/usecase/set_name_use_case.dart';
import '../../domain/usecase/set_phone_number_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserUseCase _getUserUseCase;
  final SetNameUseCase _setNameUseCase;
  final SetEmailUseCase _setEmailUseCase;
  final SetPhoneNumberUseCase _setPhoneNumberUseCase;
  final ClearCacheUseCase _clearCacheUseCase;

  ProfileBloc({
    required GetUserUseCase getUserUseCase,
    required SetNameUseCase setNameUseCase,
    required SetEmailUseCase setEmailUseCase,
    required SetPhoneNumberUseCase setPhoneNumberUseCase,
    required ClearCacheUseCase clearCacheUseCase,
  }) : _getUserUseCase = getUserUseCase,
       _setNameUseCase = setNameUseCase,
       _setEmailUseCase = setEmailUseCase,
       _setPhoneNumberUseCase = setPhoneNumberUseCase,
       _clearCacheUseCase = clearCacheUseCase,
       super(ProfileInitial()) {
    // Get Profile
    on<GetProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await _getUserUseCase();
      result.fold((failure) {
        if (failure.message.toLowerCase().contains("no cached user found")) {
          // Show empty editable profile
          emit(ProfileLoaded(profile: Profile.empty()));
        } else {
          emit(ProfileError(message: failure.message));
        }
      }, (profile) => emit(ProfileLoaded(profile: profile)));
    });

    // Set Name
    on<SetNameProfileEvent>((event, emit) async {
      if (event.name.trim().isEmpty) {
        emit(SetNameProfileError(message: "Name cannot be empty"));
        return; // ❌ no reload
      }

      emit(SetNameProfileLoading());
      final result = await _setNameUseCase(SetNameParams(name: event.name));
      result.fold(
        (failure) => emit(SetNameProfileError(message: failure.message)),
        (_) {
          emit(SetNameProfileSuccess());
          add(GetProfileEvent()); // ✅ reload only after success
        },
      );
    });

    // Set Email
    on<SetEmailProfileEvent>((event, emit) async {
      final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
      if (!emailRegex.hasMatch(event.email.trim())) {
        emit(SetEmailProfileError(message: "Invalid email format"));
        return; // ❌ no reload
      }

      emit(SetEmailProfileLoading());
      final result = await _setEmailUseCase(SetEmailParams(email: event.email));
      result.fold(
        (failure) => emit(SetEmailProfileError(message: failure.message)),
        (_) {
          emit(SetEmailProfileSuccess());
          add(GetProfileEvent()); // ✅ reload only after success
        },
      );
    });

    // Set Phone Number
    on<SetPhoneNumberProfileEvent>((event, emit) async {
      final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
      if (!phoneRegex.hasMatch(event.phoneNumber.trim())) {
        emit(SetPhoneNumberProfileError(message: "Invalid phone number"));
        return; // ❌ no reload
      }

      emit(SetPhoneNumberProfileLoading());
      final result = await _setPhoneNumberUseCase(
        SetPhoneNumberParams(phoneNumber: event.phoneNumber),
      );
      result.fold(
        (failure) => emit(SetPhoneNumberProfileError(message: failure.message)),
        (_) {
          emit(SetPhoneNumberProfileSuccess());
          add(GetProfileEvent()); // ✅ reload only after success
        },
      );
    });

    // Clear Cache
    on<ClearCacheProfileEvent>((event, emit) async {
      emit(ClearCacheProfileLoading());
      final result = await _clearCacheUseCase();
      result.fold(
        (failure) => emit(ClearCacheProfileError(message: failure.message)),
        (_) => emit(ClearCacheProfileSuccess()),
      );
    });
  }
}
