import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final String data;

  AddToCartResponse({required this.success, required this.data});

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}
