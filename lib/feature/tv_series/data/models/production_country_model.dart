import 'package:json_annotation/json_annotation.dart';

part 'production_country_model.g.dart';

@JsonSerializable()
class ProductionCountryModel {
  @JsonKey(name: "iso_3166_1")
  final String iso31661;
  @JsonKey(name: "name")
  final String name;

  ProductionCountryModel({required this.iso31661, required this.name});

  ProductionCountryModel copyWith({String? iso31661, String? name}) =>
      ProductionCountryModel(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryModelToJson(this);
}
