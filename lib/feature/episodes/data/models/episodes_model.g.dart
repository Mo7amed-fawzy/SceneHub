// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodesModel _$EpisodesModelFromJson(Map<String, dynamic> json) =>
    EpisodesModel(
      airDate: DateTime.parse(json['air_date'] as String),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeNumber: (json['episode_number'] as num).toInt(),
      episodeType: json['episode_type'] as String,
      guestStars: json['guest_stars'] as List<dynamic>,
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: (json['id'] as num).toInt(),
      productionCode: json['production_code'] as String,
      runtime: (json['runtime'] as num).toInt(),
      seasonNumber: (json['season_number'] as num).toInt(),
      stillPath: json['still_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$EpisodesModelToJson(EpisodesModel instance) =>
    <String, dynamic>{
      'air_date': instance.airDate.toIso8601String(),
      'crew': instance.crew,
      'episode_number': instance.episodeNumber,
      'episode_type': instance.episodeType,
      'guest_stars': instance.guestStars,
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'production_code': instance.productionCode,
      'runtime': instance.runtime,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
