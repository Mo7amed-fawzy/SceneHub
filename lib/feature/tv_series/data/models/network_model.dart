import 'package:json_annotation/json_annotation.dart';

part 'network_model.g.dart';

@JsonSerializable()
class NetworkModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "logo_path")
  final String? logoPath;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "origin_country")
  final String originCountry;

  NetworkModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  NetworkModel copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) => NetworkModel(
    id: id ?? this.id,
    logoPath: logoPath ?? this.logoPath,
    name: name ?? this.name,
    originCountry: originCountry ?? this.originCountry,
  );

  factory NetworkModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkModelToJson(this);
}
