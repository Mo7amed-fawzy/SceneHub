import 'package:ai_movie_app/feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/cast/tv_cast_model.dart';
import '../../data/models/season/tv_season_model.dart';
import '../../data/models/tv_series_model.dart';
import '../../domain/usecases/get_tv_series_cast_usecase.dart';
import '../../domain/usecases/get_tv_series_seasons_details_usecase.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesDetailsUseCase _getTvSeriesDetailsUseCase;
  final GetTvSeriesCastUseCase _getTvSeriesCastUseCase;
  final GetTvSeriesSeasonsDetailsUseCase _getTvSeriesSeasonsDetailsUseCase;
  TvSeriesBloc(
    this._getTvSeriesDetailsUseCase,
    this._getTvSeriesCastUseCase,
    this._getTvSeriesSeasonsDetailsUseCase,
  ) : super(TvSeriesInitial()) {
    on<TvSeriesEvent>((event, emit) async {
      if (event is FetchTvSeriesDetails) {
        await _fetchTvSeriesDetails(event.id, emit);
      }
      if (event is FetchTvSeriesCast) {
        await _fetchTvSeriesCast(event.id, emit);
      }
      if (event is FetchTvSeriesSeasonDetails) {
        await _fetchTvSeriesSeasonDetails(event.id, event.seasonNumber, emit);
      }
    });
  }

  Future<void> _fetchTvSeriesDetails(
    int id,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(TvSeriesDetailsLoading());
    await _getTvSeriesDetailsUseCase(id).then((result) {
      result.fold(
        (failure) {
          if (!emit.isDone) {
            emit(TvSeriesDetailsError(failure.message));
          }
        },
        (details) {
          emit(TvSeriesDetailsLoaded(details));
        },
      );
    });
  }

  Future<void> _fetchTvSeriesCast(int id, Emitter<TvSeriesState> emit) async {
    emit(TvSeriesCastLoading());
    await _getTvSeriesCastUseCase(id).then((result) {
      result.fold(
        (failure) {
          if (!emit.isDone) {
            emit(TvSeriesCastError(failure.message));
          }
        },
        (cast) {
          emit(TvSeriesCastLoaded(cast));
        },
      );
    });
  }

  Future<void> _fetchTvSeriesSeasonDetails(
    int id,
    int seasonNumber,
    Emitter<TvSeriesState> emit,
  ) async {
    emit(TvSeriesSeasonDetailsLoading());
    await _getTvSeriesSeasonsDetailsUseCase
        .call(id: id, seasonNumber: seasonNumber)
        .then((result) {
          result.fold(
            (failure) {
              if (!emit.isDone) {
                emit(TvSeriesSeasonDetailsError(failure.message));
              }
            },
            (season) {
              emit(TvSeriesSeasonDetailsLoaded(season));
            },
          );
        });
  }
}
