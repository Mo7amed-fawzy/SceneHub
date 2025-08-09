import 'package:ai_movie_app/feature/tv_series/domain/entities/season_entities.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';
import 'package:ai_movie_app/feature/tv_series/domain/usecases/get_tv_series_details_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_tv_series_seasons_details_usecase.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final GetTvSeriesDetailsUseCase _getTvSeriesDetailsUseCase;
  final GetTvSeriesSeasonsDetailsUseCase _getTvSeriesSeasonsDetailsUseCase;
  TvSeriesBloc(
    this._getTvSeriesDetailsUseCase,
    this._getTvSeriesSeasonsDetailsUseCase,
  ) : super(TvSeriesInitial()) {
    on<TvSeriesEvent>((event, emit) async {
      if (event is FetchTvSeriesDetails) {
        await _fetchTvSeriesDetails(event.id, emit);
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
