import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/crew.dart';
import '../../domain/entities/episode_entities.dart';
part 'episodes_model.g.dart';

@JsonSerializable()
class EpisodesModel {
  @JsonKey(name: "air_date")
  final DateTime airDate;
  @JsonKey(name: "crew")
  final List<Crew> crew;
  @JsonKey(name: "episode_number")
  final int episodeNumber;
  @JsonKey(name: "episode_type")
  final String episodeType;
  @JsonKey(name: "guest_stars")
  final List<dynamic> guestStars;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "production_code")
  final String? productionCode;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "season_number")
  final int seasonNumber;
  @JsonKey(name: "still_path")
  final String? stillPath;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  EpisodesModel({
    required this.airDate,
    required this.crew,
    required this.episodeNumber,
    required this.episodeType,
    required this.guestStars,
    required this.name,
    this.overview,
    required this.id,
    this.productionCode,
    this.runtime,
    required this.seasonNumber,
    this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodesModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesModelToJson(this);

  EpisodeEntity toEntity() {
    return EpisodeEntity(
      airDate: airDate,
      crew: crew.map((crewMember) => crewMember.toEntity()).toList(),
      episodeType: episodeType,
      name: name,
      overview: overview ?? '', // Provide empty string if null
      runtime: runtime ?? 0, // Provide 0 if null
      stillPath: stillPath ?? '', // Provide empty string if null
      voteAverage: voteAverage,
    );
  }
}
