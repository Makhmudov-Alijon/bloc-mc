// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModelList _$CategoryModelListFromJson(Map<String, dynamic> json) =>
    CategoryModelList(
      json['categories'] as List<CategoryModelItem>,
      json['count'] as String,
    );

Map<String, dynamic> _$CategoryModelListToJson(CategoryModelList instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'count': instance.count,
    };
