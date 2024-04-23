// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) {
  return ProfileInfo(
    employeeId: json['employeeId'] as int?,
    employeeName: json['employeeName'] as String?,
    employeeCode: json['employeeCode'] as String?,
    contactMobile: json['contactMobile'] as String?,
    address: json['address'] as String?,
    email: json['email'] as String?,
  );
}

Map<String, dynamic> _$ProfileInfoToJson(ProfileInfo instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'employeeCode': instance.employeeCode,
      'contactMobile': instance.contactMobile,
      'address': instance.address,
      'email': instance.email,
    };
