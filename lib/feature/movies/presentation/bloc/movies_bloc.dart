import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movies_details_entity.dart';
import '../../domain/usecases/get_movies_details_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MoviesBloc(this.getMovieDetailsUseCase) : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) async {
      if (event is FetchMovieDetailsEvent) {
        await _fetchMovieDetails(event.movieId, emit);
      }
    });
  }

  Future<void> _fetchMovieDetails(
    int movieId,
    Emitter<MoviesState> emit,
  ) async {
    emit(MoviesDetailsLoading());
    final result = await getMovieDetailsUseCase.call(movieId);
    result.fold(
      (error) => emit(MoviesError(error.message)),
      (movieDetails) => emit(MoviesLoaded(movieDetails)),
    );
  }
}
