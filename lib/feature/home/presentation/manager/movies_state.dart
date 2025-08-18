import 'package:ai_movie_app/feature/home/data/models/movies_details_model.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<HomeMoviesDetailsModel>? movies;
  final HomeMoviesDetailsModel? movieDetails;

  MoviesLoaded({this.movies, this.movieDetails});
}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}
