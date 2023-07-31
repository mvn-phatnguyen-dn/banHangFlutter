import 'package:json_annotation/json_annotation.dart';

import '../entity/info_user_entity.dart';

part 'info_user_response.g.dart';

@JsonSerializable()
class InfoUserResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'data')
  final InfoUserEntity infoUserEntity;

  InfoUserResponse({required this.success, required this.infoUserEntity});

  factory InfoUserResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserResponseToJson(this);
}
