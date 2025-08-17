import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  @JsonKey(name: "job")
  final String? job;
  @JsonKey(name: "department")
  final String? department;
  @JsonKey(name: "credit_id")
  final String? creditId;
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
  @JsonKey(name: "character")
  final String? character;
  @JsonKey(name: "order")
  final int? order;

  Crew({
    this.job,
    this.department,
    this.creditId,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.character,
    this.order,
  });

  Crew copyWith({
    String? job,
    String? department,
    String? creditId,
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    String? character,
    int? order,
  }) => Crew(
    job: job ?? this.job,
    department: department ?? this.department,
    creditId: creditId ?? this.creditId,
    adult: adult ?? this.adult,
    gender: gender ?? this.gender,
    id: id ?? this.id,
    knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    name: name ?? this.name,
    originalName: originalName ?? this.originalName,
    popularity: popularity ?? this.popularity,
    profilePath: profilePath ?? this.profilePath,
    character: character ?? this.character,
    order: order ?? this.order,
  );

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
