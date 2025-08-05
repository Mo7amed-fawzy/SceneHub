// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvSeriesModel _$TvSeriesModelFromJson(Map<String, dynamic> json) =>
    TvSeriesModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      createdBy: json['created_by'] as List<dynamic>,
      episodeRunTime: (json['episode_run_time'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      firstAirDate: DateTime.parse(json['first_air_date'] as String),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: (json['id'] as num).toInt(),
      inProduction: json['in_production'] as bool,
      languages: (json['languages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastAirDate: DateTime.parse(json['last_air_date'] as String),
      lastEpisodeToAir: TEpisodeToAirModel.fromJson(
        json['last_episode_to_air'] as Map<String, dynamic>,
      ),
      name: json['name'] as String,
      nextEpisodeToAir: TEpisodeToAirModel.fromJson(
        json['next_episode_to_air'] as Map<String, dynamic>,
      ),
      networks: (json['networks'] as List<dynamic>)
          .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfEpisodes: (json['number_of_episodes'] as num).toInt(),
      numberOfSeasons: (json['number_of_seasons'] as num).toInt(),
      originCountry: (json['origin_country'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['original_language'] as String,
      originalName: json['original_name'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      productionCompanies: (json['production_companies'] as List<dynamic>)
          .map((e) => NetworkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map(
            (e) => ProductionCountryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => SeasonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>)
          .map((e) => SpokenLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      type: json['type'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$TvSeriesModelToJson(TvSeriesModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy,
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate.toIso8601String(),
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate.toIso8601String(),
      'last_episode_to_air': instance.lastEpisodeToAir,
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'seasons': instance.seasons,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'type': instance.type,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
