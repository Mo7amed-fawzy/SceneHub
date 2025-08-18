import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

abstract class HomeMediaRemoteDataSource {
  Future<HomeMoviesDetailsModel> getDetails({
    required int id,
    required String mediaType,
  });

  Future<List<HomeMoviesDetailsModel>> getNowPlaying({
    required String mediaType,
  });

  Future<List<HomeMoviesDetailsModel>> getMixedNowPlaying();
}
