import '../../../../core/constants/app_data_types.dart';
import '../entities/cast_entities.dart';
import '../repository/cast_repo.dart';

class GetMoviesCastUseCase {
  final CastRepository _castRepository;

  GetMoviesCastUseCase(this._castRepository);

  AsyncSingleDataResponse<TvCastEntity> call(int id) async {
    return await _castRepository.getMovieCast(id);
  }
}
