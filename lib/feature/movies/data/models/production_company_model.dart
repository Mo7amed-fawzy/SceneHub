import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompanyModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "origin_country")
  final String? originCountry;

  ProductionCompanyModel({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompanyModel copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) => ProductionCompanyModel(
    id: id ?? this.id,
    logoPath: logoPath ?? this.logoPath,
    name: name ?? this.name,
    originCountry: originCountry ?? this.originCountry,
  );

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}
