import 'package:ai_movie_app/feature/home/domain/entities/movies_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_details_model.g.dart';

@JsonSerializable()
class HomeMoviesDetailsModel extends HomeMoviesDetailsEntity {
  HomeMoviesDetailsModel({
    super.id,
    super.title,
    super.overview,
    super.posterPath,
    super.backdropPath,
    super.releaseDate,
    super.voteAverage,
    super.runtime,
  });

  factory HomeMoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return HomeMoviesDetailsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] != null
          ? DateTime.tryParse(json['release_date'])
          : null,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      runtime: json['runtime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => _$MoviesDetailsModelToJson(this);

  factory HomeMoviesDetailsModel.fromEntity(HomeMoviesDetailsEntity entity) {
    return HomeMoviesDetailsModel(
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
}
