import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_data_types.dart';

class SetPhoneNumberUseCase extends UseCase<void, SetPhoneNumberParams> {
  final ProfileRepository _profileRepository;

  SetPhoneNumberUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  AsyncVoidResponse call(SetPhoneNumberParams params) async =>
      await _profileRepository.setPhoneNumber(phoneNumber: params.phoneNumber);
}

class SetPhoneNumberParams extends Equatable {
  final String phoneNumber;

  const SetPhoneNumberParams({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
