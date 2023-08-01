// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListTransactionResponse _$ListTransactionResponseFromJson(
        Map<String, dynamic> json) =>
    ListTransactionResponse(
      success: json['success'] as bool,
      listTransactionEntity: (json['data'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTransactionResponseToJson(
        ListTransactionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.listTransactionEntity,
    };
