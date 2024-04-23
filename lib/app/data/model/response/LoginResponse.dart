import 'package:elearning/app/data/model/User.dart';
import 'package:elearning/app/data/model/response/ThorResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse extends ThorResponse {
  User? user;

  LoginResponse({required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
