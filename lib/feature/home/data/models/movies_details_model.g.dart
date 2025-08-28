// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMoviesDetailsModel _$HomeMoviesDetailsModelFromJson(
        Map<String, dynamic> json) =>
    HomeMoviesDetailsModel(
      mediaType: json['mediaType'] as String,
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['posterPath'] as String?,
      backdropPath: json['backdropPath'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      voteAverage: (json['voteAverage'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomeMoviesDetailsModelToJson(
        HomeMoviesDetailsModel instance) =>
    <String, dynamic>{
      'mediaType': instance.mediaType,
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'voteAverage': instance.voteAverage,
      'runtime': instance.runtime,
    };
