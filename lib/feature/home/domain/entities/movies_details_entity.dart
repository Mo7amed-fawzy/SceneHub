class HomeMoviesDetailsEntity {
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final DateTime? releaseDate;
  final double? voteAverage;
  final int? runtime;

  HomeMoviesDetailsEntity({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.runtime,
  });
}
