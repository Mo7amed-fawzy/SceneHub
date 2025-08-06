class TvSeasonEntity {
  final List<EpisodeEntity>? episodes;

  const TvSeasonEntity({this.episodes});
}

class EpisodeEntity {
  final int? episodeNumber;
  final String? name;
  final String? overview;
  final int? runtime;
  final String? stillPath;

  const EpisodeEntity({
    this.episodeNumber,
    this.name,
    this.overview,
    this.runtime,
    this.stillPath,
  });
}
