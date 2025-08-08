// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  creditId: json['credit_id'] as String?,
  character: json['character'] as String?,
  episodeCount: (json['episode_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'credit_id': instance.creditId,
  'character': instance.character,
  'episode_count': instance.episodeCount,
};
