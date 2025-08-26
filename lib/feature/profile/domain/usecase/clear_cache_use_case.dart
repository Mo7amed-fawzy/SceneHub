import 'package:ai_movie_app/core/constants/app_data_types.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';
import 'package:ai_movie_app/feature/profile/domain/repository/profile_repository.dart';

class ClearCacheUseCase extends NoParamsUseCase<void> {
  final ProfileRepository _profileRepository;

  ClearCacheUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  AsyncVoidResponse call() async => await _profileRepository.clearCache();
}
