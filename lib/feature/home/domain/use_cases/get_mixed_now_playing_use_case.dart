import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';

import '../entities/movies_details_entity.dart';

class GetMixedNowPlayingUseCase {
  final HomeMediaRepository repository;

  GetMixedNowPlayingUseCase(this.repository);

  Future<List<HomeMediaEntity>> call() {
    return repository.getMixedNowPlaying();
  }
}
