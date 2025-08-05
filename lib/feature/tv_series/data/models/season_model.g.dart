// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => SeasonModel(
  airDate: DateTime.parse(json['air_date'] as String),
  episodeCount: (json['episode_count'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  overview: json['overview'] as String,
  posterPath: json['poster_path'] as String,
  seasonNumber: (json['season_number'] as num).toInt(),
  voteAverage: (json['vote_average'] as num).toDouble(),
);

Map<String, dynamic> _$SeasonModelToJson(SeasonModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
