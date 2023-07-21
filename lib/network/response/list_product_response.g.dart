// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductResponse _$ListProductResponseFromJson(Map<String, dynamic> json) =>
    ListProductResponse(
      success: json['success'] as bool,
      listProductEntity: (json['data'] as List<dynamic>)
          .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductResponseToJson(
        ListProductResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.listProductEntity,
    };
