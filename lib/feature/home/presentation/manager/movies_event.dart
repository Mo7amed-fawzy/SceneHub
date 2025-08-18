abstract class MoviesEvent {}

class FetchNowPlayingEvent extends MoviesEvent {}

class FetchMovieDetailsEvent extends MoviesEvent {
  final int movieId;
  FetchMovieDetailsEvent(this.movieId);
}
