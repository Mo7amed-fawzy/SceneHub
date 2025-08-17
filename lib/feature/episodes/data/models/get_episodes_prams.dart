class GetEpisodesParams {
  final int seriesId;
  final int seasonNumber;
  final int episodeNumber;

  GetEpisodesParams({
    required this.seriesId,
    required this.seasonNumber,
    required this.episodeNumber,
  });
}
