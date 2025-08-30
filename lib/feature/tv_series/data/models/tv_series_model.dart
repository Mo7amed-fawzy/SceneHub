// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ai_movie_app/core/models/genre_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/network_model.dart';
import 'package:ai_movie_app/core/models/production_country_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/season_model.dart';
import 'package:ai_movie_app/core/models/spoken_language_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/t_episode_to_air_model.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/genre_entity.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/tv_series_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_series_model.g.dart';

@JsonSerializable()
class TvSeriesDetailsModel extends TvSeriesDetailsEntity {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "created_by")
  final List<dynamic>? createdBy;
  @JsonKey(name: "episode_run_time")
  final List<int>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  final DateTime? firstAirDate;
  @JsonKey(name: "genres")
  final List<GenreModel>? genresModel;

  @override
  List<GenreEntity>? get genres => genresModel?.cast<GenreEntity>();
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "in_production")
  final bool? inProduction;
  @JsonKey(name: "languages")
  final List<String>? languages;
  @JsonKey(name: "last_air_date")
  final DateTime? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  final TEpisodeToAirModel? lastEpisodeToAir;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "next_episode_to_air")
  final TEpisodeToAirModel? nextEpisodeToAir;
  @JsonKey(name: "networks")
  final List<NetworkModel>? networks;
  @JsonKey(name: "number_of_episodes")
  final int? numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  final int? numberOfSeasons;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<NetworkModel>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryModel>? productionCountries;
  @JsonKey(name: "seasons")
  final List<SeasonModel>? seasons;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageModel>? spokenLanguages;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  TvSeriesDetailsModel({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genresModel,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  }) : super(
         id: id ?? 0, // ✅ تمرير id للـ Entity
         backdropPath: backdropPath,
         episodeRunTime: episodeRunTime,
         firstAirDate: firstAirDate,
         genres: genresModel?.cast<GenreEntity>(),
         name: name,
         numberOfEpisodes: numberOfEpisodes,
         numberOfSeasons: numberOfSeasons,
         overview: overview,
         posterPath: posterPath,
         voteAverage: voteAverage,
       );

  TvSeriesDetailsModel copyWith({
    bool? adult,
    String? backdropPath,
    List<dynamic>? createdBy,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    List<GenreModel>? genresModel,
    String? homepage,
    int? id,
    bool? inProduction,
    List<String>? languages,
    DateTime? lastAirDate,
    TEpisodeToAirModel? lastEpisodeToAir,
    String? name,
    TEpisodeToAirModel? nextEpisodeToAir,
    List<NetworkModel>? networks,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalName,
    String? overview,
    double? popularity,
    String? posterPath,
    List<NetworkModel>? productionCompanies,
    List<ProductionCountryModel>? productionCountries,
    List<SeasonModel>? seasons,
    List<SpokenLanguageModel>? spokenLanguages,
    String? status,
    String? tagline,
    String? type,
    double? voteAverage,
    int? voteCount,
  }) => TvSeriesDetailsModel(
    adult: adult ?? this.adult,
    backdropPath: backdropPath ?? this.backdropPath,
    createdBy: createdBy ?? this.createdBy,
    episodeRunTime: episodeRunTime ?? this.episodeRunTime,
    firstAirDate: firstAirDate ?? this.firstAirDate,
    genresModel: genresModel ?? this.genresModel,
    homepage: homepage ?? this.homepage,
    id: id ?? this.id,
    inProduction: inProduction ?? this.inProduction,
    languages: languages ?? this.languages,
    lastAirDate: lastAirDate ?? this.lastAirDate,
    lastEpisodeToAir: lastEpisodeToAir ?? this.lastEpisodeToAir,
    name: name ?? this.name,
    nextEpisodeToAir: nextEpisodeToAir ?? this.nextEpisodeToAir,
    networks: networks ?? this.networks,
    numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
    numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
    originCountry: originCountry ?? this.originCountry,
    originalLanguage: originalLanguage ?? this.originalLanguage,
    originalName: originalName ?? this.originalName,
    overview: overview ?? this.overview,
    popularity: popularity ?? this.popularity,
    posterPath: posterPath ?? this.posterPath,
    productionCompanies: productionCompanies ?? this.productionCompanies,
    productionCountries: productionCountries ?? this.productionCountries,
    seasons: seasons ?? this.seasons,
    spokenLanguages: spokenLanguages ?? this.spokenLanguages,
    status: status ?? this.status,
    tagline: tagline ?? this.tagline,
    type: type ?? this.type,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
  );

  factory TvSeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeriesDetailsModelToJson(this);
}
