import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? employeeId;
  final String? userName;
  final String? email;
  final String? token;
  final bool requireChangePassword;

  User(this.employeeId, this.userName, this.email, this.token,
      this.requireChangePassword);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props =>
      [employeeId, userName, email, requireChangePassword];
}
