// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      adult: json['adult'] as bool?,
      gender: (json['gender'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      rolesModel: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEpisodeCount: (json['total_episode_count'] as num?)?.toInt(),
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'roles': instance.rolesModel,
      'total_episode_count': instance.totalEpisodeCount,
      'order': instance.order,
    };
