import 'package:ai_movie_app/feature/search/data/models/known_for.dart';
import 'package:ai_movie_app/feature/search/data/models/search_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "media_type")
  final String? mediaType;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "known_for")
  final List<KnownFor>? knownFor;
  @JsonKey(name: "popula")
  final dynamic popula;

  Result({
    this.adult,
    this.id,
    this.name,
    this.originalName,
    this.mediaType,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
    this.popula,
  });

  Result copyWith({
    bool? adult,
    int? id,
    String? name,
    String? originalName,
    String? mediaType,
    double? popularity,
    int? gender,
    String? knownForDepartment,
    String? profilePath,
    List<KnownFor>? knownFor,
    dynamic popula,
  }) => Result(
    adult: adult ?? this.adult,
    id: id ?? this.id,
    name: name ?? this.name,
    originalName: originalName ?? this.originalName,
    mediaType: mediaType ?? this.mediaType,
    popularity: popularity ?? this.popularity,
    gender: gender ?? this.gender,
    knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    profilePath: profilePath ?? this.profilePath,
    knownFor: knownFor ?? this.knownFor,
    popula: popula ?? this.popula,
  );

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
