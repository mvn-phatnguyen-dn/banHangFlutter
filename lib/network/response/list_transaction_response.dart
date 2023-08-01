import 'package:json_annotation/json_annotation.dart';
import '../entity/transaction.dart';

part 'list_transaction_response.g.dart';

@JsonSerializable()
class ListTransactionResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final List<TransactionEntity> listTransactionEntity;

  ListTransactionResponse(
      {required this.success, required this.listTransactionEntity});

  factory ListTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListTransactionResponseToJson(this);
}
