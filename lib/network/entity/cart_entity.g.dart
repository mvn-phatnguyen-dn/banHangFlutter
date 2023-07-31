// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartEntity _$CartEntityFromJson(Map<String, dynamic> json) => CartEntity(
      id: json['id'] as int,
      productName: json['product_name'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      imageProduct: json['image_product'] as String,
    );

Map<String, dynamic> _$CartEntityToJson(CartEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'image_product': instance.imageProduct,
    };
