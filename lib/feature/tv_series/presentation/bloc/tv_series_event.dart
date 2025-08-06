part of 'tv_series_bloc.dart';

@immutable
sealed class TvSeriesEvent {}

final class FetchTvSeriesDetails extends TvSeriesEvent {
  final int id;

  FetchTvSeriesDetails(this.id);
}
