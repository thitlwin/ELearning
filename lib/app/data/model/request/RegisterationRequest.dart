import 'package:json_annotation/json_annotation.dart';
part 'RegisterationRequest.g.dart';

@JsonSerializable()
class RegisterationRequest {
  @JsonKey(name: "userName")
  final String userName;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "password")
  final String password;

  @JsonKey(name: "fullName")
  final String fullName;

  @JsonKey(name: "companyId")
  final String companyId;

  @JsonKey(name: "employeeCode")
  final String employeeCode;

  RegisterationRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.fullName,
    required this.companyId,
    required this.employeeCode,
  });
  factory RegisterationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterationRequestToJson(this);
}
