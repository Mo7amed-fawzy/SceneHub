import 'package:ai_movie_app/feature/tv_series/domain/entities/genre_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel extends GenreEntity {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  GenreModel({this.id, this.name}) : super(name: name);

  GenreModel copyWith({int? id, String? name}) =>
      GenreModel(id: id ?? this.id, name: name ?? this.name);

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
