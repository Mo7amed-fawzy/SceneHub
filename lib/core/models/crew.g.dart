// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
  job: json['job'] as String?,
  department: json['department'] as String?,
  creditId: json['credit_id'] as String?,
  adult: json['adult'] as bool?,
  gender: (json['gender'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  knownForDepartment: json['known_for_department'] as String?,
  name: json['name'] as String?,
  originalName: json['original_name'] as String?,
  popularity: (json['popularity'] as num?)?.toDouble(),
  profilePath: json['profile_path'] as String?,
  character: json['character'] as String?,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
  'job': instance.job,
  'department': instance.department,
  'credit_id': instance.creditId,
  'adult': instance.adult,
  'gender': instance.gender,
  'id': instance.id,
  'known_for_department': instance.knownForDepartment,
  'name': instance.name,
  'original_name': instance.originalName,
  'popularity': instance.popularity,
  'profile_path': instance.profilePath,
  'character': instance.character,
  'order': instance.order,
};
