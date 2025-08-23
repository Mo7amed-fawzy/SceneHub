import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_data_types.dart';

class SetEmailUseCase extends UseCase<void, SetEmailParams> {
  final ProfileRepository _profileRepository;

  SetEmailUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  AsyncVoidResponse call(SetEmailParams params) async =>
      await _profileRepository.setEmail(email: params.email);
}

class SetEmailParams extends Equatable {
  final String email;

  const SetEmailParams({required this.email});

  @override
  List<Object> get props => [email];
}
