import 'package:ai_movie_app/core/functions/print_statement.dart';
import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';
import 'package:ai_movie_app/feature/home/domain/repositories/movies_repository.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/movies_event.dart';
import 'package:ai_movie_app/feature/home/presentation/manager/movies_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final HomeMoviesRepository repository;

  MoviesBloc(this.repository) : super(MoviesInitial()) {
    on<FetchNowPlayingEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final moviesEntities = await repository.getNowPlayingMovies();

        final moviesModels = moviesEntities
            .map((entity) => HomeMoviesDetailsModel.fromEntity(entity))
            .toList();

        emit(MoviesLoaded(movies: moviesModels));
      } catch (e) {
        printHere('Error fetching movies: $e');

        emit(MoviesError(e.toString()));
      }
    });

    on<FetchMovieDetailsEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final detailsEntity = await repository.getMovieDetails(event.movieId);

        final detailsModel = HomeMoviesDetailsModel.fromEntity(detailsEntity);

        emit(MoviesLoaded(movieDetails: detailsModel));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
  }
}
