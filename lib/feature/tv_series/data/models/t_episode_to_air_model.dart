import 'package:json_annotation/json_annotation.dart';

part 't_episode_to_air_model.g.dart';

@JsonSerializable()
class TEpisodeToAirModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "air_date")
  final DateTime? airDate;
  @JsonKey(name: "episode_number")
  final int? episodeNumber;
  @JsonKey(name: "episode_type")
  final String? episodeType;
  @JsonKey(name: "production_code")
  final String? productionCode;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "season_number")
  final int? seasonNumber;
  @JsonKey(name: "show_id")
  final int? showId;
  @JsonKey(name: "still_path")
  final String? stillPath;

  TEpisodeToAirModel({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  TEpisodeToAirModel copyWith({
    int? id,
    String? name,
    String? overview,
    double? voteAverage,
    int? voteCount,
    DateTime? airDate,
    int? episodeNumber,
    String? episodeType,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    int? showId,
    String? stillPath,
  }) => TEpisodeToAirModel(
    id: id ?? this.id,
    name: name ?? this.name,
    overview: overview ?? this.overview,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
    airDate: airDate ?? this.airDate,
    episodeNumber: episodeNumber ?? this.episodeNumber,
    episodeType: episodeType ?? this.episodeType,
    productionCode: productionCode ?? this.productionCode,
    runtime: runtime ?? this.runtime,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    showId: showId ?? this.showId,
    stillPath: stillPath ?? this.stillPath,
  );

  factory TEpisodeToAirModel.fromJson(Map<String, dynamic> json) =>
      _$TEpisodeToAirModelFromJson(json);

  Map<String, dynamic> toJson() => _$TEpisodeToAirModelToJson(this);
}
