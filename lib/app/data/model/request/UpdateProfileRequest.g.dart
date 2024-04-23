// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateProfileRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(Map<String, dynamic> json) {
  return UpdateProfileRequest(
    employeeId: json['employeeId'] as int,
    contactMobile: json['contactMobile'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'contactMobile': instance.contactMobile,
      'address': instance.address,
    };
