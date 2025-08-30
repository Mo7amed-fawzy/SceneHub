import 'package:ai_movie_app/feature/search/data/models/known_for.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "id")
  final int? id;

  // Common fields for movies and TV shows
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "media_type")
  final String? mediaType;

  // Movie-specific fields
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "video")
  final bool? video;

  // TV show-specific fields
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "first_air_date")
  final String? firstAirDate;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;

  // Person-specific fields
  @JsonKey(name: "gender")
  final int? gender;
  @JsonKey(name: "known_for_department")
  final String? knownForDepartment;
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey(name: "known_for")
  final List<KnownFor>? knownFor;

  Result({
    this.adult,
    this.id,
    this.backdropPath,
    this.overview,
    this.posterPath,
    this.originalLanguage,
    this.genreIds,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.mediaType,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.video,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
  });

  Result copyWith({
    bool? adult,
    int? id,
    String? backdropPath,
    String? overview,
    String? posterPath,
    String? originalLanguage,
    List<int>? genreIds,
    double? voteAverage,
    int? voteCount,
    double? popularity,
    String? mediaType,
    String? title,
    String? originalTitle,
    String? releaseDate,
    bool? video,
    String? name,
    String? originalName,
    String? firstAirDate,
    List<String>? originCountry,
    int? gender,
    String? knownForDepartment,
    String? profilePath,
    List<KnownFor>? knownFor,
  }) => Result(
    adult: adult ?? this.adult,
    id: id ?? this.id,
    backdropPath: backdropPath ?? this.backdropPath,
    overview: overview ?? this.overview,
    posterPath: posterPath ?? this.posterPath,
    originalLanguage: originalLanguage ?? this.originalLanguage,
    genreIds: genreIds ?? this.genreIds,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
    popularity: popularity ?? this.popularity,
    mediaType: mediaType ?? this.mediaType,
    title: title ?? this.title,
    originalTitle: originalTitle ?? this.originalTitle,
    releaseDate: releaseDate ?? this.releaseDate,
    video: video ?? this.video,
    name: name ?? this.name,
    originalName: originalName ?? this.originalName,
    firstAirDate: firstAirDate ?? this.firstAirDate,
    originCountry: originCountry ?? this.originCountry,
    gender: gender ?? this.gender,
    knownForDepartment: knownForDepartment ?? this.knownForDepartment,
    profilePath: profilePath ?? this.profilePath,
    knownFor: knownFor ?? this.knownFor,
  );

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
