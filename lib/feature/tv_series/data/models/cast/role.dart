import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  @JsonKey(name: "credit_id")
  final String? creditId;
  @JsonKey(name: "character")
  final String? character;
  @JsonKey(name: "episode_count")
  final int? episodeCount;

  Role({this.creditId, this.character, this.episodeCount});

  Role copyWith({String? creditId, String? character, int? episodeCount}) =>
      Role(
        creditId: creditId ?? this.creditId,
        character: character ?? this.character,
        episodeCount: episodeCount ?? this.episodeCount,
      );

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
