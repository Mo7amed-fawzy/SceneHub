import '../../../../core/constants/app_data_types.dart';
import '../../data/models/tv_series_model.dart';
import '../repository/tv_series_repo.dart';

class GetTvSeriesDetailsUseCase {
  final TvSeriesRepo tvSeriesRepo;

  GetTvSeriesDetailsUseCase(this.tvSeriesRepo);

  AsyncSingleDataResponse<TvSeriesDetailsModel> call(int id) {
    return tvSeriesRepo.getTvSeriesDetails(id);
  }
}
