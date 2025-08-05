// GENERATED CODE - DO NOT MODIFY BY HAND

part of 't_episode_to_air_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TEpisodeToAirModel _$TEpisodeToAirModelFromJson(Map<String, dynamic> json) =>
    TEpisodeToAirModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      airDate: DateTime.parse(json['air_date'] as String),
      episodeNumber: (json['episode_number'] as num).toInt(),
      episodeType: json['episode_type'] as String,
      productionCode: json['production_code'] as String,
      runtime: (json['runtime'] as num?)?.toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      showId: (json['show_id'] as num).toInt(),
      stillPath: json['still_path'] as String?,
    );

Map<String, dynamic> _$TEpisodeToAirModelToJson(TEpisodeToAirModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
    };
