// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChangePasswordRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordRequest(
    userName: json['userName'] as String,
    oldPassword: json['oldPassword'] as String,
    newPassword: json['newPassword'] as String,
  );
}

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
