import 'package:json_annotation/json_annotation.dart';

part 'season_model.g.dart';

@JsonSerializable()
class SeasonModel {
  @JsonKey(name: "air_date")
  final DateTime airDate;
  @JsonKey(name: "episode_count")
  final int episodeCount;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "season_number")
  final int seasonNumber;
  @JsonKey(name: "vote_average")
  final double voteAverage;

  SeasonModel({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  SeasonModel copyWith({
    DateTime? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    int? seasonNumber,
    double? voteAverage,
  }) => SeasonModel(
    airDate: airDate ?? this.airDate,
    episodeCount: episodeCount ?? this.episodeCount,
    id: id ?? this.id,
    name: name ?? this.name,
    overview: overview ?? this.overview,
    posterPath: posterPath ?? this.posterPath,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    voteAverage: voteAverage ?? this.voteAverage,
  );

  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);
}
