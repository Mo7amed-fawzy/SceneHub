import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/profile/domain/repository/profile_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_data_types.dart';

class SetNameUseCase extends UseCase<void, SetNameParams> {
  final ProfileRepository _profileRepository;

  SetNameUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  AsyncVoidResponse call(SetNameParams params) async =>
      await _profileRepository.setName(name: params.name);
}

class SetNameParams extends Equatable {
  final String name;

  const SetNameParams({required this.name});

  @override
  List<Object> get props => [name];
}
