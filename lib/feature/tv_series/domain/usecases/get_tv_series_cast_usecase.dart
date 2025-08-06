import '../../../../core/constants/app_data_types.dart';
import '../../data/models/cast/tv_cast_model.dart';
import '../repository/tv_series_repo.dart';

class GetTvSeriesCastUseCase {
  final TvSeriesRepo tvSeriesRepo;

  GetTvSeriesCastUseCase(this.tvSeriesRepo);

  AsyncSingleDataResponse<TvCastModel> call(int id) {
    return tvSeriesRepo.getTvSeriesCast(id);
  }
}
