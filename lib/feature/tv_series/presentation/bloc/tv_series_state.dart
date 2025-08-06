part of 'tv_series_bloc.dart';

@immutable
sealed class TvSeriesState {}

final class TvSeriesInitial extends TvSeriesState {}

final class TvSeriesLoading extends TvSeriesState {}

final class TvSeriesLoaded extends TvSeriesState {
  final TvSeriesDetailsModel tvSeries;
  final TvCastModel tvCast;

  TvSeriesLoaded(this.tvSeries, this.tvCast);
}

final class TvSeriesError extends TvSeriesState {
  final String message;

  TvSeriesError(this.message);
}
