// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterationRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterationRequest _$RegisterationRequestFromJson(Map<String, dynamic> json) {
  return RegisterationRequest(
    userName: json['userName'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    fullName: json['fullName'] as String,
    companyId: json['companyId'] as String,
    employeeCode: json['employeeCode'] as String,
  );
}

Map<String, dynamic> _$RegisterationRequestToJson(
        RegisterationRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'companyId': instance.companyId,
      'employeeCode': instance.employeeCode,
    };
