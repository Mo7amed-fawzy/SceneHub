import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'movies_details_model.g.dart';

@JsonSerializable()
class HomeMoviesDetailsModel extends HomeMediaEntity {
  HomeMoviesDetailsModel({
    required super.mediaType,
    super.id,
    super.title,
    super.overview,
    super.posterPath,
    super.backdropPath,
    super.releaseDate,
    super.voteAverage,
    super.runtime,
  });

  factory HomeMoviesDetailsModel.fromJson(
    Map<String, dynamic> json, {
    required String mediaType,
  }) {
    return HomeMoviesDetailsModel(
      mediaType: mediaType,
      id: json['id'] as int?,
      title: json['title'] as String? ?? json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] != null
          ? DateTime.tryParse(json['release_date'])
          : json['first_air_date'] != null
          ? DateTime.tryParse(json['first_air_date'])
          : null,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      runtime:
          json['runtime'] as int? ??
          (json['episode_run_time'] != null &&
                  (json['episode_run_time'] as List).isNotEmpty
              ? (json['episode_run_time'] as List).first as int
              : null),
    );
  }

  Map<String, dynamic> toJson() => _$HomeMoviesDetailsModelToJson(this);

  factory HomeMoviesDetailsModel.fromEntity(HomeMediaEntity entity) {
    return HomeMoviesDetailsModel(
      mediaType: entity.mediaType,
      id: entity.id,
      title: entity.title,
      overview: entity.overview,
      posterPath: entity.posterPath,
      backdropPath: entity.backdropPath,
      releaseDate: entity.releaseDate,
      voteAverage: entity.voteAverage,
      runtime: entity.runtime,
    );
  }

  HomeMediaEntity toEntity() {
    return HomeMediaEntity(
      mediaType: mediaType,
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      runtime: runtime,
    );
  }
}
