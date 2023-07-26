import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_input_model.g.dart';

@JsonSerializable()
class AddToCartInputModel {
  const AddToCartInputModel({
    required this.quantity,
  });

  factory AddToCartInputModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartInputModelFromJson(json);

  @JsonKey(name: 'quantity')
  final int quantity;

  Map<String, dynamic> toJson() => _$AddToCartInputModelToJson(this);
}
