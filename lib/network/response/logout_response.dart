import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

@JsonSerializable()
class LogoutResponse {
  @JsonKey(name: 'success')
  final bool success;

  LogoutResponse({required this.success});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
