// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvCastModel _$TvCastModelFromJson(Map<String, dynamic> json) => TvCastModel(
      castModel: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: json['crew'] as List<dynamic>?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TvCastModelToJson(TvCastModel instance) =>
    <String, dynamic>{
      'cast': instance.castModel,
      'crew': instance.crew,
      'id': instance.id,
    };
