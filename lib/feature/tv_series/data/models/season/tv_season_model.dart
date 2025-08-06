import 'package:ai_movie_app/feature/tv_series/data/models/season/episode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_season_model.g.dart';

@JsonSerializable()
class TvSeasonModel {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "air_date")
  final DateTime? airDate;
  @JsonKey(name: "episodes")
  final List<Episode>? episodes;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "id")
  final int? tvSeasonModelId;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "season_number")
  final int? seasonNumber;
  @JsonKey(name: "vote_average")
  final double? voteAverage;

  TvSeasonModel({
    this.id,
    this.airDate,
    this.episodes,
    this.name,
    this.overview,
    this.tvSeasonModelId,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  TvSeasonModel copyWith({
    String? id,
    DateTime? airDate,
    List<Episode>? episodes,
    String? name,
    String? overview,
    int? tvSeasonModelId,
    String? posterPath,
    int? seasonNumber,
    double? voteAverage,
  }) => TvSeasonModel(
    id: id ?? this.id,
    airDate: airDate ?? this.airDate,
    episodes: episodes ?? this.episodes,
    name: name ?? this.name,
    overview: overview ?? this.overview,
    tvSeasonModelId: tvSeasonModelId ?? this.tvSeasonModelId,
    posterPath: posterPath ?? this.posterPath,
    seasonNumber: seasonNumber ?? this.seasonNumber,
    voteAverage: voteAverage ?? this.voteAverage,
  );

  factory TvSeasonModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeasonModelToJson(this);
}
