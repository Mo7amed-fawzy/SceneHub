// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_season_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeasonModel _$TvSeasonModelFromJson(Map<String, dynamic> json) =>
    TvSeasonModel(
      id: json['_id'] as String?,
      airDate: json['air_date'] == null
          ? null
          : DateTime.parse(json['air_date'] as String),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      tvSeasonModelId: (json['id'] as num?)?.toInt(),
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TvSeasonModelToJson(TvSeasonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'air_date': instance.airDate?.toIso8601String(),
      'episodes': instance.episodes,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.tvSeasonModelId,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
