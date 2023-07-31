import 'package:json_annotation/json_annotation.dart';
import '../entity/cart_entity.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<CartEntity> allCartEntity;

  CartResponse({required this.success, required this.allCartEntity});

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
