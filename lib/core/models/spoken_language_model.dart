import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel {
  @JsonKey(name: "english_name")
  final String? englishName;
  @JsonKey(name: "iso_639_1")
  final String? iso6391;
  @JsonKey(name: "name")
  final String? name;

  SpokenLanguageModel({this.englishName, this.iso6391, this.name});

  SpokenLanguageModel copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) => SpokenLanguageModel(
    englishName: englishName ?? this.englishName,
    iso6391: iso6391 ?? this.iso6391,
    name: name ?? this.name,
  );

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
