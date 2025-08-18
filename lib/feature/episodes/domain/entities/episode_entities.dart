class EpisodeEntity {
  final DateTime airDate;
  final List<CrewEntity> crew;
  final String episodeType;
  final String name;
  final String overview;
  final int runtime;
  final String stillPath;
  final double voteAverage;

  const EpisodeEntity({
    required this.airDate,
    required this.crew,
    required this.episodeType,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.stillPath,
    required this.voteAverage,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EpisodeEntity &&
        other.airDate == airDate &&
        other.crew == crew &&
        other.episodeType == episodeType &&
        other.name == name &&
        other.overview == overview &&
        other.runtime == runtime &&
        other.stillPath == stillPath &&
        other.voteAverage == voteAverage;
  }

  @override
  int get hashCode {
    return Object.hash(
      airDate,
      crew,
      episodeType,
      name,
      overview,
      runtime,
      stillPath,
      voteAverage,
    );
  }
}

class CrewEntity {
  final String? job;
  final String? name;

  const CrewEntity({this.job, this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CrewEntity && other.job == job && other.name == name;
  }

  @override
  int get hashCode {
    return Object.hash(job, name);
  }
}
