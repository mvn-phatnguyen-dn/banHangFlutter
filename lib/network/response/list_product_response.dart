import 'package:json_annotation/json_annotation.dart';
import '../entity/product_entity.dart';

part 'list_product_response.g.dart';

@JsonSerializable()
class ListProductResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<ProductEntity> listProductEntity;

  ListProductResponse({required this.success, required this.listProductEntity});

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductResponseToJson(this);
}
