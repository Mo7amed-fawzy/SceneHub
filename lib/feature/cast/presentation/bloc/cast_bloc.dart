import 'package:ai_movie_app/feature/cast/domain/usecases/get_movies_cast_usecase.dart';
import 'package:ai_movie_app/feature/cast/domain/usecases/get_tv_series_cast_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cast_entities.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetMoviesCastUseCase _getMoviesCastUseCase;
  final GetTvSeriesCastUseCase _getTvSeriesCastUseCase;
  CastBloc(this._getMoviesCastUseCase, this._getTvSeriesCastUseCase)
    : super(CastInitial()) {
    on<CastEvent>((event, emit) async {
      if (event is FetchTvSeriesCast) {
        await _fetchTvSeriesCast(event.tvSeriesId, emit);
      }
      // Add other event handlers here if needed
      if (event is FetchMovieCast) {
        await _fetchMovieCast(event.movieId, emit);
      }
    });
  }

  Future<void> _fetchTvSeriesCast(
    int tvSeriesId,
    Emitter<CastState> emit,
  ) async {
    emit(CastLoading());
    final cast = await _getTvSeriesCastUseCase(tvSeriesId);
    cast.fold(
      (failure) {
        if (!emit.isDone) {
          emit(CastError(failure.message));
        }
      },
      (tvCast) {
        emit(CastLoaded(tvCast));
      },
    );
  }

  Future<void> _fetchMovieCast(int movieId, Emitter<CastState> emit) async {
    emit(CastLoading());
    final cast = await _getMoviesCastUseCase(movieId);
    cast.fold(
      (failure) {
        if (!emit.isDone) {
          emit(CastError(failure.message));
        }
      },
      (movieCast) {
        emit(CastLoaded(movieCast));
      },
    );
  }
}
