import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';

import '../../../../core/constants/app_data_types.dart';
import '../repository/tv_series_repo.dart';

class GetTvSeriesDetailsUseCase {
  final TvSeriesRepo tvSeriesRepo;

  GetTvSeriesDetailsUseCase(this.tvSeriesRepo);

  AsyncSingleDataResponse<TvSeriesDetailsEntity> call(int id) {
    return tvSeriesRepo.getTvSeriesDetails(id);
  }
}
