import 'package:ai_movie_app/feature/tv_series/domain/entities/genre_entity.dart';

class MoviesDetailsEntity {
  final String? backdropPath;
  final String? posterPath;
  final String? title;
  final DateTime? releaseDate;
  final int? runtime;
  final List<GenreEntity>? genres;
  final double? voteAverage;
  final String? overview;
  final int? id;

  const MoviesDetailsEntity({
    this.backdropPath,
    this.posterPath,
    this.title,
    this.releaseDate,
    this.runtime,
    this.genres,
    this.voteAverage,
    this.overview,
    this.id,
  });
}
