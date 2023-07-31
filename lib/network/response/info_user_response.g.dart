// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUserResponse _$InfoUserResponseFromJson(Map<String, dynamic> json) =>
    InfoUserResponse(
      success: json['success'] as bool,
      infoUserEntity:
          InfoUserEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoUserResponseToJson(InfoUserResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.infoUserEntity,
    };
