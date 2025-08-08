part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class FetchMovieDetailsEvent extends MoviesEvent {
  final int movieId;

  FetchMovieDetailsEvent(this.movieId);
}
