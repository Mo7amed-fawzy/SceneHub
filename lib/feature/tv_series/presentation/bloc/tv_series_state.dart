part of 'tv_series_bloc.dart';

@immutable
sealed class TvSeriesState {}

final class TvSeriesInitial extends TvSeriesState {}

final class TvSeriesDetailsLoading extends TvSeriesState {}

final class TvSeriesDetailsLoaded extends TvSeriesState {
  final TvSeriesDetailsEntity tvSeries;

  TvSeriesDetailsLoaded(this.tvSeries);
}

final class TvSeriesDetailsError extends TvSeriesState {
  final String message;

  TvSeriesDetailsError(this.message);
}

final class TvSeriesSeasonDetailsLoaded extends TvSeriesState {
  final TvSeasonEntity tvSeason;

  TvSeriesSeasonDetailsLoaded(this.tvSeason);
}

final class TvSeriesSeasonDetailsLoading extends TvSeriesState {}

final class TvSeriesSeasonDetailsError extends TvSeriesState {
  final String message;

  TvSeriesSeasonDetailsError(this.message);
}
