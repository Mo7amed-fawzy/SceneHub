import 'package:ai_movie_app/feature/tv_series/data/models/cast/cast.dart';
import 'package:ai_movie_app/feature/tv_series/domain/entities/cast_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_cast_model.g.dart';

@JsonSerializable()
class TvCastModel extends TvCastEntity {
  @JsonKey(name: "cast")
  final List<Cast>? castModel;
  @JsonKey(name: "crew")
  final List<dynamic>? crew;
  @JsonKey(name: "id")
  final int? id;

  @override
  List<CastEntity>? get cast => castModel?.cast<CastEntity>();

  TvCastModel({this.castModel, this.crew, this.id})
    : super(cast: castModel?.cast<CastEntity>());

  TvCastModel copyWith({List<Cast>? castModel, List<dynamic>? crew, int? id}) =>
      TvCastModel(
        castModel: castModel ?? this.castModel,
        crew: crew ?? this.crew,
        id: id ?? this.id,
      );

  factory TvCastModel.fromJson(Map<String, dynamic> json) =>
      _$TvCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$TvCastModelToJson(this);
}
