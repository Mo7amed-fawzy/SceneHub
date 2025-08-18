import '../entities/movies_details_entity.dart';
import '../repositories/movies_repository.dart';

class GetNowPlayingUseCase {
  final HomeMediaRepository repository;

  GetNowPlayingUseCase(this.repository);

  Future<List<HomeMediaEntity>> call(String mediaType) {
    return repository.getNowPlaying(mediaType);
  }
}
