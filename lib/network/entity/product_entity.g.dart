// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) =>
    ProductEntity(
      id: json['id'] as int,
      categoryId: json['category_id'] as int,
      name: json['name'] as String,
      imageProduct: json['image_product'] as String,
      discount: json['discount'] as int,
      content: json['content'] as String,
      price: json['price'] as int,
      view: json['view'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ProductEntityToJson(ProductEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'image_product': instance.imageProduct,
      'discount': instance.discount,
      'content': instance.content,
      'price': instance.price,
      'view': instance.view,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
