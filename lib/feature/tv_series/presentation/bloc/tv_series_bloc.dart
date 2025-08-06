import 'package:ai_movie_app/feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/cast/tv_cast_model.dart';
import '../../data/models/tv_series_model.dart';
import '../../domain/usecases/get_tv_series_cast_usecase.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesDetailsUseCase _getTvSeriesDetailsUseCase;
  final GetTvSeriesCastUseCase _getTvSeriesCastUseCase;
  TvSeriesBloc(this._getTvSeriesDetailsUseCase, this._getTvSeriesCastUseCase)
    : super(TvSeriesInitial()) {
    on<TvSeriesEvent>((event, emit) async {
      if (event is FetchTvSeriesDetails) {
        await _fetchTvSeriesDetails(event.id, emit);
      }
    });
  }

  Future<void> _fetchTvSeriesDetails(
    int id,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(TvSeriesLoading());
    late TvCastModel tvCast;
    late TvSeriesDetailsModel tvSeriesDetails;
    bool hasError = false;

    await Future.wait([
      _getTvSeriesDetailsUseCase(id).then((result) {
        result.fold(
          (failure) {
            if (!emit.isDone && !hasError) {
              emit(TvSeriesError(failure.message));
              hasError = true;
            }
          },
          (details) {
            tvSeriesDetails = details;
          },
        );
      }),
      _getTvSeriesCastUseCase(id).then((result) {
        result.fold(
          (failure) {
            if (!emit.isDone && !hasError) {
              emit(TvSeriesError(failure.message));
              hasError = true;
            }
          },
          (cast) {
            tvCast = cast;
          },
        );
      }),
    ]);

    if (!emit.isDone && !hasError) {
      emit(TvSeriesLoaded(tvSeriesDetails, tvCast));
    }
  }
}
