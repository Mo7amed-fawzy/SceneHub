import 'package:ai_movie_app/feature/search/data/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchingModel {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<Result>? results;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  SearchingModel({this.page, this.results, this.totalPages, this.totalResults});

  SearchingModel copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) => SearchingModel(
    page: page ?? this.page,
    results: results ?? this.results,
    totalPages: totalPages ?? this.totalPages,
    totalResults: totalResults ?? this.totalResults,
  );

  factory SearchingModel.fromJson(Map<String, dynamic> json) =>
      _$SearchingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchingModelToJson(this);
}
