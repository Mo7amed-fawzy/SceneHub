// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchingModel _$SearchingModelFromJson(Map<String, dynamic> json) =>
    SearchingModel(
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchingModelToJson(SearchingModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
