import 'package:ai_movie_app/feature/tv_series/data/models/cast/cast.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_cast_model.g.dart';

@JsonSerializable()
class TvCastModel {
  @JsonKey(name: "cast")
  final List<Cast>? cast;
  @JsonKey(name: "crew")
  final List<dynamic>? crew;
  @JsonKey(name: "id")
  final int? id;

  TvCastModel({this.cast, this.crew, this.id});

  TvCastModel copyWith({List<Cast>? cast, List<dynamic>? crew, int? id}) =>
      TvCastModel(
        cast: cast ?? this.cast,
        crew: crew ?? this.crew,
        id: id ?? this.id,
      );

  factory TvCastModel.fromJson(Map<String, dynamic> json) =>
      _$TvCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvCastModelToJson(this);
}
