// ignore_for_file: overridden_fields

import 'package:ai_movie_app/feature/cast/data/models/role.dart';
import 'package:ai_movie_app/feature/cast/domain/entities/cast_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast extends CastEntity {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  @override
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "popularity")
  final double? popularity;
  @override
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "roles")
  final List<Role>? rolesModel;
  @JsonKey(name: "total_episode_count")
  final int? totalEpisodeCount;
  @JsonKey(name: "order")
  final int? order;

  @override
  List<RoleEntity>? get roles => rolesModel?.cast<RoleEntity>();

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.rolesModel,
    this.totalEpisodeCount,
    this.order,
  }) : super(
         name: name,
         profilePath: profilePath,
         roles: rolesModel?.cast<RoleEntity>(),
       );

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    List<Role>? rolesModel,
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
    rolesModel: rolesModel ?? this.rolesModel,
    totalEpisodeCount: totalEpisodeCount ?? this.totalEpisodeCount,
    order: order ?? this.order,
  );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
