import 'package:json_annotation/json_annotation.dart';

part 'cart_entity.g.dart';

@JsonSerializable()
class CartEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'product_name')
  final String productName;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'price')
  final int price;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'image_product')
  final String imageProduct;

  CartEntity({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.imageProduct,
  });

  factory CartEntity.fromJson(Map<String, dynamic> json) =>
      _$CartEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartEntityToJson(this);
}
