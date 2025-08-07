import 'package:ai_movie_app/core/models/genre_model.dart';
import 'package:ai_movie_app/core/models/production_country_model.dart';
import 'package:ai_movie_app/core/models/spoken_language_model.dart';
import 'package:ai_movie_app/feature/movies/data/models/production_company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_details_model.g.dart';

@JsonSerializable()
class MoviesDetailsModel {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "belongs_to_collection")
  final dynamic belongsToCollection;
  @JsonKey(name: "budget")
  final int? budget;
  @JsonKey(name: "genres")
  final List<GenreModel>? genres;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "imdb_id")
  final String? imdbId;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "production_companies")
  final List<ProductionCompanyModel>? productionCompanies;
  @JsonKey(name: "production_countries")
  final List<ProductionCountryModel>? productionCountries;
  @JsonKey(name: "release_date")
  final DateTime? releaseDate;
  @JsonKey(name: "revenue")
  final int? revenue;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "spoken_languages")
  final List<SpokenLanguageModel>? spokenLanguages;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "tagline")
  final String? tagline;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MoviesDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MoviesDetailsModel copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<GenreModel>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompanyModel>? productionCompanies,
    List<ProductionCountryModel>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguageModel>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) => MoviesDetailsModel(
    adult: adult ?? this.adult,
    backdropPath: backdropPath ?? this.backdropPath,
    belongsToCollection: belongsToCollection ?? this.belongsToCollection,
    budget: budget ?? this.budget,
    genres: genres ?? this.genres,
    homepage: homepage ?? this.homepage,
    id: id ?? this.id,
    imdbId: imdbId ?? this.imdbId,
    originCountry: originCountry ?? this.originCountry,
    originalLanguage: originalLanguage ?? this.originalLanguage,
    originalTitle: originalTitle ?? this.originalTitle,
    overview: overview ?? this.overview,
    popularity: popularity ?? this.popularity,
    posterPath: posterPath ?? this.posterPath,
    productionCompanies: productionCompanies ?? this.productionCompanies,
    productionCountries: productionCountries ?? this.productionCountries,
    releaseDate: releaseDate ?? this.releaseDate,
    revenue: revenue ?? this.revenue,
    runtime: runtime ?? this.runtime,
    spokenLanguages: spokenLanguages ?? this.spokenLanguages,
    status: status ?? this.status,
    tagline: tagline ?? this.tagline,
    title: title ?? this.title,
    video: video ?? this.video,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
  );

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDetailsModelToJson(this);
}
