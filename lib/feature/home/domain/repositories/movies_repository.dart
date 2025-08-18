import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';

abstract class HomeMediaRepository {
  Future<HomeMediaEntity> getDetails(int id, String mediaType);
  Future<List<HomeMediaEntity>> getNowPlaying(String mediaType);
  Future<List<HomeMediaEntity>> getMixedNowPlaying();
}
