import 'package:ai_movie_app/feature/ai_chat/data/datasource/scenebot_remote_data_source.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/ai_response.dart';
import 'package:ai_movie_app/feature/ai_chat/data/model/movie_image.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/repositories/scenebot_repository.dart';
import 'package:ai_movie_app/feature/ai_chat/domain/usecases/failure.dart';
import 'package:ai_movie_app/core/usecases/usecase.dart';

class ScenebotRepositoryImpl implements ScenebotRepository {
  final ScenebotRemoteDatasource remoteDatasource;

  ScenebotRepositoryImpl(this.remoteDatasource);

  @override
  Future<ResultBot<AIResponse, Failure>> askScenebot(String query) async {
    try {
      final response = await remoteDatasource.askScenebot(query);
      return ResultBot.success(response);
    } catch (e) {
      return ResultBot.failure(Failure(message: e.toString()));
    }
  }

  @override
  Future<ResultBot<MovieImage, Failure>> fetchMovieImage(String query) async {
    try {
      // لو هنكلم API تاني عشان تجيب صورة (مثلاً TMDB)، هتستخدم datasource
      // لحد دلوقتي هنرجع error ثابت
      return ResultBot.failure(
        Failure(message: "fetchMovieImage not implemented yet"),
      );
    } catch (e) {
      return ResultBot.failure(Failure(message: e.toString()));
    }
  }
}
