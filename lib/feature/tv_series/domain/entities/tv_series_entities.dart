import 'package:ai_movie_app/feature/tv_series/domain/entities/genre_entity.dart';

class TvSeriesDetailsEntity {
  final String? backdropPath;
  final List<int>? episodeRunTime;
  final DateTime? firstAirDate;
  final List<GenreEntity>? genres;
  final String? name;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final String? overview;
  final String? posterPath;
  final double? voteAverage;

  const TvSeriesDetailsEntity({
    this.backdropPath,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.name,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.overview,
    this.posterPath,
    this.voteAverage,
  });
}
