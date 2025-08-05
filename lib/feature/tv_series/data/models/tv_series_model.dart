import 'package:ai_movie_app/feature/tv_series/data/models/genre_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/network_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/production_country_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/season_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/spoken_language_model.dart';
import 'package:ai_movie_app/feature/tv_series/data/models/t_episode_to_air_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_series_model.g.dart';

@JsonSerializable()
class TvSeriesModel {
  @JsonKey(name: "adult")
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String backdropPath;
  @JsonKey(name: "created_by")
  final List<dynamic> createdBy;
  @JsonKey(name: "episode_run_time")
  final List<int> episodeRunTime;
  @JsonKey(name: "first_air_date")
  final DateTime firstAirDate;
  @JsonKey(name: "genres")
  final List<GenreModel> genres;
  @JsonKey(name: "homepage")
  final String homepage;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "in_production")
  final bool inProduction;
  @JsonKey(name: "languages")
  final List<String> languages;
  @JsonKey(name: "last_air_date")
  final DateTime lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  final TEpisodeToAirModel lastEpisodeToAir;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "next_episode_to_air")
  final TEpisodeToAirModel nextEpisodeToAir;
  @JsonKey(name: "networks")
  final List<NetworkModel> networks;
  @JsonKey(name: "number_of_episodes")
  final int numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  final int numberOfSeasons;
  @JsonKey(name: "origin_country")
  final List<String> originCountry;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_name")
  final String originalName;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "poster_path")
  final String posterPath;
  @JsonKey(name: "production_companies")
  final List<NetworkModel> productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryModel> productionCountries;
  @JsonKey(name: "seasons")
  final List<SeasonModel> seasons;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageModel> spokenLanguages;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "tagline")
  final String tagline;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;

  TvSeriesModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  TvSeriesModel copyWith({
    bool? adult,
    String? backdropPath,
    List<dynamic>? createdBy,
    List<int>? episodeRunTime,
    DateTime? firstAirDate,
    List<GenreModel>? genres,
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
  }) => TvSeriesModel(
    adult: adult ?? this.adult,
    backdropPath: backdropPath ?? this.backdropPath,
    createdBy: createdBy ?? this.createdBy,
    episodeRunTime: episodeRunTime ?? this.episodeRunTime,
    firstAirDate: firstAirDate ?? this.firstAirDate,
    genres: genres ?? this.genres,
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

  factory TvSeriesModel.fromJson(Map<String, dynamic> json) =>
      _$TvSeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvSeriesModelToJson(this);
}
