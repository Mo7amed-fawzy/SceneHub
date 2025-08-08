part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesDetailsLoading extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final MoviesDetailsModel movieDetails;

  MoviesLoaded(this.movieDetails);
}

final class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);
}
