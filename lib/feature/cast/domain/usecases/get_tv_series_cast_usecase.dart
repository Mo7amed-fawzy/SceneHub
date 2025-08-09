import 'package:ai_movie_app/feature/cast/domain/repository/cast_repo.dart';

import '../../../../core/constants/app_data_types.dart';
import '../entities/cast_entities.dart';

class GetTvSeriesCastUseCase {
  final CastRepository _castRepository;

  GetTvSeriesCastUseCase(this._castRepository);

  AsyncSingleDataResponse<TvCastEntity> call(int id) {
    return _castRepository.getTvSeriesCast(id);
  }
}
