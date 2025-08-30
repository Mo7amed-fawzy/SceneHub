import 'package:ai_movie_app/feature/search/data/models/known_for.dart';
import 'package:ai_movie_app/feature/search/data/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchingModel {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<Result>? results;

  SearchingModel({this.page, this.results});

  SearchingModel copyWith({int? page, List<Result>? results}) =>
      SearchingModel(page: page ?? this.page, results: results ?? this.results);

  factory SearchingModel.fromJson(Map<String, dynamic> json) =>
      _$SearchingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchingModelToJson(this);
}
