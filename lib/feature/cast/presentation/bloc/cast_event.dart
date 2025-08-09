part of 'cast_bloc.dart';

@immutable
sealed class CastEvent {}

final class FetchTvSeriesCast extends CastEvent {
  final int tvSeriesId;

  FetchTvSeriesCast(this.tvSeriesId);
}

final class FetchMovieCast extends CastEvent {
  final int movieId;

  FetchMovieCast(this.movieId);
}
