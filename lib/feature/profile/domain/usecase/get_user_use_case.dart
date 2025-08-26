import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/profile/domain/entities/profile.dart';

import '../../../../core/constants/app_data_types.dart';
import '../repository/profile_repository.dart';

class GetUserUseCase extends NoParamsUseCase<void> {
  final ProfileRepository _profileRepository;

  GetUserUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  AsyncSingleDataResponse<Profile> call() async =>
      await _profileRepository.getUser();
}
