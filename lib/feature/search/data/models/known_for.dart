import 'package:ai_movie_app/feature/search/data/models/search_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'known_for.g.dart';

@JsonSerializable()
class KnownFor {
  @JsonKey(name: "adult")
  final bool? adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "media_type")
  final String? mediaType;
  @JsonKey(name: "original_language")
  final String? originalLanguage;
  @JsonKey(name: "genre_ids")
  final List<int>? genreIds;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "release_date")
  final DateTime? releaseDate;
  @JsonKey(name: "video")
  final bool? video;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "original_name")
  final String? originalName;
  @JsonKey(name: "first_air_date")
  final DateTime? firstAirDate;
  @JsonKey(name: "origin_country")
  final List<String>? originCountry;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
    this.originCountry,
  });

  KnownFor copyWith({
    bool? adult,
    String? backdropPath,
    int? id,
    String? title,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? mediaType,
    String? originalLanguage,
    List<int>? genreIds,
    double? popularity,
    DateTime? releaseDate,
    bool? video,
    double? voteAverage,
    int? voteCount,
    String? name,
    String? originalName,
    DateTime? firstAirDate,
    List<String>? originCountry,
  }) => KnownFor(
    adult: adult ?? this.adult,
    backdropPath: backdropPath ?? this.backdropPath,
    id: id ?? this.id,
    title: title ?? this.title,
    originalTitle: originalTitle ?? this.originalTitle,
    overview: overview ?? this.overview,
    posterPath: posterPath ?? this.posterPath,
    mediaType: mediaType ?? this.mediaType,
    originalLanguage: originalLanguage ?? this.originalLanguage,
    genreIds: genreIds ?? this.genreIds,
    popularity: popularity ?? this.popularity,
    releaseDate: releaseDate ?? this.releaseDate,
    video: video ?? this.video,
    voteAverage: voteAverage ?? this.voteAverage,
    voteCount: voteCount ?? this.voteCount,
    name: name ?? this.name,
    originalName: originalName ?? this.originalName,
    firstAirDate: firstAirDate ?? this.firstAirDate,
    originCountry: originCountry ?? this.originCountry,
  );

  factory KnownFor.fromJson(Map<String, dynamic> json) =>
      _$KnownForFromJson(json);

  Map<String, dynamic> toJson() => _$KnownForToJson(this);
}
