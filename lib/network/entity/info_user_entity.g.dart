// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUserEntity _$InfoUserEntityFromJson(Map<String, dynamic> json) =>
    InfoUserEntity(
      id: json['id'] as int,
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$InfoUserEntityToJson(InfoUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
