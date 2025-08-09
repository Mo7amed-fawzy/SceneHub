import '../../../../core/constants/app_data_types.dart';
import '../entities/cast_entities.dart';

abstract class CastRepository {
  AsyncSingleDataResponse<TvCastEntity> getTvSeriesCast(int id);
  AsyncSingleDataResponse<TvCastEntity> getMovieCast(int id);
}
