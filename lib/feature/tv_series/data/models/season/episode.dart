// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ai_movie_app/feature/tv_series/data/models/season/crew.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/season_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode extends EpisodeEntity {
  @JsonKey(name: "air_date")
  final DateTime? airDate;
  @JsonKey(name: "episode_number")
  final int? episodeNumber;
  @JsonKey(name: "episode_type")
  final String? episodeType;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "overview")
  final String? overview;
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
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "crew")
  final List<Crew>? crew;
  @JsonKey(name: "guest_stars")
  final List<Crew>? guestStars;

  Episode({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  }) : super(
         episodeNumber: episodeNumber,
         name: name,
         overview: overview,
         runtime: runtime,
         stillPath: stillPath,
       );

  Episode copyWith({
    DateTime? airDate,
    int? episodeNumber,
    String? episodeType,
    int? id,
    String? name,
    String? overview,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    int? showId,
    String? stillPath,
    double? voteAverage,
    int? voteCount,
    List<Crew>? crew,
    List<Crew>? guestStars,
  }) => Episode(
    airDate: airDate ?? this.airDate,
    episodeNumber: episodeNumber ?? this.episodeNumber,
    episodeType: episodeType ?? this.episodeType,
    id: id ?? this.id,
    name: name ?? this.name,
    overview: overview ?? this.overview,
    productionCode: productionCode ?? this.productionCode,
    runtime: runtime ?? this.runtime,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    showId: showId ?? this.showId,
    stillPath: stillPath ?? this.stillPath,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
    crew: crew ?? this.crew,
    guestStars: guestStars ?? this.guestStars,
  );

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
