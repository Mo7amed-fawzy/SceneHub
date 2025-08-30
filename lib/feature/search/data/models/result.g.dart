// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      adult: json['adult'] as bool?,
      id: (json['id'] as num?)?.toInt(),
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      originalLanguage: json['original_language'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      mediaType: json['media_type'] as String?,
      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      releaseDate: json['release_date'] as String?,
      video: json['video'] as bool?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      gender: (json['gender'] as num?)?.toInt(),
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map((e) => KnownFor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'original_language': instance.originalLanguage,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'video': instance.video,
      'name': instance.name,
      'original_name': instance.originalName,
      'first_air_date': instance.firstAirDate,
      'origin_country': instance.originCountry,
      'gender': instance.gender,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor,
    };
