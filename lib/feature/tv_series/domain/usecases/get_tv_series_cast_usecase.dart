import '../../../../core/constants/app_data_types.dart';
import '../entities/cast_entities.dart';
import '../repository/tv_series_repo.dart';

class GetTvSeriesCastUseCase {
  final TvSeriesRepo tvSeriesRepo;

  GetTvSeriesCastUseCase(this.tvSeriesRepo);

  AsyncSingleDataResponse<TvCastEntity> call(int id) {
    return tvSeriesRepo.getTvSeriesCast(id);
  }
}
