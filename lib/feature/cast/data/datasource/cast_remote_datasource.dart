import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/network/api_consumer.dart';
import '../models/tv_cast_model.dart';

abstract class CastRemoteDataSource {
  Future<TvCastModel> getTvSeriesCast(int id);
  Future<TvCastModel> getMovieCast(int id);
}

class CastRemoteDataSourceImpl implements CastRemoteDataSource {
  final ApiConsumer apiConsumer;

  CastRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<TvCastModel> getTvSeriesCast(int id) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.tv}$id${EndpointConstants.tvSeriesCast}',
    );
    if (response == null) {
      throw Exception('Failed to load TV series cast');
    }
    final tvCast = TvCastModel.fromJson(response);
    return tvCast;
  }

  @override
  Future<TvCastModel> getMovieCast(int id) async {
    final response = await apiConsumer.get(
      '${EndpointConstants.movie}$id${EndpointConstants.movieCast}',
    );
    if (response == null) {
      throw Exception('Failed to load Movie cast');
    }
    final tvCast = TvCastModel.fromJson(response);
    return tvCast;
  }
}
