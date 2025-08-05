import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  GenreModel({required this.id, required this.name});

  GenreModel copyWith({int? id, String? name}) =>
      GenreModel(id: id ?? this.id, name: name ?? this.name);

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
