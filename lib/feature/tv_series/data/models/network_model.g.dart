// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkModel _$NetworkModelFromJson(Map<String, dynamic> json) => NetworkModel(
  id: (json['id'] as num?)?.toInt(),
  logoPath: json['logo_path'] as String?,
  name: json['name'] as String?,
  originCountry: json['origin_country'] as String?,
);

Map<String, dynamic> _$NetworkModelToJson(NetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
