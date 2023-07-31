import 'package:json_annotation/json_annotation.dart';

part 'info_user_entity.g.dart';

@JsonSerializable()
class InfoUserEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  InfoUserEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InfoUserEntity.fromJson(Map<String, dynamic> json) =>
      _$InfoUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserEntityToJson(this);
}
