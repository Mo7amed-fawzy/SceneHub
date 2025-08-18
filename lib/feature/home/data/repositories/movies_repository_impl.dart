import 'package:ai_movie_app/feature/home/data/datasource/home_media_remote_data_source.dart';
import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';
import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';

class HomeMediaRepositoryImpl implements HomeMediaRepository {
  final HomeMediaRemoteDataSource remoteDataSource;

  HomeMediaRepositoryImpl(this.remoteDataSource);

  @override
  Future<HomeMediaEntity> getDetails(int id, String mediaType) async {
    final result = await remoteDataSource.getDetails(
      id: id,
      mediaType: mediaType,
    );
    return result.toEntity();
  }

  @override
  Future<List<HomeMediaEntity>> getNowPlaying(String mediaType) async {
    final result = await remoteDataSource.getNowPlaying(mediaType: mediaType);
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<HomeMediaEntity>> getMixedNowPlaying() async {
    final result = await remoteDataSource.getMixedNowPlaying();
    return result.map((e) => e.toEntity()).toList();
  }
}
