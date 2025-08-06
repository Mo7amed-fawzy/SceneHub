import 'package:ai_movie_app/feature/tv_series/data/models/cast/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "roles")
  final List<Role>? roles;
  @JsonKey(name: "total_episode_count")
  final int? totalEpisodeCount;
  @JsonKey(name: "order")
  final int? order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.roles,
    this.totalEpisodeCount,
    this.order,
  });

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    List<Role>? roles,
    int? totalEpisodeCount,
    int? order,
  }) => Cast(
    adult: adult ?? this.adult,
    gender: gender ?? this.gender,
    id: id ?? this.id,
    knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    name: name ?? this.name,
    originalName: originalName ?? this.originalName,
    popularity: popularity ?? this.popularity,
    profilePath: profilePath ?? this.profilePath,
    roles: roles ?? this.roles,
    totalEpisodeCount: totalEpisodeCount ?? this.totalEpisodeCount,
    order: order ?? this.order,
  );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
