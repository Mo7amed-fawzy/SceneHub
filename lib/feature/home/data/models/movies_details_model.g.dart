// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MoviesDetailsModelToJson(
  HomeMoviesDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'posterPath': instance.posterPath,
  'backdropPath': instance.backdropPath,
  'releaseDate': instance.releaseDate?.toIso8601String(),
  'voteAverage': instance.voteAverage,
  'runtime': instance.runtime,
};
