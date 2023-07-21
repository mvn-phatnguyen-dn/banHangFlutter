import 'package:json_annotation/json_annotation.dart';

part 'product_entity.g.dart';

@JsonSerializable()
class ProductEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image_product')
  final String imageProduct;

  @JsonKey(name: 'discount')
  final int discount;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'price')
  final int price;

  @JsonKey(name: 'view')
  final int view;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  ProductEntity(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.imageProduct,
      required this.discount,
      required this.content,
      required this.price,
      required this.view,
      required this.createdAt,
      required this.updatedAt});

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);
}
