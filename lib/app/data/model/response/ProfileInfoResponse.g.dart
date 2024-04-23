// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileInfoResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileInfoResponse _$ProfileInfoResponseFromJson(Map<String, dynamic> json) {
  return ProfileInfoResponse(
    profileInfo: ProfileInfo.fromJson(json['profile'] as Map<String, dynamic>),
  )
    ..responseCode = json['responseCode'] as String?
    ..responseMessage = json['responseMessage'] as String?;
}

Map<String, dynamic> _$ProfileInfoResponseToJson(
        ProfileInfoResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'profile': instance.profileInfo,
    };
