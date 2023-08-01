import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class TransactionEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'user_phone')
  final String userPhone;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'amount')
  final int amount;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'status')
  final int status;

  TransactionEntity({
    required this.id,
    required this.userName,
    required this.userPhone,
    required this.address,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}
