import 'package:json_annotation/json_annotation.dart';
part 'ChangePasswordRequest.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  @JsonKey(name: "userName")
  final String userName;

  @JsonKey(name: "oldPassword")
  final String oldPassword;

  @JsonKey(name: "newPassword")
  final String newPassword;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  ChangePasswordRequest({
    required this.userName,
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
