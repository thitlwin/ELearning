// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['employeeId'] as int?,
    json['userName'] as String?,
    json['email'] as String?,
    json['token'] as String?,
    json['requireChangePassword'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'employeeId': instance.employeeId,
      'userName': instance.userName,
      'email': instance.email,
      'token': instance.token,
      'requireChangePassword': instance.requireChangePassword,
    };
